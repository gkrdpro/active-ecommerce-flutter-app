# ڕێنماییەکانی Flutter Web

## کورتی بابەت
ئەم پڕۆژەیە ئەپلیکەیشنێکی Flutterـە بۆ ئی-commerce. ئەم فایلانەی خوارەوە دروستمان کرد بۆ یارمەتیت بدەن لە کردنەوەی وەب ئەپلیکەیشن و پیشاندانی:

## 📁 فایلە نوێیەکان

### 1. `build_web.bat`
بۆ بیناکردنی ئەپلیکەیشنەکە ئەگەر Flutter دابمەزرێنرا بێت لە کۆمپیوتەرەکەتدا

### 2. `preview_server.py`
بۆ پیشاندانی وێب ئەپلیکەیشنەکە دوای بیناکردن

### 3. `.github/workflows/flutter-web-build.yml`
بۆ بیناکردنی ئۆتۆماتیک لە ڕێگەی GitHub Actions

### 4. `Dockerfile`
بۆ بیناکردن بە بەکارهێنانی Docker

---

## 🚀 ڕێگاکان بۆ بیناکردن

### ڕێگەی ١: دامەزراندنی Flutter لە کۆمپیوتەرەکەت

١. **دامەزراندنی Flutter:**
   - سەردانی بکە: https://docs.flutter.dev/get-started/install/windows
   - Flutter SDK دابمەزرێنە
   - path تنظیم بکە

٢. **پشتڕاستکردنەوە:**
   ```bash
   flutter doctor
   flutter config --enable-web
   ```

٣. **بیناکردن:**
   - فایلی `build_web.bat` کرتە بکە دووجار
   - یان فەرمانەکان بە دەستی بنووسە:
   ```bash
   cd source_code
   flutter pub get
   flutter build web --release
   ```

### ڕێگەی ٢: بەکارهێنانی Docker (بێ دامەزراندنی Flutter)

١. دڵنیابەرەوە لە دامەزراندنی Docker
٢. لە ترمیناڵ فەرمانی بنووسە:
   ```bash
   docker build -t flutter-web-app .
   docker run -d -p 8080:80 flutter-web-app
   ```
٣. لە براوسەر بڕۆ بۆ: `http://localhost:8080`

### ڕێگەی ٣: GitHub Actions (ئۆتۆماتیک)

١. پڕۆژەکە لەسەر GitHub بەرز بکەرەوە
٢. فایلی `.github/workflows/flutter-web-build.yml` پێشتر دروستکراوە
٣. هەر کاتێک push بکەیت، بیناکردن ئۆتۆماتیک دەبێت
٤. ئەنجامەکە لە GitHub Actions دا دەتوانی ببینیت

---

## 👁️ چۆن پیشاندانی (Preview) بکەیت

### بە Python (ئاسانترین)

باشترین ڕێگە بۆ بینین پێش دەرکردن:

```bash
# پێشنیازی Python 3
python preview_server.py
```

پاشان لە براوسەر بڕۆ بۆ: **http://localhost:8080**

### بە Flutter خۆی

```bash
cd source_code
flutter run -d chrome --release
```

### بە Laragon (ئەگەر دامەزرابێت)

١. فایلەکانی `build/web/` بگوازەوە بۆ فۆلدەری `www` لە Laragon
٢. Laragon restart بکە
٣. لە براوسەر بڕۆ بۆ `http://localhost/source_code/build/web/`

---

## 🌐 چۆن دەرکەیت (Deploy) بۆ وێب

### بۆ خۆڕهێنەر (Hosting):

**بۆ Netlify:**
١. فایلەکانی `source_code/build/web/` هەڵبگرە
٢. بەرزیکەرەوە لە netlify.com
٣. drag & drop بکە

**بۆ Vercel:**
١. `npm i -g vercel` دابمەزرێنە
٢. `cd source_code/build/web`
٣. `vercel --prod`

**بۆ GitHub Pages:**
- workflow پێشتر ئامادەیە، تەنها لە GitHub Actions چالاک بکە

---

## ⚙️ ڕێکخستنی API (بەستن بە وێب سایت)

بۆ بەستنی ئەپلیکەیشنەکە بە وێب سایتەکەت `https://128.140.110.248/new`:

١. بڕۆ بۆ `source_code/lib/`
٢. فایلی `app_config.dart` یان `constants.dart` بگەڕێ (ئەگەر هەبێت)
٣. URLەکە بگۆڕە بۆ APIی ڕاستەقینە:
   ```dart
   const String BASE_URL = 'https://128.140.110.248/new/api/v1';
   ```

---

## 🔧 کێشە و چارەسەر

**Flutter دامەزراو نییە:**
- https://docs.flutter.dev/get-started/install/windows

**کێشە لە بیناکردن:**
```bash
cd source_code
flutter clean
flutter pub get
flutter build web --release
```

**CORS کێشە:**
ئەگەر API کێشەی CORS هەبێت، پێویستە لە servery وێب CORS چالاک بکەیت.

---

## 📞 پشتیوانی

بۆ زانیاری زیاتر:
- Flutter Docs: https://docs.flutter.dev/
- Flutter Web: https://flutter.dev/web

---

**ئامادەکراوە لە:** `build_web.bat`, `preview_server.py`
**بۆ:** ئەپلیکەیشی Active eCommerce Flutter 4.4.0
