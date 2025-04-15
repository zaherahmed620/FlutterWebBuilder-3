# دليل نشر تطبيق Flutter Web على cPanel

هذا الدليل سيساعدك على نشر تطبيق Flutter Web الذي قمت ببنائه على استضافة cPanel.

## الخطوات الأساسية

### 1. بناء تطبيق Flutter Web

1. قم بتحميل ملفات مشروع Flutter الخاص بك إلى مجلد `/home/runner/my_flutter_web_project`
2. قم بتشغيل سكربت بناء التطبيق:
   ```
   ./build_for_cpanel.sh
   ```
3. انتظر حتى اكتمال عملية البناء. ستظهر رسالة عند الانتهاء تشير إلى أن ملف `web.zip` جاهز.
4. قم بتنزيل ملف `web.zip` من مجلد `/home/runner/web.zip`

### 2. رفع الملفات على cPanel

1. تسجيل الدخول إلى لوحة تحكم cPanel الخاصة بك.
2. انتقل إلى مدير الملفات (File Manager).
3. انتقل إلى مجلد `public_html` أو المجلد الفرعي الذي تريد نشر التطبيق فيه.
4. قم بتحميل ملف `web.zip`.
5. فك ضغط الملف (استخدم خيار "Extract" في cPanel).
6. تأكد من أن ملف `index.html` والملفات الأخرى موجودة في المسار الصحيح.

### 3. تكوين موجه التطبيق (إذا لزم الأمر)

#### إذا قمت بالنشر في المجلد الرئيسي (public_html)

* التطبيق سيكون متاحًا مباشرة على عنوان موقعك (مثال: `https://yourdomain.com`).

#### إذا قمت بالنشر في مجلد فرعي

* التطبيق سيكون متاحًا على عنوان يتضمن اسم المجلد (مثال: `https://yourdomain.com/app`).

## حل المشكلات الشائعة

### مشكلة: صفحة بيضاء فارغة بعد النشر

#### الحلول:

1. **تحقق من مسار base href**:
   * افتح ملف `index.html`
   * تأكد من أن وسم `<base href="/">` موجود في قسم `<head>`
   * إذا قمت بنشر التطبيق في مجلد فرعي، قم بتغيير المسار:
     * لمجلد فرعي: `<base href="/folder_name/">`

2. **تحقق من مسارات الملفات**:
   * افتح وحدة تحكم المتصفح (Developer Console)
   * ابحث عن أخطاء تحميل الملفات (404 errors)
   * تأكد من وجود جميع ملفات JS و CSS في المسارات الصحيحة

### مشكلة: أخطاء CORS عند الاتصال بـ API

#### الحلول:

1. **إضافة رؤوس CORS**:
   * قم بإنشاء ملف `.htaccess` في مجلد موقعك (إذا لم يكن موجودًا)
   * أضف الأسطر التالية:
   ```
   <IfModule mod_headers.c>
     Header set Access-Control-Allow-Origin "*"
     Header set Access-Control-Allow-Methods "GET, POST, OPTIONS"
     Header set Access-Control-Allow-Headers "Content-Type, Authorization"
   </IfModule>
   ```

2. **تعديل API الخاص بك**:
   * تأكد من أن خادم API يسمح بطلبات CORS من موقعك

### مشكلة: توجيه متعدد المسارات (مع Flutter Router)

#### الحلول:

1. **إضافة إعادة التوجيه**:
   * قم بإنشاء ملف `.htaccess` في مجلد موقعك (إذا لم يكن موجودًا)
   * أضف الأسطر التالية:
   ```
   <IfModule mod_rewrite.c>
     RewriteEngine On
     RewriteBase /
     RewriteRule ^index\.html$ - [L]
     RewriteCond %{REQUEST_FILENAME} !-f
     RewriteCond %{REQUEST_FILENAME} !-d
     RewriteRule . /index.html [L]
   </IfModule>
   ```
   * إذا كان التطبيق في مجلد فرعي، قم بتعديل `RewriteBase /` إلى `RewriteBase /folder_name/`

## ملاحظات إضافية

### تحسين الأداء

1. **ضغط ملفات cPanel**:
   * في cPanel، ابحث عن "Optimize Website"
   * قم بتفعيل ضغط Gzip

2. **تكوين التخزين المؤقت للمتصفح**:
   * أضف إلى ملف `.htaccess`:
   ```
   <IfModule mod_expires.c>
     ExpiresActive On
     ExpiresByType image/jpeg "access plus 1 year"
     ExpiresByType image/png "access plus 1 year"
     ExpiresByType text/css "access plus 1 month"
     ExpiresByType application/javascript "access plus 1 month"
     ExpiresByType application/x-javascript "access plus 1 month"
     ExpiresByType text/javascript "access plus 1 month"
   </IfModule>
   ```

### إضافة اسم نطاق فرعي

