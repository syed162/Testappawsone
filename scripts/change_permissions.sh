#!/bin/bash
set -e

echo "Installing systemd service..."

# Copy service file to systemd
cp /home/ec2-user/app/scripts/my-dotnet-app.service /etc/systemd/system/my-dotnet-app.service

# Set proper permissions
chmod 644 /etc/systemd/system/my-dotnet-app.service

# Reload systemd
systemctl daemon-reload

echo "Service installed."