#!/bin/bash
set -e

echo "Running changepermission.sh..."

# Define your application directory
APP_DIR="/var/www/myapp"

# Ensure the directory exists
echo "Ensuring $APP_DIR exists..."
mkdir -p "$APP_DIR"

# Set ownership to ec2-user (or the user running the app)
echo "Setting ownership to ec2-user..."
chown -R ec2-user:ec2-user "$APP_DIR"

# Set permissions
echo "Setting directory and file permissions..."
chmod -R 755 "$APP_DIR"

echo "changepermission.sh completed."