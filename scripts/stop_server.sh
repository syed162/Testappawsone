#!/bin/bash

set -e

echo "Stopping the .NET application..."

# Replace with your app's directory and DLL name
APP_DIR="/home/ec2-user/app"
APP_DLL="MyApp.dll"

# Find the PID of the running .NET app
PIDS=$(pgrep -f "dotnet $APP_DLL")

if [ -z "$PIDS" ]; then
  echo "No .NET application process found."
else
  echo "Killing process(es): $PIDS"
  kill -9 $PIDS
  echo ".NET application stopped."
fi
