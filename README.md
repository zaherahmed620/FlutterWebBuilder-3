# Flutter Web for cPanel - بيئة تطوير Flutter للويب

هذه البيئة مجهزة لتطوير وبناء تطبيق Flutter Web ورفعه على استضافة cPanel.

## الميزات

- ✅ Flutter SDK مُثبت ومُعَد مسبقاً
- ✅ دعم Flutter للويب مُفعّل
- ✅ مكتبات نموذجية لـ API (api_service.dart)
- ✅ مجلد جاهز لمشروعك (/my_flutter_web_project)
- ✅ أدوات خاصة لبناء الملفات بتنسيق متوافق مع cPanel

## كيفية الاستخدام

### 1. تحميل ملفات مشروعك

قم بتحميل ملفات مشروع Flutter الخاص بك إلى المجلد:
```
/home/runner/my_flutter_web_project
```

تأكد من أن لديك على الأقل الملفات التالية:
- `pubspec.yaml`
- مجلد `lib/` يحتوي على `main.dart`
- ملفات مشروع Flutter الأخرى

### 2. بناء نسخة الويب للرفع على cPanel

شغل الأمر التالي:
```
./build_for_cpanel.sh
```

سيقوم هذا السكربت بما يلي:
1. تثبيت اعتماديات مشروعك
2. بناء نسخة الويب مع تحسينات خاصة بـ cPanel
3. إنشاء ملف `web.zip` جاهز للرفع

### 3. تنزيل ملف ZIP ورفعه على cPanel

بعد اكتمال عملية البناء، ستجد ملف:
```
/home/runner/web.zip
```

قم بتنزيل هذا الملف ثم:
1. تسجيل الدخول إلى لوحة تحكم cPanel
2. الانتقال إلى مدير الملفات (File Manager)
3. الذهاب إلى مجلد `public_html` (أو المجلد الفرعي الذي تريده)
4. رفع وفك ضغط ملف `web.zip`
5. التأكد من أن ملف `index.html` في المسار الصحيح

## ملفات مساعدة تم إنشاؤها

- **api_service.dart**: خدمة نموذجية للاتصال بـ API
- **constants.dart**: ثوابت ومتغيرات التطبيق (مثل عنوان API ومفتاح API)
- **models.dart**: نماذج بيانات نموذجية

## بيانات الاتصال بـ API

```dart
const String apiKey = '9fedcbced6b38503dcae6c8e1f766a2d';
const String baseUrl = 'https://yemenmazady.com/api/';
```

## الأوامر المتاحة

- `./setup_flutter.sh`: تثبيت Flutter SDK (يتم تنفيذه تلقائياً)
- `./build_for_cpanel.sh`: بناء نسخة الويب وتجهيزها للرفع على cPanel
- `bash run.sh`: تشغيل تطبيق Flutter على المنفذ 5000 (للاختبار)

---

# Flutter Web for cPanel - Development Environment

This environment is set up for developing and building a Flutter Web application for deployment on cPanel hosting.

## Features

- ✅ Pre-installed and configured Flutter SDK
- ✅ Flutter web support enabled
- ✅ Sample API libraries (api_service.dart)
- ✅ Ready project folder (/my_flutter_web_project)
- ✅ Special tools for building cPanel-compatible files

## How to Use

### 1. Upload Your Project Files

Upload your Flutter project files to:
```
/home/runner/my_flutter_web_project
```

Make sure you have at least these files:
- `pubspec.yaml`
- `lib/` directory with `main.dart`
- Other Flutter project files

### 2. Build Web Version for cPanel

Run:
```
./build_for_cpanel.sh
```

This script will:
1. Install your project dependencies
2. Build the web version with cPanel-specific optimizations
3. Create a ready-to-upload `web.zip` file

### 3. Download the ZIP and Upload to cPanel

After the build is complete, you'll find:
```
/home/runner/web.zip
```

Download this file and:
1. Log in to your cPanel control panel
2. Navigate to File Manager
3. Go to the `public_html` directory (or your desired subdirectory)
4. Upload and extract `web.zip`
5. Make sure `index.html` is in the correct location

## Helper Files Created

- **api_service.dart**: Sample service for API connections
- **constants.dart**: App constants (like API URL and API Key)
- **models.dart**: Sample data models

## API Connection Details

```dart
const String apiKey = '9fedcbced6b38503dcae6c8e1f766a2d';
const String baseUrl = 'https://yemenmazady.com/api/';
```

## Available Commands

- `./setup_flutter.sh`: Install Flutter SDK (runs automatically)
- `./build_for_cpanel.sh`: Build web version and prepare for cPanel upload
- `bash run.sh`: Run the Flutter app on port 5000 (for testing)