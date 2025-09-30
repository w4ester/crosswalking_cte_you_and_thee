/**
 * Edu Pilot Chat Client
 * Reusable chat client for integrating Creation Station AI into CTE crosswalk pages
 *
 * Usage:
 *   const chat = new EduPilotChat({
 *     proxyUrl: 'http://localhost:8080/api/v1/proxy/chat',
 *     containerId: 'chatSection',
 *     pageFilter: 'pss'
 *   });
 *   chat.init();
 */

class EduPilotChat {
  constructor(options = {}) {
    this.proxyUrl = options.proxyUrl
      || localStorage.getItem('edu_pilot_proxy_url')
      || 'http://localhost:8080/api/v1/proxy/chat';

    this.containerId = options.containerId || 'chatSection';
    this.pageFilter = options.pageFilter || '';
    this.onError = options.onError || this.defaultErrorHandler.bind(this);

    this.messageIdCounter = 0;
  }

  /**
   * Initialize chat UI and event listeners
   */
  init() {
    const container = document.getElementById(this.containerId);
    if (!container) {
      console.error(`Chat container #${this.containerId} not found`);
      return;
    }

    // Build UI
    container.innerHTML = this.buildChatHTML();

    // Wire up event listeners
    this.input = document.getElementById('eduPilotInput');
    this.sendBtn = document.getElementById('eduPilotSend');
    this.messages = document.getElementById('eduPilotMessages');
    this.clearBtn = document.getElementById('eduPilotClear');

    this.sendBtn.addEventListener('click', () => this.handleSend());
    this.input.addEventListener('keypress', (e) => {
      if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        this.handleSend();
      }
    });

    if (this.clearBtn) {
      this.clearBtn.addEventListener('click', () => this.clearHistory());
    }

