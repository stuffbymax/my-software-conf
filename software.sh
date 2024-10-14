#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error occurred during the installation. Exiting."
    exit 1
}

# Update the system
echo "Updating the system..."
sudo pacman -Syu --noconfirm || handle_error

# List of software to install
software=(
    "git"                    # Version control system
    "vim"                    # Text editor
    "htop"                   # Interactive process viewer
    "curl"                   # Command line tool for transferring data with URLs
    "wget"                   # Utility for downloading files
    "docker"                 # Container platform
    "docker-compose"         # Tool for defining and running multi-container Docker applications
    "python"                 # Python programming language
    "python-pip"             # Python package installer
    "python-virtualenv"      # Package for creating virtual environments
    "nodejs"                 # JavaScript runtime
    "npm"                    # Node package manager
    "gcc"                    # C and C++ compiler
    "make"                   # Build automation tool
    "postgresql"             # PostgreSQL database
    "firefox"                # Web browser
    "mpv"                    # Media player
    "filezilla"              # FTP client
    "thunar"                 # Thunar file browser
    "geany"                  # Lightweight IDE for various programming languages
    "spyder"                 # Scientific Python IDE
    "ufw"                    # Uncomplicated Firewall
    
    # AwesomeWM Utilities
    "rofi"                   # Application launcher
    "feh"                    # Image viewer for backgrounds
    "picom"                  # Compositor for transparency and effects
    "lxappearance"           # GTK theme switcher
    "nitrogen"               # Wallpaper manager
    "xbindkeys"              # Keyboard shortcut manager
    "mpd"                    # Music Player Daemon
    "ncmpcpp"                # MPD client
    "gpick"                  # Color picker tool
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

# Optional: Copy AwesomeWM configuration
if [ -f ~/.config/awesome/rc.lua ]; then
    echo "Backing up existing AwesomeWM configuration..."
    cp ~/.config/awesome/rc.lua ~/.config/awesome/rc.lua.bak
fi

# Optional: Notify user for further customization
echo "Installation and AwesomeWM setup complete!"
echo "Please customize your AwesomeWM configuration in ~/.config/awesome/rc.lua."
