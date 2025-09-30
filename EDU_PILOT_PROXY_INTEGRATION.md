# Edu Pilot Proxy Integration Guide

## Overview

This guide explains how to integrate the CTE crosswalk site with the Creation Station AI model via the Edu Pilot proxy backend. The proxy provides chat completions with intelligent citations drawn from the crosswalk corpus.

## Proxy Details

- **Base URL**: `http://localhost:8080` (or tunnel URL when deployed)
- **Endpoint**: `POST /api/v1/proxy/chat`
- **CORS Allowed Origins** (pre-configured server-side):
  - `http://127.0.0.1:5501`
  - `http://localhost:5173`
  - `https://w4ester.github.io`

## Backend Environment (For Reference)

The proxy backend is already configured with these environment variables:

```bash
export EP_API_URL=http://localhost:8080
export EP_MODEL_ID=college-career-mapping-model
export EP_API_KEY=<secret>
export CORS_ALLOW_ORIGIN='http://127.0.0.1:5501;http://localhost:5173;https://w4ester.github.io'
```

**Start command:**
```bash
PYTHONPATH=backend uvicorn backend.edu_pilot.main:app --host 0.0.0.0 --port 8080
```

## Request Contract

### Request Format

Send JSON to `/api/v1/proxy/chat`:

```json
{
  "question": "What cybersecurity programs are available?",
  "filters": {
    "page": "dt"
  }
}
```

**Fields:**
- `question` (string, required): The user's query
- `filters` (object, optional): Metadata to scope the response
  - `page` (string): One of `"pss"`, `"ed"`, `"dt"`, `"enr"`, `"index"`

### Response Format

The proxy returns JSON with:

```json
{
  "answer": "Markdown text with inline [1], [2] citation markers...",
  "citations": {
    "1": {
      "citation_label": "Digital Technology Crosswalk",
      "source_url": "https://w4ester.github.io/crosswalking_cte_you_and_thee/dt-crosswalk-table.html",
      "aria_label": "Source: Digital Technology Crosswalk table"
    },
    "2": { ... }
  }
}
```

## Client Integration

### Basic Implementation (No Streaming)

```javascript
/**
 * Query the Edu Pilot proxy
 * @param {string} question - User query
 * @param {object} filters - Optional metadata filters (e.g., { page: 'pss' })
 * @returns {Promise<{answer: string, citations: object}>}
 */
async function ask(question, filters = {}) {
  const PROXY_URL = 'http://localhost:8080/api/v1/proxy/chat';
  // For production/tunnel: const PROXY_URL = 'https://<subdomain>.ngrok.io/api/v1/proxy/chat';

  const res = await fetch(PROXY_URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ question, filters })
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({ detail: res.statusText }));
    throw new Error(err.detail || 'Proxy call failed');
  }

  const data = await res.json();
  // data.answer => markdown with inline [1], [2] citation markers
  // data.citations => { "1": { citation_label, source_url, aria_label }, ... }

  return data;
}
```

### Streaming Implementation (Future Enhancement)

If you need real-time token streaming, the proxy pipes raw SSE (Server-Sent Events). Replace `await res.json()` with a ReadableStream parser.

## Per-Page Integration

### 1. Add Chat UI to Each Crosswalk Page

Each crosswalk page (PSS, Education, Digital Technology, ENR) should include:

```html
<!-- Add inside the .container div, after the main table -->
<div class="chat-section" id="chatSection">
  <h2>Ask About This Cluster</h2>
  <div class="chat-messages" id="chatMessages" role="log" aria-live="polite"></div>
  <div class="chat-input-wrapper">
    <input
      id="chatInput"
      type="text"
      placeholder="Ask about programs, pathways, or credentials..."
      aria-label="Chat input"
    >
    <button id="chatSend" aria-label="Send message">Send</button>
  </div>
</div>
```

### 2. Initialize Chat Handler

