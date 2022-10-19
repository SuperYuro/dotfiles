# install RPM Fusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install Google Chrome
dnf install -y google-chrome-stable

# install Vivaldi Browser
# dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
# dnf install -y vivaldi-stable

# install Brave Browser
# dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
# rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
# dnf install -y brave-browser

# install Visual Studio Code
# rpm --import https://packages.microsoft.com/keys/microsoft.asc
# sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
# dnf install -y code

# install Development Tools
dnf groupinstall -y 'Development Tools'
dnf groupinstall -y 'C Development Tools and Libraries'
dnf groupinstall -y 'Editors'
dnf groupinstall -y 'Engineering and Scientific'
dnf groupinstall -y 'Neuron Modelling Simulators'
dnf groupinstall -y 'Python Science'

# dnf install -y VirtualBox
dnf install -y wine

# install Creativity Tools
# dnf groupinstall -y '3D Printing'
dnf groupinstall -y 'Audio Production'
dnf groupinstall -y 'Design Suite'

# install Document Tools
dnf groupinstall -y 'Authoring and Publishing'
dnf groupinstall -y 'Office/Productivity'

# install LaTeX Tools
dnf install -y texlive-scheme-full

# install Japanese Input Method
dnf install -y ibus-mozc

# install ime for editor
dnf install -y emacs-mozc

# install Fonts
dnf install -y google-noto-sans-fonts
dnf install -y google-noto-serif-fonts
dnf install -y cascadia-fonts-all

# install github cli
dnf install -y gh

# update
dnf update -y
