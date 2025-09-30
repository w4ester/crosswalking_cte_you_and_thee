#!/usr/bin/env node
/**
 * OpenAI Fallback Proxy Server
 *
 * Simple Express server that proxies requests to OpenAI API
 * Keeps API key secure in .env file (never exposed to frontend)
 *
 * Usage:
 *   1. Copy .env.example to .env
 *   2. Add your OpenAI API key to .env
 *   3. Run: node openai-proxy-server.js
 *   4. Open examples/open-chat.html in browser
 */

const http = require('http');
const https = require('https');
const fs = require('fs');

// Load environment variables from .env file
function loadEnv() {
  const envPath = '.env';
  if (!fs.existsSync(envPath)) {
    console.error('❌ Error: .env file not found!');
    console.error('📝 Create .env from .env.example and add your OpenAI API key');
    process.exit(1);
  }

  const envContent = fs.readFileSync(envPath, 'utf8');
  envContent.split('\n').forEach(line => {
    const trimmed = line.trim();
    if (trimmed && !trimmed.startsWith('#')) {
      const [key, ...valueParts] = trimmed.split('=');
      const value = valueParts.join('=');
      if (key && value) {
        process.env[key.trim()] = value.trim();
      }
    }
  });
}

loadEnv();

const PORT = process.env.PORT || 3001;
const OPENAI_API_KEY = process.env.OPENAI_API_KEY;
const OPENAI_MODEL = process.env.OPENAI_MODEL || 'gpt-4o-mini';

if (!OPENAI_API_KEY || OPENAI_API_KEY === 'sk-your-openai-api-key-here') {
  console.error('❌ Error: OPENAI_API_KEY not set in .env file');
  process.exit(1);
}

// Program data context
const PROGRAM_CONTEXT = `
Maryland CTE Public Safety & Security (PSS) Programs:

## Criminal Justice & Law Enforcement
- Anne Arundel Community College: AAS in Criminal Justice. Certificates: Criminal Justice Certificate, Police Academy Certificate. Credentials: CPR/First Aid, NIMS
- Montgomery College: AAS in Criminal Justice. Certificates: Criminal Justice Certificate, Law Enforcement Certificate. Credentials: CERT, NIMS
- Community College of Baltimore County: AAS in Criminal Justice / Law Enforcement Administration. Credentials: CPR/First Aid, NIMS ICS-100/200
- Prince George's Community College: AAS in Criminal Justice. Certificates: Criminal Justice Certificate, Homeland Security Certificate. Credentials: NIMS certifications
- Howard Community College: AA in Criminal Justice. Certificate: Criminal Justice Certificate. Credentials: LPSILC aligned training
- University of Maryland, College Park: BS in Criminology and Criminal Justice. Credentials: Partial - through partnerships
- Towson University: BS in Criminal Justice / Homeland Security Studies. Credentials: NIMS/ICS, CERT
- University of Baltimore: BS in Criminal Justice / Forensic Studies. Credentials: MPCTC standards aligned

## Emergency Medical Technician (EMT)
- Anne Arundel Community College: AAS in Emergency Medical Services. Certificates: EMT Certificate, Paramedic Certificate. Credentials: MIEMSS EMR/EMT, OSHA 10, NFPA Hazmat
- Montgomery College: AAS in Fire Science & Emergency Services. Certificates: EMT Certificate, Fire Science Certificate. Credentials: NREMT, MIEMSS, NFPA standards
- Community College of Baltimore County: AAS in Emergency Medical Services. Certificates: EMT-Basic, EMT-Intermediate, Paramedic. Credentials: MIEMSS, OSHA 10, NFPA Hazmat
- College of Southern Maryland: AAS in Emergency Medical Services. Certificates: EMT Certificate, Advanced EMT Certificate. Credentials: MIEMSS approved, OSHA, NFPA
- Howard Community College: AAS/AA in Emergency Medical Services. Certificates: EMT Certificate, Paramedic Certificate. Credentials: MIEMSS, OSHA 10, NFPA
- Frederick Community College: AAS in Emergency Medical Services. Certificates: EMT Certificate, Paramedic Certificate. Credentials: MIEMSS, OSHA 10, NFPA
- University of Maryland, Baltimore County: BS in Emergency Health Services. Credentials: NREMT preparation, OSHA, NFPA

## Fire Science
- Montgomery College: Fire Science & Emergency Services programs with NFPA certifications
- Multiple community colleges offer firefighter training aligned with Maryland state certifications

## General Information
All programs align with Maryland state standards and industry certifications. Community colleges typically offer 2-year AAS degrees with embedded certificates. Universities offer 4-year BS degrees with advanced specializations. Many programs include CPR/First Aid, NIMS, OSHA, and field-specific certifications.
`;

// Simple CORS handler
function handleCORS(res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
}

// Proxy handler
async function handleChatRequest(req, res) {
  let body = '';

  req.on('data', chunk => {
    body += chunk.toString();
  });

  req.on('end', async () => {
    try {
      const { question, conversationHistory = [] } = JSON.parse(body);

      if (!question) {
        res.writeHead(400, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ error: 'Question is required' }));
        return;
      }

      // Build messages for OpenAI
      const messages = [
        {
          role: 'system',
          content: `You are a helpful assistant for Maryland Career and Technical Education (CTE) programs in the Public Safety & Security cluster. Use the following program data to answer questions accurately:\n\n${PROGRAM_CONTEXT}\n\nProvide specific information about programs, institutions, degrees, certificates, and credentials. Be concise and helpful. Only answer based on the provided data.`
        },
        ...conversationHistory,
        {
          role: 'user',
          content: question
        }
      ];

      // Call OpenAI API
      const openaiResponse = await callOpenAI(messages);

      handleCORS(res);
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ answer: openaiResponse }));

    } catch (error) {
      console.error('❌ Error:', error.message);
      handleCORS(res);
      res.writeHead(500, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ error: 'Internal server error' }));
    }
  });
}

// Call OpenAI API
function callOpenAI(messages) {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify({
      model: OPENAI_MODEL,
      messages: messages,
      max_completion_tokens: 800
    });

    const options = {
      hostname: 'api.openai.com',
      port: 443,
      path: '/v1/chat/completions',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${OPENAI_API_KEY}`,
        'Content-Length': Buffer.byteLength(postData)
      }
    };

    const req = https.request(options, (res) => {
      let data = '';

      res.on('data', (chunk) => {
        data += chunk;
      });

      res.on('end', () => {
        try {
          const response = JSON.parse(data);
          if (response.error) {
            reject(new Error(response.error.message));
          } else {
            resolve(response.choices[0].message.content);
          }
        } catch (err) {
          reject(err);
        }
      });
    });

    req.on('error', (err) => {
      reject(err);
    });

    req.write(postData);
    req.end();
  });
}

// Create server
const server = http.createServer((req, res) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    handleCORS(res);
    res.writeHead(204);
    res.end();
    return;
  }

  // Handle chat endpoint
  if (req.method === 'POST' && req.url === '/api/chat') {
    handleChatRequest(req, res);
    return;
  }

  // 404 for other routes
  res.writeHead(404, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ error: 'Not found' }));
});

server.listen(PORT, () => {
  console.log('');
  console.log('🚀 OpenAI Fallback Proxy Server');
  console.log('================================');
  console.log(`✅ Running on http://localhost:${PORT}`);
  console.log(`📊 Model: ${OPENAI_MODEL}`);
  console.log(`🔐 API Key: ${OPENAI_API_KEY.substring(0, 8)}...`);
  console.log('');
  console.log('💡 Open examples/open-chat.html in your browser');
  console.log('');
});