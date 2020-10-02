# Necessary
echo "Install necessary groups"
sudo dnf groupinstall -y "C Development Tools and Libraries"\
	"D Development Tools and Libraries"\
	"Development Tools"\
	"Administration Tools"\
	"System Tools"\
	"Engineering and Scientific"\
	"Python Science"

echo "Install necessary packages"
sudo dnf install -y julia npm sagemath\
	zsh zsh-syntax-highlighting\
       	zathura zathura-djvu zathura-ps zathura-pdf-mupdf zathura-zsh-completion\
	pandoc pandoc-citeproc\
	python3-jupyter-console python3-jupyterlab-launcher python3-metakernel\
	python3-nbconvert root-notebook R-IRkernel xeus sphinx\
	fd-find the_silver_searcher\
	neovim python3-neovim htop\
	ffmpeg ffmpeg-devel\
	netcdf python3-netcdf4\
	powerline powerline-fonts\
	cmake gdb clang\
	xclip cascadia-code-fonts\
       	google-noto-sans-fonts google-noto-emoji-color-fonts\
	google-noto-cjk-fonts\
	hplip system-config-printer cups\
	mozilla-fira-sans-fonts mozilla-fira-mono-fonts\
	naver-nanum-gothic-fonts naver-nanum-myeongjo-fonts\
	naver-nanum-barun-gothic-fonts naver-nanum-gothic-coding-fonts


echo "Install High energy physics related programs"
sudo dnf install -y root-physics HepMC pythia8 lhapdf 

echo "Install packages for laptop"
sudo dnf install -y okular okular-libs okular-devel\
       	pdfmod pdfshuffler\
	gnome-tweaks filezilla
