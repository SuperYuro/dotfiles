all:
	@echo "This is SuperYuro's automated installation script."
	@echo "You can use following command to install packages and configrations."
	@echo ""
	@echo " laptop...Install i3-gaps wm and some development tools on ArchLinux on Laptop PC."
	@echo "desktop...Install some development tools on ArchLinux on Desktop PC."
	@echo "   wsl2...Install some development tools on Ubuntu on WSL2."
	@echo " nvidia...Install nvidia driver on Ubuntu on WSL2."
	@echo " docker...Install docker and docker-compose on Ubuntu."
	@echo "firefox...Install firefox customize css."

laptop:
	@bash ~/dotfiles/installs/laptop/install.sh
	@bash ~/dotfiles/installs/laptop/config.sh

desktop:
	@bash ~/dotfiles/installs/desktop/install.sh
	@bash ~/dotfiles/installs/desktop/config.sh

wsl2:
	@bash ~/dotfiles/installs/wsl2/interactive.sh
	@bash ~/dotfiles/installs/wsl2/install.sh
	@bash ~/dotfiles/installs/wsl2/config.sh

nvidia:
	@bash ~/dotfiles/installs/wsl2/nvidia.sh

docker:
	@bash ~/dotfiles/installs/wsl2/docker.sh

firefox:
	@bash ~/dotfiles/installs/config/firefox.sh
