#!/bin/bash
set -e
echo "Running BeforeInstall Script"
# Stop existing .NET application service (adjust your service name)
echo "Stopping existing service..."
sudo systemctl stop my-dotnet-app.service || true
# Install .NET 8 runtime if not already installed
if ! dotnet --list-runtimes | grep -q "Microsoft.NETCore.App 8"; then
    echo "Installing .NET 8 runtime..."
    wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y dotnet-runtime-8.0
else
    echo ".NET 8 already installed."
fi
# Clean up old deployment folder (optional)
echo "Cleaning old deployment..."
rm -rf /var/www/myapp/* || true
echo "BeforeInstall completed."