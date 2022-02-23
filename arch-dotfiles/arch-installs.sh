# install editors
sudo pacman -S vim emacs
paru -S visual-studio-code-bin

# install Web Browser
sudo pacman -S firefox
paru -S google-chrome
paru -S brave-bin

# install C development tools
sudo pacman -S gcc g++ gdb make automake cmake

# install python dev tools
sudo pacman -S python3 python3-pip

# install japanese IME
paru -S ibus-mozc
paru -S emacs-mozc

# install fonts
sudo pacman -S noto-fonts-cjk noto-fonts
sudo pacman -S ttf-cascadia-code

# install texlive
sudo pacman -S texlive-langjapanese texlive-most ghostscript evince poppler-data

# install Virtual Machines
sudo pacman -S virtualbox virtualbox-host-modules-arch
sudo pacman -S docker docker-compose

sudo systemctl enable docker
sudo systemctl start docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker

# install tlp
sudo pacman -S tlp tlp-rdw tp_smapi acpi_call

# install terminal emulator
sudo pacman -S rxvt-unicode

# install backup tool
sudo pacman -S unison

# install xmodmap
sudo pacman -S xorg-xmodmap
