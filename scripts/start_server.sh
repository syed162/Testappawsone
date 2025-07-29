#!/bin/bash
set -e

echo "Running start_server.sh..."

# Name of the systemd service
SERVICE_NAME="my-dotnet-app"

# Reload systemd to ensure service file changes are picked up
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Enable service to start on boot
echo "Enabling $SERVICE_NAME service..."
sudo systemctl enable "$SERVICE_NAME"

# Start the service
echo "Starting $SERVICE_NAME service..."
sudo systemctl start "$SERVICE_NAME"

# Optional: Check service status
sudo systemctl status "$SERVICE_NAME" --no-pager

echo "start_server.sh completed."