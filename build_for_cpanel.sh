#!/bin/bash

echo "=============================================================="
echo "Building Flutter Web Project for cPanel Hosting"
echo "=============================================================="

# Check if Flutter is installed
if [ ! -d "/home/runner/flutter" ]; then
  echo "Error: Flutter SDK not found. Please run setup_flutter.sh first."
  exit 1
fi

# Add Flutter to PATH
export PATH="/home/runner/flutter/bin:$PATH"

# Check if project exists
if [ ! -d "/home/runner/my_flutter_web_project" ]; then
  echo "Error: Project directory not found."
  echo "Please create a Flutter project at /home/runner/my_flutter_web_project first."
  exit 1
fi

# Check for pubspec.yaml to confirm it's a Flutter project
if [ ! -f "/home/runner/my_flutter_web_project/pubspec.yaml" ]; then
  echo "Error: pubspec.yaml not found in the project directory."
  echo "Please make sure you've uploaded a valid Flutter project."
  exit 1
fi

# Navigate to the project directory
cd /home/runner/my_flutter_web_project

# Install dependencies
echo "Installing dependencies..."
flutter pub get

# Build web version with optimizations for cPanel
echo "Building web version with optimizations for cPanel hosting..."
flutter build web --release --web-renderer html --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://unpkg.com/canvaskit-wasm@0.32.0/bin/

# Create a zip file of the build
echo "Creating ZIP file for easy upload to cPanel..."
cd build
zip -r web.zip web/

# Move the zip file to a convenient location
cp web.zip /home/runner/

echo "=============================================================="
echo "Build completed successfully!"
echo "=============================================================="
echo "Your web.zip file is ready at: /home/runner/web.zip"
echo "You can download this file and upload it to your cPanel hosting."
echo ""
echo "Upload Instructions:"
echo "1. Log in to your cPanel account"
echo "2. Navigate to File Manager"
echo "3. Go to public_html directory (or your desired subdirectory)"
echo "4. Upload and extract web.zip"
echo "5. Make sure index.html is in the correct directory"
echo "=============================================================="