# install requirement packages
sudo pacman -S git

# make install directory
cd ~/
mkdir git
cd git/

# install AUR helper
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
