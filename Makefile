SCRIPTDIR = ~/dotfiles/installs

all:
	@echo " laptop...Install i3-gaps wm and some development tools on ArchLinux for Laptop."
	@echo "desktop...Install cinnamon desktop and some development tools on ArchLinux for Desktop."
	@echo "   wsl2...Install some development tools on Ubuntu on WSL2."
	@echo " nvidia...Install nvidia driver on Ubuntu on WSL2."
	@echo " docker...Install docker and docker-compose on Ubuntu."
	@echo "firefox...Install firefox customize css."

laptop:
	@bash ${SCRIPTDIR}/archlinux/general/install.sh
	@bash ${SCRIPTDIR}/archlinux/gui/install.sh
	@bash ${SCRIPTDIR}/archlinux/laptop/install.sh
	@bash ${SCRIPTDIR}/archlinux/general/config.sh
	@bash ${SCRIPTDIR}/archlinux/gui/config.sh
	@bash ${SCRIPTDIR}/archlinux/laptop/config.sh

desktop:
	@bash ${SCRIPTDIR}/archlinux/general/install.sh
	@bash ${SCRIPTDIR}/archlinux/gui/install.sh
	@bash ${SCRIPTDIR}/archlinux/desktop/install.sh
	@bash ${SCRIPTDIR}/archlinux/general/config.sh
	@bash ${SCRIPTDIR}/archlinux/gui/config.sh
	@bash ${SCRIPTDIR}/archlinux/desktop/config.sh

cli:
	@bash ${SCRIPTDIR}/archlinux/general/install.sh
	@bash ${SCRIPTDIR}/archlinux/general/config.sh

wsl2:
	@bash ~/dotfiles/installs/wsl2/interactive.sh
	@bash ~/dotfiles/installs/wsl2/install.sh
	@bash ~/dotfiles/installs/wsl2/config.sh

fish:
	@fish ~/dotfiles/installs/config/config.fish

nvidia:
	@bash ~/dotfiles/installs/wsl2/nvidia.sh

docker:
	@bash ~/dotfiles/installs/wsl2/docker.sh

firefox:
	@bash ~/dotfiles/installs/config/firefox.sh
