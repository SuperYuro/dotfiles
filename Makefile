all:
	@echo "This is SuperYuro's automated installation script."
	@echo "You can use following command to install packages and configrations."
	@echo ""
	@echo " laptop...Install i3-gaps wm and some development tools on ArchLinux on Laptop PC."
	@echo "desktop...Install openbox wm and some development tools on ArchLinux on Desktop PC."
	@echo "   wsl2...Install some development tools on Ubuntu on WSL2."
	@echo " nvidia...Install nvidia driver on Ubuntu on WSL2."

laptop:
	@bash ~/dotfiles/installs/laptop/install
	@bash ~/dotfiles/installs/laptop/config

desktop:
	@bash ~/dotfiles/installs/desktop/install
	@bash ~/dotfiles/installs/desktop/config

wsl2:
	@bash ~/dotfiles/installs/wsl2/interactive
	@bash ~/dotfiles/installs/wsl2/install
	@bash ~/dotfiles/installs/wsl2/config

nvidia:
	@bash ~/dotfiles/installs/wsl2/nvidia

docker:
	@bash ~/dotfiles/installs/wsl2/docker

fish:
	@fish ~/dotfiles/installs/fish/config.fish
