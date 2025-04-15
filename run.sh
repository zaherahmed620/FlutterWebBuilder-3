#!/bin/bash
set -e

# Load Flutter from setup if not already done
if [ ! -d "/home/runner/flutter" ] || [ ! -f "/home/runner/flutter/bin/flutter" ]; then
  echo "Flutter SDK not found or incomplete. Running setup..."
  source ./setup_flutter.sh
else
  echo "Flutter SDK found. Continuing..."
  FLUTTER_ROOT="/home/runner/flutter"
  export PATH="$FLUTTER_ROOT/bin:$PATH"
fi

# Set project directory
FLUTTER_PROJECT_DIR="/home/runner/my_flutter_web_project"

# Check if the project directory exists
if [ ! -d "$FLUTTER_PROJECT_DIR" ]; then
  echo "Creating Flutter project directory..."
  mkdir -p "$FLUTTER_PROJECT_DIR"
  
  # Create a placeholder for the user to upload their files
  touch "$FLUTTER_PROJECT_DIR/README.txt"
  echo "UPLOAD YOUR FLUTTER PROJECT FILES HERE" > "$FLUTTER_PROJECT_DIR/README.txt"
  echo "Replace all files in this directory with your Flutter project files." >> "$FLUTTER_PROJECT_DIR/README.txt"
fi

# Check if the project has pubspec.yaml (indicator of Flutter project)
if [ -f "$FLUTTER_PROJECT_DIR/pubspec.yaml" ]; then
  echo "Flutter project detected. Building for web..."
  cd "$FLUTTER_PROJECT_DIR"
  
  # Get dependencies
  echo "Running flutter pub get..."
  "$FLUTTER_ROOT/bin/flutter" pub get
  
  # Build web
  echo "Building Flutter web application..."
  "$FLUTTER_ROOT/bin/flutter" build web --release
  
  # Check if build was successful
  if [ -d "$FLUTTER_PROJECT_DIR/build/web" ]; then
    echo "Build successful! Starting web server..."
    
    # Create and run web server
    cd "$FLUTTER_PROJECT_DIR/build/web"
    echo "Serving Flutter web app from $(pwd)"
    python3 -m http.server 5000 --bind 0.0.0.0
  else
    echo "Error: Web build failed. Check the logs above for details."
    echo "Please make sure you've uploaded a valid Flutter project."
    exit 1
  fi
else
  echo "====================================================="
  echo "Flutter setup completed successfully!"
  echo "Project directory is ready at: $FLUTTER_PROJECT_DIR"
  echo ""
  echo "However, no Flutter project files were detected."
  echo "Please upload your Flutter project files to: $FLUTTER_PROJECT_DIR"
  echo ""
  echo "Your files should include:"
  echo "- pubspec.yaml"
  echo "- lib/ directory with main.dart"
  echo "- and other Flutter project files"
  echo "====================================================="
  echo ""
  echo "Flutter is installed at: $FLUTTER_ROOT"
  echo "Flutter version: $($FLUTTER_ROOT/bin/flutter --version | head -n 1)"
  echo ""
  echo "After uploading your project files, run this script again to build and serve your Flutter web app."
  
  # Create a simple web server to show instructions
  echo "Creating a simple placeholder page..."
  mkdir -p "$FLUTTER_PROJECT_DIR/temp_web"
  cat > "$FLUTTER_PROJECT_DIR/temp_web/index.html" << 'EOF'
<!DOCTYPE html>
<html>
<head>
  <title>Flutter Web Setup Complete</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 20px;
      color: #333;
    }
    .container {
      max-width: 800px;
      margin: 0 auto;
      background-color: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    h1 {
      color: #0175C2;
    }
    ul {
      padding-left: 20px;
    }
    li {
      margin-bottom: 10px;
    }
    code {
      background-color: #f0f0f0;
      padding: 2px 5px;
      border-radius: 3px;
      font-family: monospace;
    }
    .steps {
      margin-top: 20px;
      padding: 15px;
      background-color: #e7f8ff;
      border-left: 4px solid #0175C2;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Flutter Web Setup Complete!</h1>
    <p>Your Flutter development environment is ready to use!</p>
    
    <div class="steps">
      <h2>Next Steps:</h2>
      <ol>
        <li>Upload your Flutter project files to <code>/home/runner/my_flutter_web_project</code></li>
        <li>After uploading, run <code>bash run.sh</code> in the Replit Shell</li>
        <li>Your web app will be built and served at this URL</li>
      </ol>
    </div>
    
    <h2>Required Project Files:</h2>
    <ul>
      <li><code>pubspec.yaml</code> - Flutter project configuration</li>
      <li><code>lib/</code> folder with <code>main.dart</code> and other source files</li>
      <li><code>assets/</code> folder (if your project uses assets)</li>
      <li><code>web/</code> folder with Flutter web-specific files</li>
    </ul>
    
    <h2>About Your Environment:</h2>
    <ul>
      <li>Flutter is installed and ready to use</li>
      <li>Flutter web support is enabled</li>
      <li>The web server will run on port 5000</li>
    </ul>
  </div>
</body>
</html>
EOF
  
  # Serve the temporary page
  cd "$FLUTTER_PROJECT_DIR/temp_web"
  echo "Serving placeholder page at port 5000..."
  python3 -m http.server 5000 --bind 0.0.0.0
fi
