# Edu Pilot Chat Integration - Quick Start

## 5-Minute Integration

### Step 1: Add Files to Your Project

Copy these files to your project:
```bash
examples/edu-pilot-chat-client.js    → /assets/js/
examples/edu-pilot-chat-styles.css   → /assets/css/
```

### Step 2: Include in Your HTML

Add to the `<head>` section:
```html
<link rel="stylesheet" href="assets/css/edu-pilot-chat-styles.css">
```

Add before closing `</body>` tag:
```html
<!-- Chat container -->
<div id="chatSection"></div>

<!-- Chat client script -->
<script src="assets/js/edu-pilot-chat-client.js"></script>

<!-- Initialize chat -->
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const chat = new EduPilotChat({
      proxyUrl: 'http://localhost:8080/api/v1/proxy/chat',
      containerId: 'chatSection',
      pageFilter: 'pss'  // Change per page: 'pss', 'ed', 'dt', 'enr'
    });
    chat.init();
  });
</script>
```

### Step 3: Update for Each Page

Change the `pageFilter` value for each crosswalk:

| File | pageFilter Value |
|------|------------------|
| `pss_crosswalk.html` | `'pss'` |
| `003_ed_crosswalk-table.html` | `'ed'` |
| `dt-crosswalk-table.html` | `'dt'` |
| `enr-crosswalk-table.html` | `'enr'` |

### Step 4: Test Locally

1. Start the Edu Pilot proxy backend:
   ```bash
   PYTHONPATH=backend uvicorn backend.edu_pilot.main:app --host 0.0.0.0 --port 8080
   ```

2. Open your crosswalk page in a browser

3. Try asking: "What programs are available?"

### Step 5: Deploy with Tunnel

For testing from GitHub Pages or sharing:

1. Start ngrok or similar tunnel:
   ```bash
   ngrok http 8080
   ```

2. Update the proxy URL in your script:
   ```javascript
   proxyUrl: 'https://your-subdomain.ngrok.io/api/v1/proxy/chat'
   ```

## Customization Options

### Change Chat Position

Add custom CSS:
```css
#chatSection {
  margin-top: 60px;
  max-width: 900px;
  margin-left: auto;
  margin-right: auto;
}
```

### Add Suggested Questions

```javascript
chat.init();

// Add after initialization
const suggestions = document.getElementById('eduPilotSuggestions');
suggestions.innerHTML = `
  <div class="suggestion-chip" onclick="askQ('What EMT programs exist?')">
    EMT Programs
  </div>
`;

window.askQ = function(q) {
  document.getElementById('eduPilotInput').value = q;
  document.getElementById('eduPilotSend').click();
};
```

### Custom Error Handling

```javascript
const chat = new EduPilotChat({
  proxyUrl: 'http://localhost:8080/api/v1/proxy/chat',
  containerId: 'chatSection',
  pageFilter: 'pss',
  onError: function(error) {
    alert('Chat is temporarily unavailable. Please try again later.');
    console.error(error);
  }
});
```

### Override Proxy URL via localStorage

Users can override the proxy URL without code changes:

```javascript
// In browser console:
localStorage.setItem('edu_pilot_proxy_url', 'https://custom-url.com/api/v1/proxy/chat');
```

Then refresh the page. The chat client checks localStorage first.

## Troubleshooting

**Chat doesn't appear:**
- Check browser console for errors
- Verify `chatSection` div exists in HTML
- Ensure scripts are loaded (check Network tab)

**CORS errors:**
- Verify your URL is in the backend's allowed origins
- Check backend logs for CORS configuration

**"Unavailable" message:**
- Backend may be down - check if it's running
- Check proxy URL is correct
- Look at browser Network tab for failed requests

**Citations don't link:**
- Check `citations` object in browser console
- Verify `source_url` fields are present

## Support

- Full documentation: `EDU_PILOT_PROXY_INTEGRATION.md`
- Example implementation: `examples/pss-chat-integration-example.html`
- Backend issues: Contact backend team