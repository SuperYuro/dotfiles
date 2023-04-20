sudo New-Item -Value "$env:USERPROFILE\dotfiles\windows\config\PowerToys" -Path "$env:USERPROFILE\Documents" -Name "PowerToys" -ItemType SymbolicLink
sudo New-Item -Value "$env:USERPROFILE\dotfiles\windows\config\PowerShell" -Path "$env:USERPROFILE\Documents" -Name "PowerToys" -ItemType SymbolicLink
sudo New-Item -Value "$env:USERPROFILE\dotfiles\config\.gitignore" -Path "$env:USERPROFILE" -Name ".gitignore" -ItemType SymbolicLink

git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
sudo New-Item -Value "$env:USERPROFILE\dotfiles\config\nvim" -Path "$env:LOCALAPPDATA" -Name "nvim" -ItemType SymbolicLink
