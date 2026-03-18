# ڕێنمایی تەواو - چۆن ئەپلیکەیشنەکە بیکەیتە وێب سایت

## 🎯 کورتە
**چی پێویستە:**
1. Flutter App ـەکە ببینە (Build) → فایلەکانی HTML/JS دروست دەبن
2. ئەو فایلانە ببەریتە سەر سێرڤەر (FTP)

---

## 📋 هەنگاو بە هەنگاو

### 🔧 هەنگاوی ١: دامەزراندنی Flutter (یەک جار)

**ئەگەر Flutter دامەزراندووە، بڕۆ بۆ هەنگاوی ٢**

**بۆ Windows:**
1. بڕۆ بۆ: https://docs.flutter.dev/get-started/install/windows
2. "Stable" دابگرە (فایلی zip)
3. فایلەکە بکەرەوە (extract) بۆ `C:\flutter`
4. environment variable زیاد بکە:
   - `Windows Key + R` → `sysdm.cpl` → Enter
   - Advanced → Environment Variables
   - Path → Edit → New → `C:\flutter\bin`
5. ترمیناڵ (CMD) کردەوە و بنووسە:
   ```
   flutter doctor
   ```
   - ئەگەر هیچ error ی نیشان نەدا، باشە!

**چارەسەری خێرا (بێ دامەزراندن):**
- بەکارهێنانی GitHub بۆ بیناکردن (هەنگاوی ٣ بخوێنەوە)

---

### 🏗️ هەنگاوی ٢: بیناکردن (Build)

**لە ترمیناڵ (CMD) یان PowerShell:**

```batch
cd C:\laragon\www\active-ecommerce-flutter-app-4.4.0\source_code

flutter pub get

flutter build web --release
```

**چاوەڕوانبە** (٢-٥ خولەک دەخایەنێت)

**ئەنجام:**
- فایلەکان لە `source_code/build/web/` دروست دەبن
- ئەم فایلانە پێویستن:
  - index.html
  - main.dart.js
  - assets/
  - ...

---

### 📤 هەنگاوی ٣: بەرزکردنەوە بۆ سێرڤەر (FTP)

**بە FileZilla (ئاسانترین):**

1. **FileZilla دابمەزرێنە:**
   - https://filezilla-project.org/download.php

2. **بەستنەوە بە سێرڤەر:**
   - Host: `128.140.110.248`
   - Username: (یوزرنەیمی FTP کە هەیەتی)
   - Password: (پاسۆردەکە)
   - Port: `21` (یان بە بەتاڵی بەجێبهێڵە)
   - Quickconnect کرتە بکە

3. **فایلەکان بگوازەوە:**
   - لە چەپ (Local): `C:\laragon\www\active-ecommerce-flutter-app-4.4.0\source_code\build\web\`
   - لە ڕاست (Remote): `/var/www/html/new/` (یان ئەو فۆلدەرەی وێب سایتەکەی تیایە)
   - هەموو فایلەکان دەستنیشان بکە لە چەپ
   - ڕایبگرە و بخە بە سەر ڕاستەوە (Drag & Drop)

**بە WinSCP (ئەگەر SSH هەبێت):**
1. WinSCP دابمەزرێنە
2. Host: `128.140.110.248`
3. Username/Password بنووسە
4. Login بکە
5. فایلەکان بگوازەوە

---

### 🌐 هەنگاوی ٤: تاقیکردنەوە

**لە براوسەر:**
- بڕۆ بۆ: `http://128.140.110.248/new/`
- ئەگەر وێنەی دەنگی (loading) بینی، چاوەڕوانبە
- ئەپلیکەیشنەکە دەبێت کار بکات!

---

## 🤖 ڕێگەی ئۆتۆماتیک: GitHub Actions

**ئەگەر ناتوانی Flutter دابمەزرێنی، ئەم ڕێگەیە بەکاربهێنە:**

### هەنگاوی ١: پڕۆژەکە لە GitHub بەرز بکەرەوە

1. بڕۆ بۆ https://github.com/new
2. Repository name: `my-flutter-app`
3. Public یان Private (بە پلان)
4. Create repository

### هەنگاوی ٢: فایلەکان بەرز بکەرەوە

**لە CMD:**
```batch
cd C:\laragon\www\active-ecommerce-flutter-app-4.4.0

git init

git add .

git commit -m "Initial commit"

git remote add origin https://github.com/YOUR_USERNAME/my-flutter-app.git

git push -u origin main
```

### هەنگاوی ٣: GitHub Actions چالاک بکە

1. لە GitHub، بڕۆ بۆ "Actions" tab
2. Flutter workflow دەبێت دەستپێ بکات
3. چاوەڕوانبە تا تەواو بێت (٥-١٠ خولەک)
4. لە "Actions" → Workflow run → Artifacts
5. "flutter-web-build" داگری (فایلی zip)

### هەنگاوی ٤: فایلەکان ببەریتە سەر سێرڤەر

- فایلی zip بکەرەوە
- بە FTP بگوازەوە بۆ سێرڤەر (وەک هەنگاوی ٣ لە سەرەوە)

---

## 🎬 کورتە و ئاسان (چی بکە ئێستا)

### ئەگەر دەتەوێت ئێستا شتێک ببینیت:

**ڕێگەی ١: پیشاندانی لەسەر کۆمپیوتەرەکەی خۆت**

بە بەکارهێنانی Python (ئەگەر دامەزرابێت):
```batch
cd C:\laragon\www\active-ecommerce-flutter-app-4.4.0\source_code\build\web
python -m http.server 8080
```
پاشان لە براوسەر: `http://localhost:8080`

**ڕێگەی ٢: بەکارهێنانی Laragon (ئەگەر دامەزرابێت)**

1. فۆلدەری `build\web` بگوازەوە بۆ `C:\laragon\www\flutter-app\`
2. Laragon restart بکە
3. لە براوسەر: `http://localhost/flutter-app/`

---

## ❓ پرسیارە باوەکان

**پرسیار: Error "flutter not found" دەبینم**
> وەڵام: Flutter دامەزراندنەکەت دروست نەکردووە. Path تنظیم بکە یان cmd restart بکە

**پرسیار: Build شکستی هێنا**
> وەڵام: لە CMD بنووسە:
> ```
> flutter clean
> flutter pub get
> flutter build web --release
> ```

**پرسیار: فایلەکان ناگۆڕم بە FTP**
> وەڵام: دڵنیابەرەوە کە ڕۆژشۆی (permission) دروستت هەیە. پەیوەندی بکە بە خاوەنی سێرڤەر.

**پرسیار: Loading ناوەستێت**
> وەڵام: پەیوەندی ئینتەرنێت بپشکنە. ئەگەر API لە کاردایە، CORS کێشەی هەیە.

---

## 📞 پشتیوانی

ئەگەر کێشەیەکت هەبوو، ئەم زانیاریانە بنێرە:
1. چی فێری (error message)
2. لە کام هەنگاوەکیدایت
3. چ سیستمێک بەکاردەهێنی (Windows/Mac/Linux)

**سەرچاوەی فێربوون:**
- Flutter: https://flutter.dev
- Web Deployment: https://flutter.dev/deployment/web
