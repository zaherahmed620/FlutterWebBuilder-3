#!/bin/bash
set -e

# Create Flutter directory if it doesn't exist
FLUTTER_ROOT="/home/runner/flutter"

# Remove any existing incomplete Flutter installation
if [ -d "$FLUTTER_ROOT" ]; then
  echo "Removing existing Flutter directory..."
  rm -rf "$FLUTTER_ROOT"
fi

echo "Installing Flutter SDK..."
mkdir -p "$FLUTTER_ROOT"

# Download Flutter SDK directly
echo "Downloading Flutter SDK..."
cd /tmp
FLUTTER_ARCHIVE="flutter_linux_3.19.3-stable.tar.xz"
wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/$FLUTTER_ARCHIVE
echo "Extracting Flutter SDK..."
tar xf $FLUTTER_ARCHIVE -C /home/runner
rm $FLUTTER_ARCHIVE

# Ensure Flutter is in the PATH
export PATH="$FLUTTER_ROOT/bin:$PATH"
echo "Flutter PATH set to: $PATH"

# Verify Flutter installation
if [ -f "$FLUTTER_ROOT/bin/flutter" ]; then
  echo "Flutter binary found at $FLUTTER_ROOT/bin/flutter"
  chmod +x "$FLUTTER_ROOT/bin/flutter"
  
  # Run Flutter doctor to download Dart SDK and perform initial setup
  echo "Running Flutter doctor..."
  "$FLUTTER_ROOT/bin/flutter" --version
  "$FLUTTER_ROOT/bin/flutter" doctor -v
  
  # Configure Flutter for web
  echo "Configuring Flutter for web..."
  "$FLUTTER_ROOT/bin/flutter" config --enable-web
  
  echo "Flutter setup complete!"
else
  echo "ERROR: Flutter binary not found at $FLUTTER_ROOT/bin/flutter"
  if [ -d "$FLUTTER_ROOT" ]; then
    echo "Contents of Flutter directory:"
    ls -la "$FLUTTER_ROOT"
    echo "Contents of Flutter bin directory:"
    ls -la "$FLUTTER_ROOT/bin" || echo "bin directory not found"
  fi
  exit 1
fi
