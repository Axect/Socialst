#!/usr/bin/env fish
# Update onorca-bin (Orca IDE) straight from GitHub releases instead of the AUR.
# Downloads the upstream .deb in parallel byte ranges through the airport proxy,
# verifies it against the GitHub asset digest, builds a local onorca-bin package
# (same name/layout as the AUR PKGBUILD) and installs it with pacman, so pacman
# still owns /opt/Orca and yay treats the result as the same package.

function echo_info
    set_color cyan
    echo -n "[onorca-updater] "
    set_color normal
    echo $argv
end

function echo_success
    set_color green
    echo -n "✓ "
    set_color normal
    echo $argv
end

function echo_warn
    set_color yellow
    echo -n "! "
    set_color normal
    echo $argv
end

function echo_err
    set_color red
    echo -n "[Error] "
    set_color normal
    echo $argv
end

argparse 'f/force' 'h/help' 'c/check' -- $argv
or exit 1

if set -q _flag_help
    echo "Usage: update-onorca [options]"
    echo ""
    echo "Options:"
    echo "  -c, --check    Check for updates without installing"
    echo "  -f, --force    Rebuild and reinstall even if already up to date"
    echo "  -h, --help     Show this help message"
    exit 0
end

set -l pkgname onorca-bin
set -l repo stablyai/orca

set -l current_ver unknown
set -l current_raw (pacman -Q $pkgname 2>/dev/null)
if test $status -eq 0
    # "onorca-bin 1.4.232-1" -> "1.4.232"
    set current_ver (string replace -r '^\S+\s+(.*)-[^-]+$' '$1' -- "$current_raw")
end
echo_info "Current version: $current_ver"

set -l auth_header
if set -q GITHUB_TOKEN
    set auth_header -H "Authorization: Bearer $GITHUB_TOKEN"
else if set -q GH_TOKEN
    set auth_header -H "Authorization: Bearer $GH_TOKEN"
end

echo_info "Checking latest version on GitHub..."
set -l release_json (curl -s $auth_header "https://api.github.com/repos/$repo/releases/latest")
set -l tag_name (echo $release_json | jq -r .tag_name 2>/dev/null)

if test -z "$tag_name" -o "$tag_name" = "null"
    echo_err "Failed to fetch release metadata from GitHub API."
    set -l msg (echo $release_json | jq -r .message 2>/dev/null)
    if test -n "$msg" -a "$msg" != "null"
        echo_warn "GitHub API message: $msg"
    end
    exit 1
end

set -l latest_ver (string replace -r '^v' '' -- "$tag_name")
echo_info "Latest version:  $latest_ver ($tag_name)"

set -l cmp 1
if test "$current_ver" != unknown
    set cmp (vercmp "$latest_ver" "$current_ver")
end

if set -q _flag_check
    if test $cmp -le 0
        echo_success "$pkgname is already up to date."
    else
        echo_warn "Update available: $current_ver -> $latest_ver"
    end
    exit 0
end

if test $cmp -le 0; and not set -q _flag_force
    echo_success "$pkgname is already up to date ($current_ver)."
    echo "  Use --force (-f) to reinstall anyway."
    exit 0
end

set -l carch (uname -m)
set -l debarch amd64
switch $carch
    case x86_64
        set debarch amd64
    case aarch64 arm64
        set carch aarch64
        set debarch arm64
    case '*'
        echo_err "Unsupported architecture: $carch"
        exit 1
end

set -l asset_name "orca-ide_"$latest_ver"_"$debarch".deb"
set -l download_url "https://github.com/$repo/releases/download/$tag_name/$asset_name"
set -l license_url "https://raw.githubusercontent.com/$repo/$tag_name/LICENSE"

set -l total_size (echo $release_json | jq -r --arg n "$asset_name" '.assets[] | select(.name == $n) | .size' 2>/dev/null)
set -l expected_sha (echo $release_json | jq -r --arg n "$asset_name" '.assets[] | select(.name == $n) | .digest' 2>/dev/null | string replace -r '^sha256:' '')
if not string match -qr '^[0-9]+$' -- "$total_size"
    echo_err "Asset $asset_name not found in release $tag_name."
    exit 1
end
if not string match -qr '^[0-9a-f]{64}$' -- "$expected_sha"
    echo_err "GitHub API returned no sha256 digest for $asset_name."
    exit 1