    // Load chat history from localStorage
    this.loadHistory();
  }

  /**
   * Generate chat UI HTML
   */
  buildChatHTML() {
    return `
      <div class="edu-pilot-chat">
        <div class="chat-header">
          <h3>Ask About This Cluster</h3>
          <button id="eduPilotClear" class="btn-clear" aria-label="Clear chat history">Clear</button>
        </div>
        <div class="chat-messages" id="eduPilotMessages" role="log" aria-live="polite"></div>
        <div class="chat-input-wrapper">
          <input
            id="eduPilotInput"
            type="text"
            placeholder="Ask about programs, pathways, or credentials..."
            aria-label="Chat input"
          >
          <button id="eduPilotSend" class="btn-send" aria-label="Send message">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="currentColor">
              <path d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z"/>
            </svg>
          </button>
        </div>
        <div class="chat-suggestions" id="eduPilotSuggestions"></div>
      </div>
    `;
  }

  /**
   * Handle send button click
   */
  async handleSend() {
    const question = this.input.value.trim();
    if (!question) return;

    this.input.value = '';
    this.input.disabled = true;
    this.sendBtn.disabled = true;

    // Append user message
    this.appendMessage('user', question);

    // Show loading indicator
    const loadingId = this.appendMessage('assistant', this.buildLoadingHTML(), true);

    try {
      const { answer, citations } = await this.ask(question);

      // Replace loading with actual response
      this.replaceMessage(loadingId, this.renderAnswer(answer, citations));

      // Save to history
      this.saveToHistory('user', question);
      this.saveToHistory('assistant', { answer, citations });
    } catch (err) {
      console.error('Chat error:', err);
      this.replaceMessage(
        loadingId,
        '<span class="error-message">Sorry, the assistant is unavailable right now. Please try again later.</span>'
      );
      this.onError(err);
    } finally {
      this.input.disabled = false;
      this.sendBtn.disabled = false;
      this.input.focus();
    }
  }

  /**
   * Query the Edu Pilot proxy
   * @param {string} question - User query
   * @returns {Promise<{answer: string, citations: object}>}
   */
  async ask(question) {
    const filters = this.pageFilter ? { page: this.pageFilter } : {};

    const res = await fetch(this.proxyUrl, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ question, filters })
    });

    if (!res.ok) {
      const err = await res.json().catch(() => ({ detail: res.statusText }));
      throw new Error(err.detail || 'Proxy call failed');
    }

    return await res.json();
  }

  /**
   * Append a message to the chat
   * @param {string} role - 'user' or 'assistant'
   * @param {string|object} content - Message content
   * @param {boolean} isLoading - Is this a loading placeholder?
   * @returns {string} Message ID
   */
  appendMessage(role, content, isLoading = false) {
    const id = `edu-pilot-msg-${++this.messageIdCounter}`;
    const div = document.createElement('div');
    div.id = id;
    div.className = `chat-message chat-message-${role}`;
    if (isLoading) div.classList.add('loading');

    if (typeof content === 'string') {
      div.innerHTML = content;
    } else if (role === 'assistant' && content.answer) {
      div.innerHTML = this.renderAnswer(content.answer, content.citations);
    }

    this.messages.appendChild(div);
    this.messages.scrollTop = this.messages.scrollHeight;

    return id;
  }

  /**
   * Replace message content
   * @param {string} id - Message ID
   * @param {string} content - New HTML content
   */
  replaceMessage(id, content) {
    const msg = document.getElementById(id);
    if (msg) {
      msg.innerHTML = content;
      msg.classList.remove('loading');
    }
  }

  /**
   * Render answer with citation chips
   * @param {string} markdown - Markdown answer text
   * @param {object} citations - Citations object
   * @returns {string} HTML string
   */
  renderAnswer(markdown, citations = {}) {
    let html = this.escapeHtml(markdown);

    // Simple markdown parsing (newlines, bold, italic)
    html = html.replace(/\n\n/g, '</p><p>');
    html = html.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>');
    html = html.replace(/\*(.+?)\*/g, '<em>$1</em>');

    // Replace [n] markers with citation chips
    Object.keys(citations).forEach(num => {
      const cite = citations[num];
      const chip = `<a
        href="${cite.source_url}"
        class="citation-chip"
        target="_blank"
        rel="noopener noreferrer"
        aria-label="${this.escapeHtml(cite.aria_label)}"
        title="${this.escapeHtml(cite.citation_label)}"
      >[${num}]</a>`;
      html = html.replace(new RegExp(`\\[${num}\\]`, 'g'), chip);
    });

    return `<p>${html}</p>`;
  }

  /**
   * Build loading indicator HTML
   */
  buildLoadingHTML() {
    return `
      <div class="typing-indicator">
        <span></span>
        <span></span>
        <span></span>
      </div>
    `;
  }

  /**
   * Save message to localStorage history
   */
  saveToHistory(role, content) {
    const key = `edu_pilot_history_${this.pageFilter}`;
    let history = [];

    try {
      history = JSON.parse(localStorage.getItem(key) || '[]');
    } catch (e) {
      console.error('Failed to load history:', e);
    }

    history.push({
      role,
      content,
      timestamp: Date.now()
    });

    // Keep last 50 messages
    if (history.length > 50) {
      history = history.slice(-50);
    }

    try {
      localStorage.setItem(key, JSON.stringify(history));
    } catch (e) {
      console.error('Failed to save history:', e);
    }
  }

  /**
   * Load chat history from localStorage
   */
  loadHistory() {
    const key = `edu_pilot_history_${this.pageFilter}`;
    let history = [];

    try {
      history = JSON.parse(localStorage.getItem(key) || '[]');
    } catch (e) {
      console.error('Failed to load history:', e);
      return;
    }

    history.forEach(msg => {
      if (msg.role === 'user') {
        this.appendMessage('user', msg.content);
      } else if (msg.role === 'assistant' && msg.content.answer) {
        this.appendMessage('assistant', msg.content);
      }
    });
  }

  /**
   * Clear chat history
   */
  clearHistory() {
    const key = `edu_pilot_history_${this.pageFilter}`;
    localStorage.removeItem(key);
    this.messages.innerHTML = '';
    this.messageIdCounter = 0;
  }

  /**
   * Escape HTML to prevent XSS
   */
  escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
  }

  /**
   * Default error handler
   */
  defaultErrorHandler(error) {
    console.error('Edu Pilot Chat Error:', error);
  }
}

// Export for ES6 modules
if (typeof module !== 'undefined' && module.exports) {
  module.exports = EduPilotChat;
}

// Also attach to window for direct script inclusion
if (typeof window !== 'undefined') {
  window.EduPilotChat = EduPilotChat;
}