```javascript
// Chat initialization for PSS Crosswalk (pss_crosswalk.html)
(function initPSSChat() {
  const input = document.getElementById('chatInput');
  const sendBtn = document.getElementById('chatSend');
  const messages = document.getElementById('chatMessages');

  async function handleQuery(question) {
    if (!question.trim()) return;

    // Show user message
    appendMessage('user', question);

    // Show loading indicator
    const loadingId = appendMessage('assistant', 'Thinking...');

    try {
      const { answer, citations } = await ask(question, { page: 'pss' });

      // Replace loading message with actual response
      replaceMessage(loadingId, renderAnswer(answer, citations));
    } catch (err) {
      console.error('Chat error:', err);
      replaceMessage(loadingId, 'Sorry, the assistant is unavailable right now.');
    }

    input.value = '';
  }

  sendBtn.addEventListener('click', () => handleQuery(input.value));
  input.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') handleQuery(input.value);
  });

  function appendMessage(role, content) {
    const id = 'msg-' + Date.now();
    const div = document.createElement('div');
    div.id = id;
    div.className = `chat-message chat-message-${role}`;
    div.innerHTML = content;
    messages.appendChild(div);
    messages.scrollTop = messages.scrollHeight;
    return id;
  }

  function replaceMessage(id, content) {
    const msg = document.getElementById(id);
    if (msg) msg.innerHTML = content;
  }

  function renderAnswer(markdown, citations) {
    let html = markdown;

    // Replace [n] markers with citation chips
    Object.keys(citations).forEach(num => {
      const cite = citations[num];
      const chip = `<a
        href="${cite.source_url}"
        class="citation-chip"
        target="_blank"
        rel="noopener"
        aria-label="${cite.aria_label}"
        title="${cite.aria_label}"
      >[${num}]</a>`;
      html = html.replace(new RegExp(`\\[${num}\\]`, 'g'), chip);
    });

    return html;
  }
})();
```

### 3. Page-Specific Filter Values

Use these `page` filter values for each crosswalk:

| Page | Filter Value |
|------|--------------|
| PSS Crosswalk | `"pss"` |
| Education Crosswalk | `"ed"` |
| Digital Technology Crosswalk | `"dt"` |
| ENR Crosswalk | `"enr"` |
| Landing Page | `"index"` |

### 4. Add Styles for Chat UI

```css
/* Chat Section Styles */
.chat-section {
  margin-top: 40px;
  background: #fff;
  border: 1px solid #e2e8f0;
  border-radius: 14px;
  padding: 20px;
  box-shadow: 0 6px 18px rgba(0,0,0,0.08);
}

.chat-messages {
  max-height: 400px;
  overflow-y: auto;
  margin-bottom: 16px;
  padding: 12px;
  background: #f9fafb;
  border-radius: 10px;
}

.chat-message {
  margin-bottom: 12px;
  padding: 10px 14px;
  border-radius: 10px;
  max-width: 80%;
}

.chat-message-user {
  background: linear-gradient(135deg, #BD0934, #FFC838);
  color: #fff;
  margin-left: auto;
  text-align: right;
}

.chat-message-assistant {
  background: #fff;
  border: 1px solid #e2e8f0;
  color: #231F20;
}

.chat-input-wrapper {
  display: flex;
  gap: 10px;
}

#chatInput {
  flex: 1;
  padding: 10px 14px;
  border: 1px solid #e2e8f0;
  border-radius: 10px;
  font-family: inherit;
}

#chatSend {
  padding: 10px 20px;
  background: linear-gradient(135deg, #BD0934, #FFC838);
  color: #fff;
  border: none;
  border-radius: 10px;
  font-weight: 700;
  cursor: pointer;
}

.citation-chip {
  display: inline-flex;
  align-items: center;
  padding: 2px 8px;
  background: #0ea5e9;
  color: #fff;
  text-decoration: none;
  border-radius: 999px;
  font-size: 0.85rem;
  font-weight: 600;
  margin: 0 2px;
  transition: background 0.2s;
}

.citation-chip:hover {
  background: #0284c7;
}
```

