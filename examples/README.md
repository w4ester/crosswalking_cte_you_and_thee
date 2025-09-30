# Edu Pilot Chat Integration Examples

This directory contains everything needed to integrate the Creation Station AI chat into your CTE crosswalk pages.

## Files

### Core Integration Files

| File | Description |
|------|-------------|
| `edu-pilot-chat-client.js` | Reusable JavaScript chat client class |
| `edu-pilot-chat-styles.css` | Complete styling for chat UI |
| `pss-chat-integration-example.html` | Working example showing full integration |

### Documentation

| File | Description |
|------|-------------|
| `QUICK_START.md` | 5-minute integration guide |
| `../EDU_PILOT_PROXY_INTEGRATION.md` | Complete technical documentation |

## Quick Start

See [QUICK_START.md](QUICK_START.md) for a 5-minute integration guide.

## Testing the Example

1. **Start the Edu Pilot proxy backend:**
   ```bash
   PYTHONPATH=backend uvicorn backend.edu_pilot.main:app --host 0.0.0.0 --port 8080
   ```

2. **Open the example in your browser:**
   ```bash
   # Using Python's simple HTTP server
   python -m http.server 5501
   ```

   Then navigate to: `http://127.0.0.1:5501/examples/pss-chat-integration-example.html`

3. **Try sample questions:**
   - "What EMT programs are available in Maryland?"
   - "Tell me about criminal justice pathways"
   - "What credentials can I earn in fire science?"

## Integration Checklist

- [ ] Copy `edu-pilot-chat-client.js` to your project
- [ ] Copy `edu-pilot-chat-styles.css` to your project
- [ ] Add CSS link to `<head>` section
- [ ] Add chat container div: `<div id="chatSection"></div>`
- [ ] Include script and initialize with correct `pageFilter`
- [ ] Test locally with backend running
- [ ] Update proxy URL for production/tunnel
- [ ] Test from deployed environment (GitHub Pages, etc.)

## Per-Page Configuration

Each crosswalk page needs a unique `pageFilter` value:

```javascript
// PSS Crosswalk (pss_crosswalk.html)
const chat = new EduPilotChat({
  pageFilter: 'pss'
});

// Education Crosswalk (003_ed_crosswalk-table.html)
const chat = new EduPilotChat({
  pageFilter: 'ed'
});

// Digital Technology Crosswalk (dt-crosswalk-table.html)
const chat = new EduPilotChat({
  pageFilter: 'dt'
});

// ENR Crosswalk (enr-crosswalk-table.html)
const chat = new EduPilotChat({
  pageFilter: 'enr'
});
```

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    CTE Crosswalk Page                       │
│  ┌───────────────────────────────────────────────────────┐  │
│  │         EduPilotChat JavaScript Client               │  │
│  │  • Manages UI state                                   │  │
│  │  • Handles user input                                 │  │
│  │  • Renders messages & citations                       │  │
│  │  • Persists history to localStorage                   │  │
│  └──────────────────┬────────────────────────────────────┘  │
└─────────────────────┼────────────────────────────────────────┘
                      │ POST /api/v1/proxy/chat
                      │ { question, filters: { page } }
                      ▼
┌─────────────────────────────────────────────────────────────┐
│              Edu Pilot Proxy Backend (FastAPI)              │
│  ┌───────────────────────────────────────────────────────┐  │
│  │  • Validates request                                  │  │
│  │  • Injects system prompt + model ID                   │  │
│  │  • Forwards to Creation Station                       │  │
│  │  • Streams response back (SSE or aggregated JSON)     │  │
│  └──────────────────┬────────────────────────────────────┘  │
└─────────────────────┼────────────────────────────────────────┘
                      │ OpenAI-compatible API
                      ▼