end

set -l cache_root "$HOME/.cache/onorca-update"
set -l build_dir "$cache_root/$latest_ver"
set -l deb_file "$build_dir/$asset_name"
mkdir -p "$build_dir"

# makepkg-fastdl: parallel byte ranges with stall resume, airport proxy for GitHub.
set -l have_deb 0
if test -f "$deb_file"; and test (sha256sum "$deb_file" | string split -f1 ' ') = "$expected_sha"
    set have_deb 1
    echo_success "Reusing verified $asset_name from $build_dir"
end

if test $have_deb -eq 0
    echo_info "Downloading $asset_name ("(math --scale=1 "$total_size / 1048576")" MiB)..."
    echo "  URL: $download_url"
    makepkg-fastdl "$download_url" "$deb_file.part"
    and mv -f "$deb_file.part" "$deb_file"
    or begin
        echo_err "Download failed!"
        rm -f "$deb_file.part"
        exit 1
    end

    if test (sha256sum "$deb_file" | string split -f1 ' ') != "$expected_sha"
        echo_err "SHA256 mismatch!"
        rm -f "$deb_file"
        exit 1
    end
    echo_success "SHA256 verified"
end

set -l license_file "$build_dir/LICENSE-$latest_ver"
if not test -s "$license_file"
    makepkg-fastdl "$license_url" "$license_file" 2>/dev/null
    or begin
        echo_err "Failed to download LICENSE from $license_url"
        rm -f "$license_file"
        exit 1
    end
end
set -l license_sha (sha256sum "$license_file" | string split -f1 ' ')

# Same package layout as the AUR onorca-bin PKGBUILD, but with local sources.
printf '%s\n' \
    "pkgname=$pkgname" \
    "pkgver=$latest_ver" \
    'pkgrel=1' \
    'pkgdesc="Orca - next-gen IDE for working with a fleet of parallel coding agents"' \
    "arch=('$carch')" \
    "url=\"https://github.com/$repo\"" \
    "license=('MIT')" \
    "depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'python' 'python-gobject' 'util-linux-libs' 'xclip' 'xdg-utils' 'xdotool' 'xorg-server-xvfb')" \
    "optdepends=('libappindicator-gtk3: system tray indicator support')" \
    "provides=('orca-ide')" \
    "conflicts=('orca-ide')" \
    "options=('!strip' '!debug')" \
    "source=('LICENSE-$latest_ver' '$asset_name')" \
    "noextract=('$asset_name')" \
    "sha256sums=('$license_sha' '$expected_sha')" \
    '' \
    'package() {' \
    '    cd "$srcdir"' \
    "    bsdtar --no-same-owner -xf '$asset_name'" \
    '    bsdtar --no-same-owner -xf data.tar.* -C "$pkgdir"' \
    '    chmod 4755 "$pkgdir/opt/Orca/chrome-sandbox"' \
    '    install -d "$pkgdir/usr/bin"' \
    '    ln -s /opt/Orca/resources/bin/orca-ide "$pkgdir/usr/bin/orca-ide"' \
    '    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"' \
    '}' >"$build_dir/PKGBUILD"

echo_info "Building $pkgname $latest_ver package..."
pushd "$build_dir"
makepkg -f --noconfirm
set -l build_status $status
popd
if test $build_status -ne 0
    echo_err "makepkg failed (build dir kept: $build_dir)"
    exit 1
end

set -l pkg_file (path filter -f $build_dir/$pkgname-$latest_ver-1-$carch.pkg.tar.*)
if not set -q pkg_file[1]
    echo_err "Built package not found in $build_dir"
    exit 1
end

echo_info "Installing $pkg_file[1] (sudo)..."
sudo pacman -U --noconfirm "$pkg_file[1]"
or begin
    echo_err "pacman -U failed (package kept: $pkg_file[1])"
    exit 1
end

# Keep only the build dir of the version just installed.
for d in $cache_root/*/
    if test (path basename $d) != "$latest_ver"
        rm -rf "$d"
    end
end
rm -rf "$build_dir/src" "$build_dir/pkg" "$deb_file"

echo_success "Successfully updated $pkgname to $latest_ver!"
echo "  Installed: "(pacman -Q $pkgname)
echo "  Restart Orca to load the new version."
