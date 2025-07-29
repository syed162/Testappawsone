#!/bin/bash
set -e
echo "Running startserver.sh..."
APP_DIR="/var/www/myapp"
APP_DLL="MyApp.dll"
LOG_FILE="/var/log/myapp.log"
cd $APP_DIR
echo "Starting $APP_DLL..."
nohup dotnet $APP_DLL > $LOG_FILE 2>&1 &
echo "Application started. Logs are being written to $LOG_FILE"