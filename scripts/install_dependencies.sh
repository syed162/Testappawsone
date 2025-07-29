#!/bin/bash
set -e
echo "Running install_dependencies.sh..."
# Check if .NET 8 SDK is already installed
if dotnet --list-sdks | grep -q "8.0"; then
    echo ".NET 8 SDK already installed."
else
    echo "Installing .NET 8 SDK..."
    # Add Microsoft package signing key and repository
    wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    # Update package lists and install .NET SDK 8.0
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-8.0

    echo ".NET 8 SDK installed."
fi
# Optional: Check installed version
dotnet --version
echo "install_dependencies.sh completed."