إذا كنت ترغب في تشغيل تطبيق Flutter الخاص بك على نطاق فرعي (مثل `app.yourdomain.com`):

1. أضف نطاقًا فرعيًا في إعدادات cPanel
2. اختر "Subdomain" من لوحة التحكم
3. أنشئ النطاق الفرعي وحدد المجلد الذي سيشير إليه
4. قم بنشر تطبيق Flutter في ذلك المجلد

## استخدام خدمة Worker في cPanel

إذا كان لديك خطة استضافة تدعم خدمة Worker في cPanel، يمكنك تحسين أداء تطبيقك:

1. انتقل إلى قسم "Advanced" في cPanel
2. ابحث عن "Node.js Applications"
3. قم بإنشاء تطبيق Worker جديد
4. اختر المسار والإعدادات المناسبة

---

# Flutter Web Deployment Guide for cPanel

This guide will help you deploy your Flutter Web application to cPanel hosting.

## Basic Steps

### 1. Build Your Flutter Web App

1. Upload your Flutter project files to `/home/runner/my_flutter_web_project`
2. Run the build script:
   ```
   ./build_for_cpanel.sh
   ```
3. Wait for the build process to complete. A message will appear when the `web.zip` file is ready.
4. Download the `web.zip` file from `/home/runner/web.zip`

### 2. Upload Files to cPanel

1. Log in to your cPanel control panel.
2. Navigate to File Manager.
3. Go to the `public_html` directory or the subdirectory where you want to deploy the app.
4. Upload the `web.zip` file.
5. Extract the file (use the "Extract" option in cPanel).
6. Make sure the `index.html` file and other files are in the correct location.

### 3. Configure App Routing (If Needed)

#### If Deployed in the Root Directory (public_html)

* The app will be available directly at your domain (e.g., `https://yourdomain.com`).

#### If Deployed in a Subdirectory

* The app will be available at a URL that includes the directory name (e.g., `https://yourdomain.com/app`).

## Troubleshooting Common Issues

### Problem: Blank White Page After Deployment

#### Solutions:

1. **Check the base href path**:
   * Open the `index.html` file
   * Make sure the `<base href="/">` tag is in the `<head>` section
   * If you deployed in a subdirectory, change the path:
     * For subdirectory: `<base href="/folder_name/">`

2. **Check file paths**:
   * Open the browser's Developer Console
   * Look for file loading errors (404 errors)
   * Ensure all JS and CSS files are in the correct paths

### Problem: CORS Errors When Connecting to API

#### Solutions:

1. **Add CORS headers**:
   * Create a `.htaccess` file in your site directory (if it doesn't exist)
   * Add the following lines:
   ```
   <IfModule mod_headers.c>
     Header set Access-Control-Allow-Origin "*"
     Header set Access-Control-Allow-Methods "GET, POST, OPTIONS"
     Header set Access-Control-Allow-Headers "Content-Type, Authorization"
   </IfModule>
   ```

2. **Modify your API**:
   * Make sure your API server allows CORS requests from your site

### Problem: Multiple Route Paths (with Flutter Router)

#### Solutions:

1. **Add URL rewriting**:
   * Create a `.htaccess` file in your site directory (if it doesn't exist)
   * Add the following lines:
   ```
   <IfModule mod_rewrite.c>
     RewriteEngine On
     RewriteBase /
     RewriteRule ^index\.html$ - [L]
     RewriteCond %{REQUEST_FILENAME} !-f
     RewriteCond %{REQUEST_FILENAME} !-d
     RewriteRule . /index.html [L]
   </IfModule>
   ```
   * If your app is in a subdirectory, change `RewriteBase /` to `RewriteBase /folder_name/`

## Additional Notes

### Performance Optimization

1. **cPanel compression**:
   * In cPanel, search for "Optimize Website"
   * Enable Gzip compression

2. **Configure browser caching**:
   * Add to your `.htaccess` file:
   ```
   <IfModule mod_expires.c>
     ExpiresActive On
     ExpiresByType image/jpeg "access plus 1 year"
     ExpiresByType image/png "access plus 1 year"
     ExpiresByType text/css "access plus 1 month"
     ExpiresByType application/javascript "access plus 1 month"
     ExpiresByType application/x-javascript "access plus 1 month"
     ExpiresByType text/javascript "access plus 1 month"
   </IfModule>
   ```

### Adding a Subdomain

If you want to run your Flutter app on a subdomain (like `app.yourdomain.com`):

1. Add a subdomain in cPanel settings
2. Choose "Subdomain" from the control panel
3. Create the subdomain and select the directory it will point to
4. Deploy your Flutter app in that directory

## Using Worker Service in cPanel

If your hosting plan supports Worker service in cPanel, you can enhance your app's performance:

1. Go to the "Advanced" section in cPanel
2. Look for "Node.js Applications"
3. Create a new Worker application
4. Choose the appropriate path and settings