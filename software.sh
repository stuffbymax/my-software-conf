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
    "git"                    # Version control system
    "krita"                  # Digital painting software
    "python"                 # Python programming language
    "python-pip"             # Python package installer
    "python-virtualenv"      # Package for creating virtual environments
    "ufw"                    # Uncomplicated Firewall
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

# Set up UFW
echo "Setting up UFW..."

# Allow SSH connections (port 22)
sudo ufw allow ssh

# Allow common web server ports
sudo ufw allow http   # Port 80
sudo ufw allow https  # Port 443

# Allow FTP (port 21)
sudo ufw allow ftp    # FTP Control Port

# Allow FTP Data Port (Passive Mode)
sudo ufw allow 20     # FTP Data Port (Passive Mode)

# Allow other common services
sudo ufw allow 3306    # MySQL
sudo ufw allow 5432    # PostgreSQL
sudo ufw allow 6379    # Redis
sudo ufw allow 27017   # MongoDB
sudo ufw allow 8080    # HTTP Alternative (commonly used for web applications)

# Enable UFW
sudo ufw enable || handle_error

# Show the status of UFW
echo "UFW status:"
sudo ufw status verbose

# Notify user for further customization
echo "Installation and UFW setup complete!"
