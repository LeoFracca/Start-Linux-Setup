#!/bin/bash

# If it is equal to 0 you are root
# This script must be run as a normal user
if [ "$EUID" = 0 ]
  then echo "You are root. Please run this script as a normal user!"
  exit 1
fi

# System update
echo "Updating your system..."
sudo dnf upgrade -y

# RPM Fusion
echo "Installing RPM Fusion..."
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Flatpak and Flathub
echo "Installing Flatpak..."
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

############################################

# Balena Etcher: to create Live USB
echo "Installing Balena Etcher..."
sudo wget https://balena.io/etcher/static/etcher-rpm.repo -O /etc/yum.repos.d/etcher-rpm.repo
sudo dnf install -y balena-etcher-electron

# Chromium: Google's open source browser
echo "Installing Chromium..."
#sudo dnf install -y chromium-browser
sudo dnf install -y chromium

# Git: free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
echo "Installing Git..."
sudo dnf install -y git

# Gimp: GNU Image Manipulation Program
echo "Installing Gimp..."
sudo dnf install -y gimp

# Inkscape: vector edit graphics
echo "Installing Inkscape..."
sudo dnf install -y inkscape

# Htop: see all active process
echo "Installing Htop..."
sudo dnf install -y htop

# Nano: small text editor
echo "Installing Nano..."
sudo dnf install -y nano

# Neofetch: CLI system information tool
echo "Installing Neofetch..."
sudo dnf install -y neofetch

# Spotify: music player
echo "Installing Spotify..."
flatpak install -y flathub com.spotify.Client # using flatpak

# Telegram: client desktop for Telegram
echo "Installing Telegram..."
sudo dnf install -y telegram-desktop

# Visual Studio Code: text editor by Microsoft
echo "Installing Visual Studio Code..."
flatpak install -y flathub com.visualstudio.code # using flatpak

############################################

# EXTENSIONS (only for GNOME)
if [ "$DESKTOP_SESSION" = "gnome" ]
then
  # Gnome Tweaks: program that allows you to customize Gnome
  echo "Installing Gnome Tweaks..."
  sudo dnf install -y gnome-tweaks

  # Enable theme modification
  sudo dnf install -y gnome-shell-extension-user-theme
  # Install Dash to Dock
  sudo dnf install -y gnome-shell-extension-dash-to-dock

  # ICONS
  # Papirus Icon Theme
  echo "Installing Papirus Icon Theme..."
  sudo dnf install -y papirus-icon-theme

  # THEMES
  # Materia Theme
  echo "Installing Materia Theme..."
  #sudo dnf install -y materia-theme
  #flatpak install flathub org.gtk.Gtk3theme.Materia{,-dark,-light}{,-compact}
  git clone --depth 1 https://github.com/nana-4/materia-theme
  cd materia-theme
  sudo ./install.sh
  cd
  # Flat Remix Theme and Flat Remix Icon Theme
  echo "Installing Flat Remix Theme..."
  sudo dnf install -y flat-remix-theme
  # Adapta Theme
  echo "Installing Adapta Theme..."
  sudo dnf install -y adapta-gtk-theme
  # Arc Theme
  echo "Installing Arc Theme..."
  sudo dnf install -y arc-theme

  # CURSORS
  # Breeze Cursor
  echo "Installing Breeze Cursor..."
  sudo dnf install -y breeze-cursor-theme
  # Breeze-Adapta Cursor
  git clone https://github.com/mustafaozhan/Breeze-Adapta.git && cd Breeze-Adapta && chmod +x install.sh && sh install.sh
  cd

  # APPLYING
  # Theme
  gsettings set org.gnome.desktop.interface gtk-theme 'Flat-Remix-GTK-Yellow-Dark-Solid'
  #gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
  # Cursor
  gsettings set org.gnome.desktop.interface cursor-theme 'Breeze-Adapta'
  # Icon pack
  gsettings set org.gnome.desktop.interface icon-theme 'Flat-Remix-Yellow'
  # Top bar
  # gsettings set org.gnome.shell.extensions.user-theme name 'Materia-dark-compact'
fi

# Refresh
sudo dnf upgrade -y

# All programs installed
echo "Done. All programs installed!"

# Reboot?
read -p "To apply all changes a reboot is required. Do you want reboot? [y/n]: " var_reboot
if [ $var_reboot == "y" || $var_reboot == "Y" ]
then
	reboot
else
	echo "Thank you for using the script!"
fi
exit
