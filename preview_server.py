#!/usr/bin/env python3
"""
Flutter Web Preview Server
This script creates a simple HTTP server to preview the built Flutter web app locally.
"""

import http.server
import socketserver
import os
import sys
from pathlib import Path

# Configuration
PORT = 8080
WEB_DIR = Path(__file__).parent / "source_code" / "build" / "web"

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # Add CORS headers for local development
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()
    
    def log_message(self, format, *args):
        # Custom log format
        print(f"[{self.log_date_time_string()}] {args[0]}")

    def do_GET(self):
        # Handle SPA routing - serve index.html for unknown paths
        path = self.translate_path(self.path)
        if not os.path.exists(path) or os.path.isdir(path):
            self.path = '/index.html'
        return super().do_GET()

def main():
    print("=" * 50)
    print("   Flutter Web Preview Server")
    print("=" * 50)
    print()
    
    # Check if build directory exists
    if not WEB_DIR.exists():
        print(f"❌ Error: Build directory not found at:")
        print(f"   {WEB_DIR}")
        print()
        print("Please build the Flutter web app first:")
        print("   flutter build web --release")
        print()
        sys.exit(1)
    
    # Change to web directory
    os.chdir(WEB_DIR)
    
    # Create server
    handler = MyHTTPRequestHandler
    
    with socketserver.TCPServer(("", PORT), handler) as httpd:
        print(f"✅ Server running at: http://localhost:{PORT}")
        print(f"📁 Serving files from: {WEB_DIR}")
        print()
        print("Press Ctrl+C to stop the server")
        print("-" * 50)
        
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n\n🛑 Server stopped.")
            sys.exit(0)

if __name__ == "__main__":
    main()
