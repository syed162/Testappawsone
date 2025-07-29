#!/bin/bash
set -e
echo "Running BeforeInstall Script..."

DEPLOY_DIR="/home/ec2-user/app"

echo "Stopping existing service..."
sudo systemctl stop my-dotnet-app.service || true

echo "Cleaning previous deployment at $DEPLOY_DIR..."
rm -rf ${DEPLOY_DIR:?}/*

echo "BeforeInstall completed."