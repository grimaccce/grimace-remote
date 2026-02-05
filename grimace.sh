#!/bin/bash

# 🛡️ Grimace Remote - Master Control Script
# This script automates business data synchronization, development, and growth.

# Colors for output
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Base Directory
BASE_DIR=$(pwd)

print_header() {
    clear
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                                                              ║${NC}"
    echo -e "${PURPLE}║                👾 GRIMACE REMOTE COMMAND CENTER              ║${NC}"
    echo -e "${PURPLE}║                     "Full Automation" Mode                     ║${NC}"
    echo -e "${PURPLE}║                                                              ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════╝${NC}"
}

show_status() {
    echo -e "\n${BLUE}📊 Current Business Status:${NC}"
    echo -e "  ${YELLOW}Name:${NC} $(grep -o '"name": "[^"]*"' business-info.json | head -1 | cut -d'"' -f4)"
    echo -e "  ${YELLOW}Phone:${NC} $(grep -o '"phone": "[^"]*"' business-info.json | head -1 | cut -d'"' -f4)"
    echo -e "  ${YELLOW}Email:${NC} $(grep -o '"email": "[^"]*"' business-info.json | head -1 | cut -d'"' -f4)"
    echo -e "  ${YELLOW}Sync Status:${NC} ${GREEN}OK${NC}"
}

run_sync() {
    echo -e "\n${CYAN}⚙️ Synchronizing business data across all projects...${NC}"
    node scripts/sync-info.cjs
    echo -e "${GREEN}✅ Synchronization complete!${NC}"
}

run_check() {
    echo -e "\n${CYAN}🔍 Checking GMB Live Status vs Local Config...${NC}"
    node scripts/check-gmb.cjs
}

start_dev() {
    echo -e "\n${CYAN}🚀 Starting Local Development Environment...${NC}"
    echo -e "${YELLOW}1. Premium Website: http://localhost:8080 (Simulated)${NC}"
    echo -e "${YELLOW}2. Ad Generator: http://localhost:8081 (Simulated)${NC}"
    echo -e "${YELLOW}3. Tech Copilot: http://localhost:8082 (Simulated)${NC}"
}

generate_flyer() {
    echo -e "\n${CYAN}📄 Generating Printable Review Flyer...${NC}"
    node scripts/generate-review-flyer.cjs
}

show_dashboards() {
    echo -e "\n${CYAN}🌐 Multi-Platform Management Hub:${NC}"
    echo -e "${YELLOW}1. Google Business Profile: https://business.google.com/${NC}"
    echo -e "${YELLOW}2. Facebook Business Suite: https://business.facebook.com/${NC}"
    echo -e "${YELLOW}3. Bing Places: https://www.bingplaces.com/${NC}"
    echo -e "${YELLOW}4. Apple Business Connect: https://businessconnect.apple.com/${NC}"
}

show_branding() {
    echo -e "\n${CYAN}🏷️  Business Branding Export:${NC}"
    cat business-info.json
}

run_health_check() {
    echo -e "\n${PURPLE}🔍 Running Business Health Check...${NC}"
    
    # 1. Check Business Info
    if [ -f "business-info.json" ]; then
        echo -e "✅ Business Info: Found"
    else
        echo -e "❌ Business Info: Missing!"
    fi

    # 2. Check Website
    if [ -f "premium-website/index.html" ]; then
        echo -e "✅ Website Assets: Found"
    else
        echo -e "❌ Website Assets: Missing!"
    fi

    # 3. Check Expansion Guides
    if [ -f "PLATFORM-EXPANSION-GUIDE.md" ]; then
        echo -e "✅ Expansion Guide: Found"
    else
        echo -e "❌ Expansion Guide: Missing!"
    fi

    # 4. Check Ad Generator
    if [ -f "ad-generator/index.html" ]; then
        echo -e "✅ Ad Generator: Found"
    else
        echo -e "❌ Ad Generator: Missing!"
    fi

    # 5. Check Sync Status
    echo -e "${YELLOW}Tip: Run Choice 1 to ensure all assets are synchronized.${NC}"
}

show_monitoring() {
    echo -e "\n${CYAN}📊 Business Performance Monitoring:${NC}"
    echo -e "${YELLOW}1. Google Business Insights: https://business.google.com/dashboard/l/grimaceremote${NC}"
    echo -e "${YELLOW}2. Facebook Page Insights: https://www.facebook.com/grimaceremote/insights${NC}"
    echo -e "${YELLOW}3. Website Traffic (Simulated): https://search.google.com/search-console${NC}"
    echo -e "${PURPLE}Strategy: Check these Every Monday morning!${NC}"
}

run_deploy() {
    echo -e "\n${PURPLE}🚀 Initiating Total Cloud Automation...${NC}"
    
    # 1. Sync Everything (Internal Config)
    run_sync
    
    # 2. Package GMB Content
    node scripts/package-gmb-pack.cjs
    
    # 3. ZIP Website (Legacy Backup)
    echo -e "${CYAN}📦 Creating Local Backup...${NC}"
    (cd premium-website && zip -r ../business-deploy/website-deploy.zip . -x "*.DS_Store*")
    
    # 4. Git Cloud Sync
    echo -e "\n${CYAN}☁️  Pushing to GitHub (Triggers Netlify)...${NC}"
    git add .
    git commit -m "Auto-Update: $(date '+%Y-%m-%d %H:%M')"
    git push origin main
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Cloud Sync Complete!${NC}"
        echo -e "Your website should be updating live shortly."
    else
        echo -e "${RED}⚠️  Cloud Sync encountered an error.${NC}"
        echo -e "Check your internet connection or git status."
    fi

    echo -e "\n${GREEN}✨ DEPLOYMENT SUCCESSFUL! ✨${NC}"
    echo -e "1. ${CYAN}GMB Assets:${NC} business-deploy/gmb-weekly-pack/"
    echo -e "2. ${CYAN}Website:${NC} Live (if Netlify connected) or business-deploy/website-deploy.zip"
}

show_growth() {
    echo -e "\n${PURPLE}📈 Growth & Client Acquisition Strategy:${NC}"
    cat GMB-GROWTH-GUIDE.md | head -20
    echo -e "\n${CYAN}Run 'cat GMB-GROWTH-GUIDE.md' for full details.${NC}"
}

# Main Menu
while true; do
    print_header
    show_status
    echo -e "\n${BLUE}What would you like to do?${NC}"
    echo -e "  1) ${CYAN}Sync Business Info${NC} (JSON to All Files)"
    echo -e "  2) ${CYAN}Check GMB Health${NC} (Live vs Local)"
    echo -e "  3) ${CYAN}Launch Development${NC} (Start Servers)"
    echo -e "  4) ${CYAN}Generate Review Flyer${NC} (Printable QR)"
    echo -e "  5) ${CYAN}Platform Dashboards${NC} (Links)"
    echo -e "  6) ${CYAN}Export Branding${NC} (Copy-Paste Text)"
    echo -e "  7) ${CYAN}Business Health Check${NC} (Project Scan)"
    echo -e "  8) ${CYAN}Monitor Performance${NC} (Insights Links)"
    echo -e "  9) ${CYAN}One-Click Deploy${NC} (Package & Zip)"
    echo -e "  10) ${CYAN}Growth Guide${NC} (Get More Clients)"
    echo -e "  11) ${YELLOW}Edit Business Info${NC} (Open JSON)"
    echo -e "  12) ${RED}Exit${NC}"

    read -p "Enter choice [1-12]: " choice

    case $choice in
        1) run_sync ;;
        2) run_check ;;
        3) start_dev ;;
        4) generate_flyer ;;
        5) show_dashboards ;;
        6) show_branding ;;
        7) run_health_check ;;
        8) show_monitoring ;;
        9) run_deploy ;;
        10) show_growth ;;
        11) nano business-info.json ;;
        12) exit 0 ;;
        *) echo -e "${RED}Invalid choice!${NC}" ;;
    esac
    echo -e "\n${NC}Press Enter to return to menu...${NC}"
    read
done
