# ڕێنمایی GitHub - چۆن بە GitHub بینا بکەیت

## 🎯 کورتە
**ئەوەی پێویستە:**
1. فایلەکان بەرز بکەیتەوە لە GitHub
2. GitHub Actions ئۆتۆماتیک بینا دەکات
3. فایلەکان دادەگری و دەیاننێریتە سەر سێرڤەر

---

## 📋 هەنگاو بە هەنگاو

### ✅ هەنگاوی ١: دروستکردنی Repository لە GitHub

1. بڕۆ بۆ: https://github.com/new
2. لە "Repository name" بنووسە: `active-ecommerce-flutter`
3. لە "Description" (ئارەزوومەندانە): `Flutter Web App for eCommerce`
4. هەڵبژێرە: **Public** (یان Private ئەگەر پلانی Proت هەبێت)
5. **کلیک لە "Create repository"** بکە

**لە کاتی دامەزراندن CREATE بکە بە بەتاڵی (بێ README)**

---

### ✅ هەنگاوی ٢: فایلەکان بەرز بکەرەوە (Upload)

**ڕێگەی ئاسان (بە Zip):**

1. لە کۆمپیوتەرەکەت، بڕۆ بۆ:
   ```
   C:\laragon\www\active-ecommerce-flutter-app-4.4.0\
   ```

2. ئەم فۆلدەرانە دابنێ بە Zip:
   - `.github/` (هەیە)
   - `source_code/` (هەیە)

3. لە GitHub repository ی نوێت، کلیک لە **"uploading an existing file"** بکە

4. فایلی Zip بکەرەوە (Extract) و هەموو فایلەکان بگۆڕە بۆ GitHub

**ڕێگەی باشتر (بە Git Command):**

1. **CMD یان PowerShell** کردەوە

2. ئەم فەرمانانە بنووسە (یەک بە یەک):

```batch
cd C:\laragon\www\active-ecommerce-flutter-app-4.4.0

git init

git add .

git commit -m "First commit - Flutter eCommerce App"

git branch -M main

git remote add origin https://github.com/YOUR_USERNAME/active-ecommerce-flutter.git

git push -u origin main
```

**بە جێگۆڕکردنی** `YOUR_USERNAME` بە ناوی خۆت لە GitHub

---

### ✅ هەنگاوی ٣: GitHub Actions چالاک بکە (ئۆتۆماتیک بیناکردن)

**باشە!** فایلی `.github/workflows/flutter-web-build.yml` پێشتر دروستکراوە.

1. لە GitHub، لە repository یەکەت، بڕۆ بۆ تابی **"Actions"** (لە سەرەوە)

2. دەبینی workflow ی **"Build and Deploy Flutter Web"** 

3. کلیک لە **"Run workflow"** → **"Run workflow"** بکە

4. **چاوەڕوانبە** (٥-١٠ خولەک):
   - سەوز دەبێت (✅) کاتێک تەواو بوو
   - ئەگەر سور بوو (❌)، کێشەیەک هەیە

---

### ✅ هەنگاوی ٤: فایلەکان بکەرە داونلۆد

کاتێک workflow سەوز بوو (تەواو بوو):

1. لە **"Actions"** tab، کلیک لە workflow ی تەواو بوو بکە

2. خوارەوە، لە **"Artifacts"** بەشی، دەبینی:
   - **flutter-web-build**

3. کلیک لە **flutter-web-build** بکە بۆ داونلۆد کردن

4. فایلی Zip بکەرەوە (Extract) لە کۆمپیوتەرەکەت

**ئێستا فایلەکانی تایبەتە:**
- index.html
- main.dart.js
- flutter.js
- assets/ (وێنەکان)
- ...

---

### ✅ هەنگاوی ٥: بەرزکردنەوە بۆ سێرڤەر (FTP)

**بە FileZilla:**

1. **FileZilla** کردەوە

2. لە سەرەوە، ئەم زانیاریانە بنووسە:
   - **Host:** `128.140.110.248`
   - **Username:** (یوزەرنەیمی FTP)
   - **Password:** (پاسۆردی FTP)
   - **Port:** `21` یان بە بەتاڵی جێی بهێڵە

3. **Quickconnect** کرتە بکە

4. لە چەپ (Local Site):
   - بڕۆ بۆ فۆلدەری زیپەکە کە کردەوە
   - نموونە: `C:\Users\YourName\Downloads\flutter-web-build\`

5. لە ڕاست (Remote Site):
   - بڕۆ بۆ: `/var/www/html/new/`
   - یان `public_html/new/`
   - یان ئەو فۆلدەرەی وێب سایتەکەت لێیەیە

6. **هەموو فایلەکان** دەستنیشان بکە لە چەپ

7. **ڕایبگرە** (Drag) بخە بە سەر ڕاستەوە (Remote)

8. چاوەڕوانبە تا تەواو بێت (بە پێی خێرایی ئینتەرنێت)

---

### ✅ هەنگاوی ٦: تاقیکردنەوە

**لە براوسەر:**
```
http://128.140.110.248/new/
```

**ئەگەر کرتە کرد و loading ناوەستێت:**
- ٢-٣ چرکە چاوەڕوانبە
- ئەپلیکەیشنەکە دەبێت دەربکەوت

---

## 🔄 بۆ ئەپدەیت کردنی داهاتوو

کاتێک گۆڕانکاری لە کۆدەکەدا کرد:

1. فایلەکان بەرز بکەرەوە لە GitHub (هەنگاوی ٢)
2. Actions خۆکارانە دەست پێ دەکات
3. فایلە نوێیەکان دادەگری
4. FTP بکە بۆ گۆڕینەوە

**یان فەرمانەکانی سەرەوە دووبارە بکەرەوە**

---

## ❓ کێشە و چارەسەر

**"git not found" - گیت دامەزراو نییە**
> https://git-scm.com/download/win دابگرە و دابمەزرێنە

**Actions شکستی هێنا (سورە)**
1. لە GitHub → Actions → Workflow run
2. کلیک لە workflow ی سور بکە
3. ببینە چی error ی هەیە
4. بە من بڵێ بۆ یارمەتی

**فایلەکان ناگۆڕم بە FTP**
1. دڵنیابەرەوە لە یوزەرنەیم و پاسۆردی ڕاست
2. ڕۆژشۆی (permission) فۆلدەرەکە بپشکنە
3. لە خاوەنی سێرڤەر بپرسە

---

## 📞 ئەگەر کێشەیەک هەبوو

ئەم زانیاریانە بنێرە:
1. لە کام هەنگاو وەستایت؟
2. چی error دەبینیت؟
3. وێنەی screenshot بنێرە ئەگەر بتوانێت

**ئێستا چ هەنگاوێک ئەنجام بدەیت؟** ١، ٢، ٣، ٤، ٥، یان ٦؟
