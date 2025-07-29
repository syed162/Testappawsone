#!/bin/bash
set -e
echo "Running change_permissions.sh..."
APP_DIR="/var/www/myapp"
APP_USER="ec2-user"
APP_GROUP="ec2-user"
# Ensure the directory exists
if [ ! -d "$APP_DIR" ]; then
  echo "Application directory $APP_DIR does not exist. Exiting."
  exit 1
fi
# Set ownership
echo "Changing ownership to $APP_USER:$APP_GROUP..."
chown -R $APP_USER:$APP_GROUP "$APP_DIR"
# Set directory and file permissions
echo "Setting director

