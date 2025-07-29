#!/bin/bash
set -e

echo "Running start_server.sh..."

SERVICE_NAME="my-dotnet-app"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

# Check if the service file exists
if [ ! -f "$SERVICE_FILE" ]; then
    echo "Error: $SERVICE_FILE does not exist."
    exit 1
fi

# Reload systemd daemon
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Enable service to start on boot
echo "Enabling $SERVICE_NAME service..."
sudo systemctl enable "$SERVICE_NAME"

# Start the service
echo "Starting $SERVICE_NAME service..."
sudo systemctl start "$SERVICE_NAME"

# Optional: Check service status
echo "Checking status of $SERVICE_NAME..."
sudo systemctl status "$SERVICE_NAME" --no-pager

echo "start_server.sh completed."