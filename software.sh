#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error occurred during the installation. Exiting."
    exit 1
}

# Update the system
echo "Updating the system..."
sudo pacman -Syu --noconfirm || handle_error

# List of software to install (UFW, Git, Krita, and Python-related packages)
software=(
    "git"                   
    "krita"                 
    "python"                 
    "python-pip"            
    "python-virtualenv"      
    "vim"
    "htop"
    "curl"
    "wget"
    "python"
    "python-pip"
    "python-virtualenv"
    "mpv"
    "filezilla"
    "thunar"
    "geany"
    "spyder"
)

# Install software
echo "Installing software packages..."
for pkg in "${software[@]}"; do
    if pacman -Q "$pkg" &> /dev/null; then
        echo "$pkg is already installed."
    else
        echo "Installing $pkg..."
        sudo pacman -S --noconfirm "$pkg" || handle_error
    fi
done

# Clean up orphaned packages
echo "Cleaning up orphaned packages..."
sudo pacman -Rns $(pacman -Qdtq) || handle_error

