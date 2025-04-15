#!/bin/bash
set -e

# Set up Flutter directory
FLUTTER_ROOT="/home/runner/flutter"

# Clean up any previous installation
echo "Cleaning up previous Flutter installation..."
rm -rf "$FLUTTER_ROOT"
rm -rf /tmp/flutter_*

echo "Installing Flutter SDK using git clone..."
# Use git clone which is required by Flutter
git clone --depth 1 https://github.com/flutter/flutter.git -b stable "$FLUTTER_ROOT"

# Make Flutter executable
chmod +x "$FLUTTER_ROOT/bin/flutter"

# Add Flutter to PATH
echo "Adding Flutter to PATH"
export PATH="$FLUTTER_ROOT/bin:$PATH"

# Print flutter version to verify installation
echo "Verifying Flutter installation:"
"$FLUTTER_ROOT/bin/flutter" --version

# Download Flutter artifacts (this may take some time)
echo "Downloading Flutter dependencies..."
"$FLUTTER_ROOT/bin/flutter" precache

# Enable Flutter web
echo "Enabling Flutter web support"
"$FLUTTER_ROOT/bin/flutter" config --enable-web

# Create project directory if it doesn't exist
FLUTTER_PROJECT_DIR="/home/runner/my_flutter_web_project"
mkdir -p "$FLUTTER_PROJECT_DIR"

echo "Flutter environment setup complete!"
echo "Project directory created at $FLUTTER_PROJECT_DIR"
echo "You can now upload your Flutter project files to this directory."
