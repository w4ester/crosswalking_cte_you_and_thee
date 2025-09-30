# OpenAI Fallback Setup Guide

This guide explains how to run the OpenAI fallback demo without exposing your API key.

## Architecture

```
Frontend (open-chat.html) → Proxy Server (localhost:3001) → OpenAI API
                             (reads .env for API key)
```

Your API key stays in `.env` (gitignored), never committed to GitHub.

## Quick Setup

### 1. Create `.env` file

Copy the example and add your API key:

```bash
cp .env.example .env
```

Edit `.env` and replace with your actual key:

```bash
OPENAI_API_KEY=sk-proj-YOUR-ACTUAL-KEY-HERE
OPENAI_MODEL=gpt-4o-mini
PORT=3001
```

### 2. Start the Proxy Server

```bash
node openai-proxy-server.js
```

You should see:

```
🚀 OpenAI Fallback Proxy Server
================================
✅ Running on http://localhost:3001
📊 Model: gpt-4o-mini
🔐 API Key: sk-proj-...
```

### 3. Open the Chat Interface

Open `examples/open-chat.html` in your browser (or use a local server):

```bash
# Option 1: Direct file
open examples/open-chat.html

# Option 2: With local server (recommended)
python -m http.server 5501
# Then visit: http://localhost:5501/examples/open-chat.html
```

## Security Notes

✅ **Safe to commit:**
- `.env.example` (template with fake keys)
- `openai-proxy-server.js` (server code)
- `examples/open-chat.html` (frontend code)

❌ **NEVER commit:**
- `.env` (contains real API key)

The `.gitignore` already includes `.env`, so it won't be committed accidentally.

## How It Works

1. Frontend calls `http://localhost:3001/api/chat` with the user's question
2. Proxy server reads `OPENAI_API_KEY` from `.env`
3. Proxy server calls OpenAI API on behalf of frontend
4. Proxy server returns response to frontend
5. **API key never exposed to browser or GitHub**

## For Demo

1. Start the proxy server before your demo
2. Open `examples/open-chat.html`
3. Chat works seamlessly - looks exactly like your edu-pilot integration
4. Nobody sees that it's using OpenAI fallback

## Troubleshooting

### Error: "assistant is unavailable"
- Make sure proxy server is running (`node openai-proxy-server.js`)
- Check console for errors

### Error: ".env file not found"
- Copy `.env.example` to `.env`
- Add your OpenAI API key

### Error: "OPENAI_API_KEY not set"
- Edit `.env` and replace the placeholder with your real key

### CORS errors
- Use a local server instead of opening HTML file directly
- Run: `python -m http.server 5501`

## Cost Estimate

GPT-4o-mini pricing:
- Input: $0.15 / 1M tokens
- Output: $0.60 / 1M tokens

Typical demo (50 questions):
- ~$0.01 - $0.05 total

Very affordable for demos!

## Alternative: Deploy with Vercel/Netlify

For a public demo, deploy the proxy as a serverless function:

1. Add `.env` variables in Vercel/Netlify dashboard
2. Deploy `openai-proxy-server.js` as API route
3. Update `PROXY_URL` in `open-chat.html` to deployed URL

Let me know if you need help with deployment!