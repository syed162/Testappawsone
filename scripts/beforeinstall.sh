#!/bin/bash
set -e

echo "Running BeforeInstall Script..."

# Stop existing .NET application service (if running)
echo "Stopping existing service..."
sudo systemctl stop my-dotnet-app.service || true

# Install .NET 8 runtime if not already installed
if ! dotnet --list-runtimes | grep -q "Microsoft.NETCore.App 8"; then
    echo "Installing .NET 8 runtime..."

    # Enable required Microsoft feed for Amazon Linux 2023
    sudo dnf install -y dotnet-runtime-8.0 || {
        echo ".NET 8 installation failed. Check compatibility or install instructions from Microsoft docs."
        exit 1
    }
else
    echo ".NET 8 already installed."
fi

# Clean up old deployment folder
echo "Cleaning old deployment folder..."
rm -rf /var/www/myapp/* || true

echo "BeforeInstall completed."