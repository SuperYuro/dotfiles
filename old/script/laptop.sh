#!/bin/bash -e

paru -S tlp tlp-rdw acpi_call acpi --noconfirm
sudo cp ~/dotfiles/laptop/tlp/*.conf /etc/tlp.d/
sudo systemctl enable --now tlp
