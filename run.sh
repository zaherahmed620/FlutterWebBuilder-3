#!/bin/bash
set -e

# Source the setup script to ensure Flutter is installed and in PATH
source ./setup_flutter.sh

# Get the current directory
REPLIT_ROOT=$(pwd)
FLUTTER_PROJECT_DIR="$REPLIT_ROOT/my_flutter_web_project"

# Check if my_flutter_web_project directory exists
if [ ! -d "$FLUTTER_PROJECT_DIR" ]; then
  echo "Creating a new Flutter web project..."
  mkdir -p "$FLUTTER_PROJECT_DIR"
  cd "$FLUTTER_PROJECT_DIR"
  
  # Create a new Flutter web project
  "$FLUTTER_ROOT/bin/flutter" create .
  
  # Enable web support in the project
  "$FLUTTER_ROOT/bin/flutter" config --enable-web
else
  echo "Flutter project directory found at $FLUTTER_PROJECT_DIR"
  cd "$FLUTTER_PROJECT_DIR"
fi

# Get Flutter dependencies
echo "Running flutter pub get..."
"$FLUTTER_ROOT/bin/flutter" pub get

# Build the Flutter web application
echo "Building Flutter web application..."
"$FLUTTER_ROOT/bin/flutter" build web --release

# Check if the web build was successful
if [ ! -d "$FLUTTER_PROJECT_DIR/build/web" ]; then
  echo "Error: Flutter web build failed. Check the logs above for details."
  exit 1
fi

# Create a temporary server script to serve the web build
cat > /tmp/server.py << 'EOF'
#!/usr/bin/env python3
import http.server
import socketserver
import os
import sys

PORT = 5000
working_dir = os.getcwd()
web_dir = os.path.join(working_dir, "build/web")

if not os.path.exists(web_dir):
    print(f"Error: Web build directory not found at {web_dir}")
    print(f"Current directory: {working_dir}")
    print("Directory contents:")
    print(os.listdir(working_dir))
    sys.exit(1)

os.chdir(web_dir)
print(f"Serving from directory: {web_dir}")

class Handler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        http.server.SimpleHTTPRequestHandler.end_headers(self)

handler = Handler
httpd = socketserver.TCPServer(("0.0.0.0", PORT), handler)

print(f"Serving Flutter web app at http://0.0.0.0:{PORT}")
print(f"Your app should be accessible in the Replit browser panel")
httpd.serve_forever()
EOF

# Make the server script executable
chmod +x /tmp/server.py

# Run the web server to serve the Flutter web build
echo "Starting web server on port 5000..."
python3 /tmp/server.py
