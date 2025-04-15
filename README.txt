==== نظام بناء تطبيق Flutter Web ====

قم بتحميل ملفات مشروع Flutter الخاص بك هنا في هذا المجلد.
Replace all files in this directory with your Flutter project files.

المجلد الحالي: /home/runner/my_flutter_web_project

ملاحظات مهمة:
1. يجب أن تحتوي على ملف pubspec.yaml
2. يجب أن تحتوي على مجلد lib/ مع ملف main.dart
3. وأي ملفات أخرى ضرورية لمشروع Flutter الخاص بك

بعد تحميل الملفات، قم بتشغيل الأمر التالي لبناء النسخة الويب:

bash ../run.sh

هذا سيقوم بتشغيل:
- flutter pub get
- flutter build web --release
- تشغيل خادم ويب على المنفذ 5000

www.example.com/api -> للاتصال بالـ API الخاص بك، لا تنسى تعديل عنوان URL في ملفات المشروع