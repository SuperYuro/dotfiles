
# Install Gnome Desktop
emerge gnome-base/gnome
systemctl enable gdm.service

# Install Japanese Font
emerge media-fonts/noto media-fonts/noto-cjk media-fonts/cascadia-code

# Install Japanese IME
emerge app-i18n/ibus app-i18n/ibus-qt app-i18n/mozc

# Install Emacs
emerge app-editors/emacs

# Install LaTeX
echo "app-text/texlive cjk xetex" >> /etc/portage/package.use/latex
echo "app-text/texlive-core cjk xetex" >> /etc/portage/package.use/latex

emerge app-text/texlive app-text/texlive-core

# Install Portage Overlay
gpasswd -a yuro portage
emerge laymen
echo "source /var/lib/layman/make.conf" >> /etc/portage/make.conf

# Install Brave Browser
layman -a brave-overlay
layman -s brave-overlay
emerge www-client/brave-bin::brave-overlay

# Install Visual Studio Code
echo "app-editors/vscode Microsoft-vscode" >> /etc/portage/package.license
echo ">=app-editors/vscode-1.63.2 ~amd64" >> /etc/portage/package.accept_keywords/app-editors

emerge app-editors/vscode
