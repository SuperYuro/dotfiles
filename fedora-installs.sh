dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm fedora-workstation-repositories
dnf update -y
dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
dnf config-mnager --set-enabled google-chrome
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf install -y gcc g++ gdb make automake cmake kernel-devel git vim VirtualBox wine google-chrome-stable brave-browser code texlive-scheme-full libreoffice python3 ibus-mozc google-noto-sans-fonts cascadia-fonts-all docker-ce docker-ce-cli containerd.io
dnf update -y
