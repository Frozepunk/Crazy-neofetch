#!/bin/bash

# Check if neofetch is already installed
if command -v neofetch &> /dev/null; then
    echo "Neofetch is already installed."
    exit 0
fi

# Check the package manager and install neofetch
if command -v apt &> /dev/null; then
    # Debian-based systems
    sudo apt update
    sudo apt install neofetch
elif command -v dnf &> /dev/null; then
    # Fedora
    sudo dnf install neofetch
elif command -v yum &> /dev/null; then
    # CentOS/RHEL
    sudo yum install neofetch
elif command -v zypper &> /dev/null; then
    # OpenSUSE
    sudo zypper install neofetch
elif command -v pacman &> /dev/null; then
    # Arch Linux
    sudo pacman -Syu neofetch
elif command -v apk &> /dev/null; then
    # Alpine Linux
    sudo apk add neofetch
else
    echo "Unsupported package manager. Please install neofetch manually."
    exit 1
fi

# Check if installation was successful
if command -v neofetch &> /dev/null; then
    echo "Neofetch has been successfully installed."
else
    echo "Failed to install neofetch."
    exit 1
fi

# Run neofetch
neofetch
