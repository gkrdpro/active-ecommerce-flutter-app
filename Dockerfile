# Dockerfile for building Flutter Web App
# This allows you to build the web app without installing Flutter locally

FROM cirrusci/flutter:3.10.0-stable

# Enable Flutter Web
RUN flutter config --enable-web

# Set working directory
WORKDIR /app

# Copy pubspec files
COPY source_code/pubspec.yaml source_code/pubspec.lock ./

# Get dependencies
RUN flutter pub get

# Copy source code
COPY source_code/ .

# Build the web app
RUN flutter build web --release

# The output will be in /app/build/web/
