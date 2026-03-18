@echo off
chcp 65001
cls
echo ============================================
echo    Flutter Web Builder - Windows Script
echo ============================================
echo.

:: Check if Flutter is installed
where flutter >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Flutter دامەزراو نییە لە سیستمەکەتدا!
    echo.
    echo ڕێگاکان بۆ چارەسەرکردن:
    echo 1. دامەزراندنی Flutter: https://docs.flutter.dev/get-started/install/windows
    echo 2. بەکارهێنانی Docker (ئەگەر دامەزرابێت)
    echo 3. بەکارهێنانی GitHub Actions (بۆ ئۆتۆماتیک کردن)
    echo.
    pause
    exit /b 1
)

echo [1/4] Checking Flutter installation...
flutter doctor -v

echo.
echo [2/4] Enabling Flutter Web support...
flutter config --enable-web

echo.
echo [3/4] Getting dependencies...
cd source_code
flutter pub get
if %errorlevel% neq 0 (
    echo [ERROR] Failed to get dependencies!
    pause
    exit /b 1
)

echo.
echo [4/4] Building Flutter Web application...
flutter build web --release
if %errorlevel% neq 0 (
    echo [ERROR] Build failed!
    pause
    exit /b 1
)

echo.
echo ============================================
echo    BUILD SUCCESSFUL! ✅
echo ============================================
echo.
echo Built files are located at:
echo   source_code\build\web\
echo.
echo To preview the web app locally:
echo   1. Run: flutter run -d chrome --release
echo   2. Or use: python -m http.server 8080
echo      (from the build/web directory)
echo.
pause
