#!/bin/bash

# Quick test server for Edu Pilot Chat integration
# Usage: ./examples/test-server.sh

set -e

echo "🚀 Starting CTE Crosswalk Test Server"
echo "======================================"
echo ""

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    echo "   Usage: ./examples/test-server.sh"
    exit 1
fi

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python 3 is not installed"
    exit 1
fi

# Port configuration
PORT=5501
PROXY_PORT=8080

echo "📋 Configuration:"
echo "   Frontend server: http://127.0.0.1:${PORT}"
echo "   Proxy backend:   http://localhost:${PROXY_PORT}"
echo ""

# Check if proxy is running
echo "🔍 Checking if Edu Pilot proxy is running..."
if curl -s http://localhost:${PROXY_PORT}/health &> /dev/null; then
    echo "✅ Proxy is running on port ${PROXY_PORT}"
else
    echo "⚠️  Warning: Proxy backend is not running on port ${PROXY_PORT}"
    echo "   Start it with: PYTHONPATH=backend uvicorn backend.edu_pilot.main:app --host 0.0.0.0 --port ${PROXY_PORT}"
    echo "   (Chat will not work without the backend running)"
fi

echo ""
echo "🌐 Starting Python HTTP server on port ${PORT}..."
echo ""
echo "📂 Available pages:"
echo "   • Landing:         http://127.0.0.1:${PORT}/index.html"
echo "   • PSS Crosswalk:   http://127.0.0.1:${PORT}/pss_crosswalk.html"
echo "   • Education:       http://127.0.0.1:${PORT}/003_ed_crosswalk-table.html"
echo "   • Digital Tech:    http://127.0.0.1:${PORT}/dt-crosswalk-table.html"
echo "   • ENR:             http://127.0.0.1:${PORT}/enr-crosswalk-table.html"
echo "   • Chat Example:    http://127.0.0.1:${PORT}/examples/pss-chat-integration-example.html"
echo ""
echo "💡 Tip: To change the proxy URL in browser console:"
echo "   localStorage.setItem('edu_pilot_proxy_url', 'http://localhost:${PROXY_PORT}/api/v1/proxy/chat')"
echo ""
echo "Press Ctrl+C to stop the server"
echo "======================================"
echo ""

# Start the server
python3 -m http.server ${PORT}