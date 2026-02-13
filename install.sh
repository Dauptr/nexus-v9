#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                     NEXUS OS V9.0 - AUTO INSTALLER                        ║
# ║                   Self-Installing Cyberpunk OS                            ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

set -e

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║                     NEXUS OS V9.0 INSTALLER                               ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Detect OS
OS="unknown"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="mac"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    OS="windows"
fi

echo -e "${CYAN}[*] Detected OS: $OS${NC}"
echo ""

# Options
echo "Select installation method:"
echo "  1) Open locally in browser (no server)"
echo "  2) Start local HTTP server"
echo "  3) Deploy to GitHub Pages"
echo "  4) Create new GitHub repository"
echo "  5) Exit"
echo ""
read -p "Enter choice [1-5]: " choice

case $choice in
    1)
        echo -e "${GREEN}[+] Opening NEXUS OS in browser...${NC}"
        if [[ "$OS" == "mac" ]]; then
            open index.html
        elif [[ "$OS" == "linux" ]]; then
            xdg-open index.html 2>/dev/null || sensible-browser index.html 2>/dev/null || google-chrome index.html 2>/dev/null || firefox index.html 2>/dev/null &
        elif [[ "$OS" == "windows" ]]; then
            start index.html
        else
            echo "Please open index.html manually in your browser"
        fi
        ;;
    2)
        echo -e "${GREEN}[+] Starting local server...${NC}"
        PORT=${1:-8080}
        if command -v python3 &> /dev/null; then
            echo -e "${CYAN}[*] Server running at http://localhost:$PORT${NC}"
            echo -e "${YELLOW}[*] Press Ctrl+C to stop${NC}"
            python3 -m http.server $PORT
        elif command -v python &> /dev/null; then
            echo -e "${CYAN}[*] Server running at http://localhost:$PORT${NC}"
            echo -e "${YELLOW}[*] Press Ctrl+C to stop${NC}"
            python -m SimpleHTTPServer $PORT
        elif command -v npx &> /dev/null; then
            echo -e "${CYAN}[*] Server running at http://localhost:$PORT${NC}"
            echo -e "${YELLOW}[*] Press Ctrl+C to stop${NC}"
            npx serve -p $PORT
        else
            echo -e "${YELLOW}[!] No Python or Node.js found. Please install one of them.${NC}"
            exit 1
        fi
        ;;
    3)
        echo -e "${GREEN}[+] Setting up GitHub Pages deployment...${NC}"
        
        # Check if git is installed
        if ! command -v git &> /dev/null; then
            echo -e "${YELLOW}[!] Git is not installed. Please install git first.${NC}"
            exit 1
        fi
        
        # Check if already in a git repo
        if [ -d ".git" ]; then
            echo -e "${CYAN}[*] Git repository already exists${NC}"
        else
            echo -e "${CYAN}[*] Initializing git repository...${NC}"
            git init
        fi
        
        # Create .nojekyll to prevent Jekyll processing
        touch .nojekyll
        
        # Add and commit
        git add -A
        git commit -m "Deploy NEXUS OS V9.0" || echo "No changes to commit"
        
        echo ""
        echo -e "${GREEN}[+] Ready to deploy!${NC}"
        echo ""
        echo "Next steps:"
        echo "  1. Create a new repository on GitHub"
        echo "  2. Run: git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git"
        echo "  3. Run: git push -u origin main (or master)"
        echo "  4. Go to repository Settings → Pages → Select 'main' branch → Save"
        echo "  5. Your NEXUS OS will be live at: https://YOUR_USERNAME.github.io/YOUR_REPO/"
        echo ""
        ;;
    4)
        echo -e "${GREEN}[+] Creating GitHub repository...${NC}"
        
        if ! command -v gh &> /dev/null; then
            echo -e "${YELLOW}[!] GitHub CLI (gh) is not installed.${NC}"
            echo "Install it from: https://cli.github.com/"
            echo ""
            echo "Alternative: Create repo manually at https://github.com/new"
            exit 1
        fi
        
        read -p "Repository name [nexus-os]: " repo_name
        repo_name=${repo_name:-nexus-os}
        
        read -p "Public or Private? (p/P) [p]: " visibility
        visibility=${visibility:-p}
        
        if [[ "$visibility" == "P" ]]; then
            vis_flag="--private"
        else
            vis_flag="--public"
        fi
        
        # Create .nojekyll
        touch .nojekyll
        
        # Initialize git if needed
        if [ ! -d ".git" ]; then
            git init
        fi
        
        # Create repo and push
        gh repo create "$repo_name" $vis_flag --source=. --remote=origin --push
        
        # Enable GitHub Pages
        echo -e "${CYAN}[*] Enabling GitHub Pages...${NC}"
        gh api -X POST repos/{owner}/{repo}/pages -f source='{"branch":"main"}' 2>/dev/null || \
        gh api -X POST repos/{owner}/{repo}/pages -f source='{"branch":"master"}' 2>/dev/null || \
        echo "Please enable Pages manually in repository settings"
        
        echo ""
        echo -e "${GREEN}[+] Repository created!${NC}"
        echo "Your NEXUS OS will be live shortly at:"
        gh repo view --web
        ;;
    5)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo ""
echo -e "${CYAN}═════════════════════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}  NEXUS OS V9.0 [SENTIENT] - Ready!${NC}"
echo -e "${CYAN}  Configure API: Open Settings app or use URL params:${NC}"
echo -e "${YELLOW}  ?api_key=YOUR_KEY&api_base=https://api.openai.com/v1${NC}"
echo -e "${CYAN}═════════════════════════════════════════════════════════════════════════════${NC}"
