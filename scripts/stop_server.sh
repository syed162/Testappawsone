#!/bin/bash
set -e

echo "Running stop_server.sh..."

# Name of the systemd service
SERVICE_NAME="my-dotnet-app"

# Check if the service is running
if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "Stopping $SERVICE_NAME service..."
    sudo systemctl stop "$SERVICE_NAME"
else
    echo "$SERVICE_NAME is not running."
fi

echo "stop_server.sh completed."