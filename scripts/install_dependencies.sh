#!/bin/bash
set -e

echo "Running install_dependencies.sh..."

# Check if .NET 8 SDK is already installed
if dotnet --list-sdks | grep -q "8.0"; then
    echo ".NET 8 SDK already installed."
else
    echo "Installing .NET 8 SDK..."

    # Install required tools
    sudo yum install -y wget tar

    # Add Microsoft key and repo
    sudo rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm

    # Install .NET 8 SDK
    sudo dnf install -y dotnet-sdk-8.0

    echo ".NET 8 SDK installed."
fi

dotnet --version
echo "install_dependencies.sh completed."