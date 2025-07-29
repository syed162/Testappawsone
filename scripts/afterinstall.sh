#!/bin/bash
set -e
echo "Running afterinstall.sh..."
APP_DIR="/var/www/myapp"
SERVICE_NAME="my-dotnet-app"
# Ensure directory exists
echo "Ensuring app directory exists at $APP_DIR..."mkdir -p $APP_DIR
# Set permissions
echo "Setting permissions..."
chown -R ec2-user:ec2-user $APP_DIR
chmod -R 755 $APP_DIR
# Optional: Copy your service file if it isn't already on the instance
# echo "Copying service file..."
# cp $APP_DIR/scripts/$SERVICE_NAME.service /etc/systemd/system/
# Reload systemd in case service file changed
echo "Reloading systemd..."
sudo systemctl daemon-reexec
sudo systemctl