┌─────────────────────────────────────────────────────────────┐
│           Creation Station (LLM with RAG)                   │
│  • Processes query with context                             │
│  • Retrieves relevant crosswalk data                        │
│  • Generates markdown answer with [n] citation markers      │
│  • Returns { answer, citations } object                     │
└─────────────────────────────────────────────────────────────┘
```

## Features

✅ **Auto-save chat history** - Persists to localStorage per page
✅ **Citation chips** - Clickable inline references with URLs
✅ **Loading indicators** - Animated typing indicator
✅ **Error handling** - Graceful fallbacks for network issues
✅ **Accessibility** - ARIA labels, focus management, keyboard navigation
✅ **Responsive design** - Works on mobile and desktop
✅ **Clear history** - Users can reset conversation
✅ **Suggested questions** - Optional quick-start prompts

## Browser Support

- Chrome/Edge 90+
- Firefox 88+
- Safari 14+
- Mobile browsers (iOS Safari 14+, Chrome Android)

## Performance

- Chat client: ~8KB minified
- Styles: ~6KB
- No external dependencies (vanilla JavaScript)
- Lazy-loads history from localStorage

## Security

- API key never exposed to client
- All requests go through proxy backend
- HTML sanitization for markdown rendering
- CORS protection on backend

## Customization

### Change Colors

Edit `edu-pilot-chat-styles.css`:

```css
/* Primary gradient (MSDE colors) */
background: linear-gradient(135deg, #BD0934, #FFC838);

/* Message bubbles */
.chat-message-user {
  background: linear-gradient(135deg, #BD0934, #FFC838);
}

/* Citation chips */
.citation-chip {
  background: #0ea5e9;
}
```

### Adjust Chat Height

```css
.chat-messages {
  max-height: 600px; /* Change from default 500px */
  min-height: 350px; /* Change from default 300px */
}
```

### Position Chat

```css
#chatSection {
  position: fixed;
  bottom: 20px;
  right: 20px;
  max-width: 400px;
  z-index: 1000;
}
```

## API Reference

See [EduPilotChat Class Documentation](../EDU_PILOT_PROXY_INTEGRATION.md#client-integration) for complete API details.

### Constructor Options

```javascript
new EduPilotChat({
  proxyUrl: string,      // Proxy endpoint URL
  containerId: string,   // DOM container ID
  pageFilter: string,    // Page context filter
  onError: function      // Error callback
})
```

### Public Methods

```javascript
chat.init()                          // Initialize UI and events
chat.ask(question: string)           // Send query to backend
chat.clearHistory()                  // Clear localStorage history
chat.appendMessage(role, content)    // Manually add message
```

## Testing

### Unit Testing

```bash
# Run jest tests (if you add test coverage)
npm test
```

### Manual Testing Checklist

- [ ] Chat UI renders correctly
- [ ] User can type and send messages
- [ ] Loading indicator appears during requests
- [ ] Assistant responses display properly
- [ ] Citation chips are clickable and open correct URLs
- [ ] Error messages show when backend is down
- [ ] Clear button removes all messages
- [ ] History persists after page refresh
- [ ] Mobile layout works (< 768px width)
- [ ] Keyboard navigation works (Tab, Enter)
- [ ] Screen reader announces messages (test with VoiceOver/NVDA)

## Troubleshooting

See [EDU_PILOT_PROXY_INTEGRATION.md - Troubleshooting](../EDU_PILOT_PROXY_INTEGRATION.md#troubleshooting) for common issues and solutions.

## Contributing

When updating the chat client:

1. Update `edu-pilot-chat-client.js`
2. Update styles in `edu-pilot-chat-styles.css`
3. Test with `pss-chat-integration-example.html`
4. Update documentation in this README and QUICK_START.md
5. Commit with descriptive message: `feat(chat): add X feature`

## License

Educational use - Maryland State Department of Education

## Support

For questions or issues:
- Technical docs: `EDU_PILOT_PROXY_INTEGRATION.md`
- Backend team: Contact for proxy/API issues
- Frontend issues: Open GitHub issue with `[Chat Integration]` label