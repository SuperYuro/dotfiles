# Editor
sudo pacman -S neovim emacs --noconfirm
paru -S visual-studio-code-bin --noconfirm

# Web Browser
sudo pacman -S firefox --noconfirm
paru -S google-chrome --noconfirm
paru -S brave-bin --noconfirm

# C Development Tools
sudo pacman -S gcc g++ gdb make automake cmake --noconfirm

# Python Development Tools
sudo pacman -S python3 python3-pip --noconfirm

# LaTeX
sudo pacman -S texlive-langjapanese texlive-most ghostscript evince poppler-data --noconfirm

# Fonts
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-extra --noconfirm
sudo pacman -S ttf-cascadia-code --noconfirm

# Japanese IME
paru -S ibus-mozc --noconfirm
paru -S emacs-mozc --noconfirm

# Virtual Machine and Container
sudo pacman -S virtualbox virtualbox-host-modules-arch --noconfirm
sudo pacman -S docker docker-compose --noconfirm

sudo systemctl enable docker
sudo systemctl start docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker

# Terminal Emulator
sudo pacman -S rxvt-unicode --noconfirm

# TLP
sudo pacman -S tlp tlp-rdw tp_smapi acpi-call

# Keyboard Customization
sudo pacman -S xorg-xmodmap
