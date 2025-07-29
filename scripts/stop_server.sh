#!/bin/bash
set -e
echo "Running stopserver.sh..."
# Get the process ID of the running .NET app
PID=$(pgrep -f "dotnet .*MyApp.dll")
if [ -z "$PID" ]; then
  echo "No running instance of MyApp.dll found."
else
  echo "Stopping MyApp.dll (PID $PID)..."
  kill -9 $PID
  echo "Process terminated."
f