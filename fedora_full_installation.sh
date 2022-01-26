# install RPM Fusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install brave browser
dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
dnf install -y brave-browser

# install Visual Studio Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf install -y code

# install Groups
dnf groupinstall -y '3d printing' 'audio production' 'authoring and publishing' 'c development tools and libraries' 'design suite' 'development tools' 'editors' 'engineering and scientific' 'neuron modelling simulators' 'office/productivity' 'python science'

# install packages
dnf install -y gcc g++ make automake cmake git vim VirtualBox wine google-chrome-stable texlive-scheme-full libreoffice ibus-mozc google-noto-sans cascadia-fonts-all

# update
dnf update -y
