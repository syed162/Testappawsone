#!/bin/bash
set -e
echo "Running afterinstall.sh..."

APP_DIR="/var/www/myapp"
SERVICE_NAME="my-dotnet-app"

echo "Ensuring app directory exists at $APP_DIR..."
mkdir -p $APP_DIR

echo "Setting permissions..."
chown -R ec2-user:ec2-user $APP_DIR
chmod -R 755 $APP_DIR

# Copy service file to systemd
echo "Copying $SERVICE_NAME.service to /etc/systemd/system/..."
cp scripts/$SERVICE_NAME.service /etc/systemd/system/

echo "Reloading systemd..."
systemctl daemon-reexec
systemctl daemon-reload

echo "afterinstall.sh completed."