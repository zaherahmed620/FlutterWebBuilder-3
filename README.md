# Flutter Web Development Environment

This Replit project provides a ready-to-use Flutter Web development environment where you can build your Flutter web application.

## Features

- Flutter SDK installed and configured
- Flutter web support enabled
- Simple web server to serve your built web application
- Support for your existing Flutter project files

## How to Use

1. **Upload Your Flutter Project Files**
   - Upload your Flutter project files to the `/home/runner/my_flutter_web_project` directory
   - Ensure your project has all necessary files (pubspec.yaml, lib/main.dart, etc.)

2. **Build and Run Your Project**
   - Run `bash run.sh` in the Replit Shell
   - This will:
     - Install Flutter if not already installed
     - Run `flutter pub get` to get dependencies
     - Build the web version with `flutter build web --release`
     - Start a web server to serve your application on port 5000

3. **View Your Application**
   - Your application will be available in the Replit webview

## Directory Structure

```
/home/runner/                 # Replit project root
├── flutter/                  # Flutter SDK installation
├── my_flutter_web_project/   # Your Flutter project directory
│   ├── lib/                  # Your Flutter app code
│   ├── pubspec.yaml          # Project dependencies
│   └── ...                   # Other project files
├── setup_flutter.sh          # Script to install Flutter SDK
└── run.sh                    # Script to build and run your app
```

## Notes

- If you're connecting to a backend API, make sure to update the API URLs in your code
- The web server runs on port 5000
- Flutter web builds are saved to `/home/runner/my_flutter_web_project/build/web`

## Troubleshooting

If you encounter any issues:
1. Check that your Flutter project files are correctly uploaded
2. Run `bash setup_flutter.sh` to reinstall Flutter if needed
3. Check the console logs for any error messages