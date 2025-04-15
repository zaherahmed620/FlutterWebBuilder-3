===============================================
       بيئة تطوير Flutter للويب من أجل cPanel
===============================================

مرحبًا! قمنا بإعداد بيئة Flutter Web جاهزة لبناء مشروعك ونشره على cPanel.

■ الخطوات المطلوبة:

١. قم بتحميل ملفات مشروع Flutter الخاص بك إلى هذا المجلد:
   /home/runner/my_flutter_web_project

٢. شغّل هذا الأمر لبناء نسخة الويب:
   ./build_for_cpanel.sh

٣. بعد الانتهاء، ستجد ملف web.zip جاهز للتنزيل في:
   /home/runner/web.zip

٤. حمّل هذا الملف وفك ضغطه داخل مجلد public_html في cPanel.

■ الملفات المهمة:

- build_for_cpanel.sh: سكربت إنشاء نسخة الويب (استخدم هذا للبناء)
- run.sh: لتشغيل التطبيق محليًا في Replit (اختباري فقط)
- setup_flutter.sh: لتثبيت Flutter (تم تنفيذه بالفعل)
- README.md: تعليمات مفصلة
- CPANEL_GUIDE.md: دليل كامل لنشر تطبيق Flutter على cPanel

■ ملاحظات API:

- تم إعداد ملفات API نموذجية مثل api_service.dart
- بيانات API مخزنة في constants.dart
- ستحتاج إلى نسخ هذه الملفات إلى مشروعك أو تعديلها حسب احتياجاتك

■ للمساعدة الإضافية:

- راجع الملف README.md للتعليمات المفصلة
- راجع CPANEL_GUIDE.md لحل المشكلات الشائعة عند النشر على cPanel

===============================================
      Flutter Web Development for cPanel
===============================================

Welcome! We've set up a Flutter Web environment ready to build your project and deploy it to cPanel.

■ Required Steps:

1. Upload your Flutter project files to this directory:
   /home/runner/my_flutter_web_project

2. Run this command to build the web version:
   ./build_for_cpanel.sh

3. After completion, you'll find a web.zip file ready to download at:
   /home/runner/web.zip

4. Upload this file and extract it inside the public_html folder in cPanel.

■ Important Files:

- build_for_cpanel.sh: Web build script (use this for building)
- run.sh: To run the app locally in Replit (testing only)
- setup_flutter.sh: To install Flutter (already executed)
- README.md: Detailed instructions
- CPANEL_GUIDE.md: Complete guide for deploying Flutter on cPanel

■ API Notes:

- Sample API files like api_service.dart have been prepared
- API data stored in constants.dart
- You'll need to copy these files to your project or modify them as needed

■ For Additional Help:

- See README.md for detailed instructions
- Check CPANEL_GUIDE.md for common deployment issues on cPanel