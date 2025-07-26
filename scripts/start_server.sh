#!/bin/bash

set -e

echo "Starting the .NET application..."

# Set the directory and DLL name of your app
APP_DIR="/home/ec2-user/app"
APP_DLL="MyApp.dll"

cd "$APP_DIR"

# Optional: install .NET if not already installed (commented out)
# echo "Installing .NET runtime..."
# sudo yum install -y dotnet-runtime-6.0

# Start the app in background
echo "Running: dotnet $APP_DLL"
nohup dotnet "$APP_DLL" > app.log 2>&1 &

echo ".NET application started."
