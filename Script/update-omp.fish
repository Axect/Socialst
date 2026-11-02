#!/usr/bin/env fish

function echo_info
    set_color cyan
    echo -n "[omp-updater] "
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

# Parse command line options
argparse 'f/force' 'h/help' 'c/check' -- $argv
or exit 1

if set -q _flag_help
    echo "Usage: update-omp [options]"
    echo ""
    echo "Options:"
    echo "  -c, --check    Check for updates without installing"
    echo "  -f, --force    Force reinstall even if already up to date"
    echo "  -h, --help     Show this help message"
    exit 0
end

# Resolve target omp executable path
set -l omp_target (command -s omp)
if test -z "$omp_target"
    set omp_target "$HOME/.bun/bin/omp"
end

# Check current version
set -l current_ver "unknown"
if test -x "$omp_target"
    set -l current_raw ($omp_target --version 2>/dev/null)
    set current_ver (string replace -r '^omp/' '' -- "$current_raw")
end

echo_info "Current version: $current_ver"

# Query GitHub API for latest release
set -l auth_header
if set -q GITHUB_TOKEN
    set auth_header -H "Authorization: Bearer $GITHUB_TOKEN"
else if set -q GH_TOKEN
    set auth_header -H "Authorization: Bearer $GH_TOKEN"
end

echo_info "Checking latest version on GitHub..."
set -l release_json (curl -s $auth_header "https://api.github.com/repos/can1357/oh-my-pi/releases/latest")
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

if set -q _flag_check
    if test "$current_ver" = "$latest_ver"
        echo_success "omp is already up to date."
    else
        echo_warn "Update available: $current_ver -> $latest_ver"
    end
    exit 0
end

if test "$current_ver" = "$latest_ver"; and not set -q _flag_force
    echo_success "omp is already up to date ($current_ver)."
    echo "  Use --force (-f) to reinstall anyway."
    exit 0
end

# Detect platform / architecture
set -l arch (uname -m)
set -l asset_name "omp-linux-x64"
if test "$arch" = "aarch64" -o "$arch" = "arm64"
    set asset_name "omp-linux-arm64"
end

set -l download_url "https://github.com/can1357/oh-my-pi/releases/download/$tag_name/$asset_name"
set -l sums_url "https://github.com/can1357/oh-my-pi/releases/download/$tag_name/SHA256SUMS.txt"
set -l target_dir (dirname "$omp_target")
mkdir -p "$target_dir"
set -l tmp_file "$target_dir/.omp.download.$fish_pid.tmp"

set -l total_size (echo $release_json | jq -r --arg n "$asset_name" '.assets[] | select(.name == $n) | .size' 2>/dev/null)
if not string match -qr '^[0-9]+$' -- "$total_size"
    echo_err "Asset $asset_name not found in release $tag_name."
    exit 1
end

# makepkg-fastdl: parallel byte ranges with stall resume, airport proxy for GitHub.
echo_info "Downloading $asset_name ("(math --scale=1 "$total_size / 1048576")" MiB)..."
echo "  URL: $download_url"
set -l t0 (date +%s)
makepkg-fastdl "$download_url" "$tmp_file"
set -l got 0
test -f "$tmp_file"; and set got (stat -c %s "$tmp_file")
if test "$got" -ne "$total_size"
    echo_err "Download failed! ($got of $total_size bytes)"
    rm -f "$tmp_file"
    exit 1
end
echo_info "Downloaded in "(math (date +%s) - $t0)"s"

set -l sums_file "$tmp_file.sums"
makepkg-fastdl "$sums_url" "$sums_file" 2>/dev/null
set -l expected_sha (string match -r "^[0-9a-f]{64}(?=\s+\*?$asset_name\$)" <"$sums_file" 2>/dev/null)
rm -f "$sums_file"
if test -z "$expected_sha"
    echo_err "Could not read checksum for $asset_name from SHA256SUMS.txt"
    rm -f "$tmp_file"
    exit 1
end
if test (sha256sum "$tmp_file" | string split -f1 ' ') != "$expected_sha"
    echo_err "SHA256 mismatch!"
    rm -f "$tmp_file"
    exit 1
end
echo_success "SHA256 verified"

chmod +x "$tmp_file"

# Verify downloaded binary
set -l new_raw ($tmp_file --version 2>/dev/null)
if test $status -ne 0
    echo_err "Downloaded file is corrupted or not executable!"
    rm -f "$tmp_file"
    exit 1
end

# Replace target binary atomically
mv -f "$tmp_file" "$omp_target"

echo_success "Successfully updated omp to $latest_ver!"
echo "  Path: $omp_target"
echo "  Version: "($omp_target --version)