## Testing Checklist

### Local Testing
1. Start the Edu Pilot proxy backend: `uvicorn backend.edu_pilot.main:app --host 0.0.0.0 --port 8080`
2. Open your crosswalk page at `http://127.0.0.1:5501/pss_crosswalk.html` (or similar)
3. Test with sample questions:
   - "What EMT programs are available?"
   - "Tell me about criminal justice pathways"
   - "What credentials can I earn?"

### Tunnel/Deployed Testing
1. Update `PROXY_URL` in your `ask()` function to the tunnel URL: `https://<subdomain>.ngrok.io/api/v1/proxy/chat`
2. Test from GitHub Pages: `https://w4ester.github.io/crosswalking_cte_you_and_thee/`
3. Verify CORS works (URL must match allowed origins)

### Troubleshooting

| Issue | Solution |
|-------|----------|
| **CORS Error** | Verify your URL matches one of the allowed origins: `http://127.0.0.1:5501`, `http://localhost:5173`, or `https://w4ester.github.io` |
| **403/500 Response** | Check proxy logs (`uvicorn` process) for upstream error details |
| **Non-JSON Response** | Log `await res.text()` and share with backend team |
| **"EP_* not configured"** | Backend environment variables are missing; contact backend team |
| **Citations not rendering** | Check browser console for JavaScript errors; verify `renderAnswer()` logic |

## Implementation Roadmap

### Phase 1: PSS Crosswalk Pilot
- [ ] Add chat UI to `pss_crosswalk.html`
- [ ] Implement `ask()` function
- [ ] Test with 3-5 sample queries
- [ ] Verify citation links work

### Phase 2: Expand to Other Crosswalks
- [ ] Add to `003_ed_crosswalk-table.html` (filter: `{ page: 'ed' }`)
- [ ] Add to `dt-crosswalk-table.html` (filter: `{ page: 'dt' }`)
- [ ] Add to `enr-crosswalk-table.html` (filter: `{ page: 'enr' }`)

### Phase 3: Student Journey Integration
- [ ] Add chat to `journey.html` "Suggestions" tab
- [ ] Pre-populate filters with user's RIASEC profile
- [ ] Link suggested clusters to relevant crosswalk pages

### Phase 4: Enhanced Features
- [ ] Implement streaming responses (SSE parser)
- [ ] Add "Suggested Questions" chips
- [ ] Save chat history to localStorage
- [ ] Export chat transcript feature

## Configuration

### Environment Variable Override (Frontend)

For local development, you can override the proxy URL using localStorage:

```javascript
// In browser console or app initialization
localStorage.setItem('edu_pilot_proxy_url', 'http://localhost:8080/api/v1/proxy/chat');
```

Update the `ask()` function to check for this:

```javascript
const PROXY_URL = localStorage.getItem('edu_pilot_proxy_url')
  || 'https://default-tunnel.ngrok.io/api/v1/proxy/chat';
```

## Accessibility Considerations

- Use `role="log"` and `aria-live="polite"` on the messages container for screen reader announcements
- Ensure citation chips have `aria-label` attributes with full source descriptions
- Add `aria-label` to the chat input and send button
- Test keyboard navigation (Tab, Enter to send)
- Ensure sufficient color contrast for chat bubbles

## Security Notes

- The proxy keeps the `EP_API_KEY` server-side; never expose it in client code
- Use HTTPS for production tunnel URLs
- Validate and sanitize markdown output to prevent XSS (consider a markdown parser with sanitization)
- Rate-limit chat requests client-side (e.g., max 1 request per 2 seconds)

## Example Full Integration

See `examples/chat-integration-pss.html` for a complete working example of PSS Crosswalk with chat integration.

---

**Questions?** Contact the backend team or open an issue with `[Edu Pilot Proxy]` in the title.