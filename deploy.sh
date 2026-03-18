#!/bin/bash
# Simple deployment script for Flutter Web App
# Run this on the server after uploading files

set -e

echo "===================================="
echo "   Flutter Web Deploy Script"
echo "===================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration - CHANGE THESE
SERVER_USER="root"
SERVER_IP="128.140.110.248"
REMOTE_DIR="/var/www/html/new"
LOCAL_BUILD_DIR="source_code/build/web"

echo "Step 1: Building Flutter Web App..."
echo "NOTE: You need Flutter installed locally for this step"
echo ""

# Check if flutter is installed
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}ERROR: Flutter is not installed!${NC}"
    echo "Please install Flutter first:"
    echo "https://docs.flutter.dev/get-started/install"
    exit 1
fi

# Build the app
cd source_code
flutter clean
flutter pub get
flutter build web --release

echo ""
echo -e "${GREEN}✓ Build completed successfully!${NC}"
echo ""

echo "Step 2: Deploying to server..."
echo "Server: $SERVER_IP"
echo "Directory: $REMOTE_DIR"
echo ""

# Create remote directory if it doesn't exist
ssh $SERVER_USER@$SERVER_IP "mkdir -p $REMOTE_DIR"

# Copy files to server using rsync (faster) or scp
echo "Uploading files..."
if command -v rsync &> /dev/null; then
    rsync -avz --delete $LOCAL_BUILD_DIR/ $SERVER_USER@$SERVER_IP:$REMOTE_DIR/
else
    scp -r $LOCAL_BUILD_DIR/* $SERVER_USER@$SERVER_IP:$REMOTE_DIR/
fi

echo ""
echo -e "${GREEN}✓ Deployment completed!${NC}"
echo ""
echo "Your app is now live at:"
echo "  http://$SERVER_IP/new/"
echo ""
echo "If you have a domain, configure it to point to:"
echo "  $REMOTE_DIR"
echo ""
