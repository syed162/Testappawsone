#!/bin/bash

set -e

APP_DIR="/home/ec2-user/app"

echo "Changing ownership of the app directory to ec2-user..."
sudo chown -R ec2-user:ec2-user "$APP_DIR"

echo "Setting directory permissions..."
sudo find "$APP_DIR" -type d -exec chmod 755 {} \;

echo "Setting file permissions..."
sudo find "$APP_DIR" -type f -exec chmod 644 {} \;

# Ensure .NET DLL is executable (if needed)
if [ -f "$APP_DIR/MyApp.dll" ]; then
  sudo chmod +x "$APP_DIR/MyApp.dll"
fi
