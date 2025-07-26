#!/bin/bash

set -e

echo "Installing .NET Runtime for Amazon Linux 2..."

# Enable required repos and update packages
sudo yum update -y

# Add the Microsoft package signing key and repository
sudo rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm

# Install the .NET runtime (adjust version as needed)
sudo yum install -y aspnetcore-runtime-6.0

# Optionally: install .NET SDK if you need to build on the instance
# sudo yum install -y dotnet-sdk-6.0

echo ".NET Runtime installed successfully."

# Optional: install other dependencies
# sudo yum install -y nginx
# sudo yum install -y git
