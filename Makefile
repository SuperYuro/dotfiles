all:
	@echo "This is SuperYuro's automated installation script."
	@echo "You can use following command to install packages and configrations."
	@echo ""
	@echo " laptop...Install i3-gaps wm and some development tools on ArchLinux on Laptop PC."
	@echo "desktop...Install openbox wm and some development tools on ArchLinux on Desktop PC."
	@echo "   wsl2...Install some development tools on Ubuntu on WSL2."
	@echo " nvidia...Install nvidia driver on Ubuntu on WSL2."

laptop:
	@sh ~/dotfiles/installs/laptop/install.sh
	@sh ~/dotfiles/installs/laptop/config.sh
	@fish ~/dotfiles/installs/laptop/config.fish

desktop:
	@sh ~/dotfiles/installs/desktop/install.sh
	@sh ~/dotfiles/installs/desktop/config.sh
	@fish ~/dotfiles/installs/desktop/config.fish

wsl2:
	@sh ~/dotfiles/installs/wsl2/install.sh
	@sh ~/dotfiles/installs/wsl2/config.sh
	@sh ~/dotfiles/installs/wsl2/interactive.sh
	@fish ~/dotfiles/installs/wsl2/config.fish

nvidia:
	@sh ~/dotfiles/installs/wsl2/nvidia.sh
