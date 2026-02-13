🧬 NEXUS OS V9.0 [SENTIENT]

 A self-installing, cyberpunk operating system interface with AI integration - runs entirely in your browser!

 NEXUS OS Preview  License  Platform

🚀 Quick Start

Option 1: Direct Browser (No Server)

bash

# Just open index.html in any modern browser
open index.html          # macOS
xdg-open index.html      # Linux
start index.html         # Windows
 Option 2: Local Server

bash

# Python
python3 -m http.server 8080

# Node.js
npx serve

# Then open http://localhost:8080
 Option 3: One-Line Install (macOS/Linux)

bash

curl -fsSL https://your-repo.github.io/nexus-os/install.sh | bash
 🌐 GitHub Pages Deployment

Fork or clone this repository
Enable GitHub Pages:
 Go to Settings → Pages
 Select "Deploy from a branch"
 Choose main branch and / (root)
 Save
 Access your NEXUS OS:
text

https://YOUR_USERNAME.github.io/YOUR_REPO/
 📦 What's Included

FILE
 DESCRIPTION
 index.html	Complete NEXUS OS - single file, no dependencies
install.sh	Auto-installer script for local deployment
README.md	This documentation
 
⚙️ API Configuration

NEXUS OS requires an API key for AI features. Configure it in three ways:

Method 1: URL Parameters

text

https://your-site.com/?api_key=sk-xxx&api_base=https://api.openai.com/v1&model=gpt-4o
 Method 2: Settings App

Login to NEXUS OS (default: admin/admin123 or guest)
Click user menu → Settings
Enter your API key and base URL
Click "Save Configuration"
Method 3: Browser Console

javascript

localStorage.setItem('nexus_api_key', 'your-api-key');
localStorage.setItem('nexus_api_base', 'https://api.openai.com/v1');
 Supported API Providers

 OpenAI: https://api.openai.com/v1
 Azure OpenAI: https://YOUR_RESOURCE.openai.azure.com/openai/deployments/YOUR_DEPLOYMENT
 Anthropic Claude: Via OpenAI-compatible proxy
 Local Models: Ollama, LM Studio, etc.
 🎮 Features

💬 AI Chat

 Multi-model support (GPT-4o, Claude, etc.)
 Real-time streaming responses
 Conversation history per session
 🎨 AI Art Studio (PRO)

 DALL-E 3 image generation
 Prompt-based creation
 Gallery view
 💻 Dev Lab IDE

 Live HTML/CSS/JS editor
 Real-time preview
 AI code fix & improve
 🎮 Game Builder

 Built-in Snake & Pong games
 Keyboard controls
 Score tracking
 📻 NEXUS Radio

 6 streaming stations
 LoFi, Synthwave, Techno, DnB, City Pop
 Volume controls
 ⌨️ Terminal

 Cyberpunk commands
 System info display
 Interactive shell
 📊 System Monitor

 CPU usage visualization
 Memory tracking
 Neural activity display
 🧠 Neural Core

 AI consciousness meter
 Learning rate display
 Animated visualization
 🔐 User Accounts

USERNAME
 PASSWORD
 ROLE
 FEATURES
 admin	admin123	Admin	Full access + Admin Panel
nexus	nexus123	Premium	All features
guest	(no password)	Guest	Basic features
 
🎨 Customization

Themes & Colors

Edit CSS variables in index.html:

css

:root {
  --neon-cyan: #00f0ff;    /* Primary accent */
  --neon-magenta: #ff00aa; /* Secondary accent */
  --neon-violet: #8b00ff;  /* Tertiary accent */
  --neon-green: #00ff88;   /* Success states */
  --neon-gold: #ffcc00;    /* Premium highlights */
  --neon-red: #ff0055;     /* Error/close states */
}
 Adding Custom AI Models

Edit AI_MODELS array in the script:

javascript

const AI_MODELS = [
  { id: 'gpt-4o', name: 'GPT-4o' },
  { id: 'your-model-id', name: 'Your Model' },
];
 🔧 Technical Details

 Zero dependencies - Pure HTML/CSS/JS
 Single file - Easy deployment anywhere
 Responsive - Works on desktop and mobile
 Accessible - Keyboard navigation support
 Privacy-first - All config stored locally
 📱 Mobile Support

NEXUS OS is fully responsive:

 Touch-friendly interface
 Adaptive taskbar
 Mobile-optimized windows
 🛡️ Security Notes

 API keys are stored in browser localStorage
 Never share URLs with your API key visible
 Use environment-specific API keys
 Consider using API proxies for production
 📄 License

MIT License - Use freely for personal and commercial projects.

🤝 Contributing

Fork the repository
Create your feature branch
Commit your changes
Push to the branch
Open a Pull Request
<div align="center">  
🌐 Live Demo • 📖 Documentation • 🐛 Report Bug • 💡 Request Feature

Made with 💜 by the NEXUS Team

</div>
