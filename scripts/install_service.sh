#!/bin/bash
set -e

echo "Running install_service.sh..."

SERVICE_NAME="my-dotnet-app"
SERVICE_FILE_PATH="/home/ec2-user/app/scripts/${SERVICE_NAME}.service"
SYSTEMD_PATH="/etc/systemd/system"

# Check if the service file exists
if [ ! -f "$SERVICE_FILE_PATH" ]; then
    echo "Error: $SERVICE_FILE_PATH not found."
    exit 1
fi

echo "Installing systemd service..."
sudo cp "$SERVICE_FILE_PATH" "$SYSTEMD_PATH/"

echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "Enabling $SERVICE_NAME to start on boot..."
sudo systemctl enable "$SERVICE_NAME"

echo "install_service.sh completed."