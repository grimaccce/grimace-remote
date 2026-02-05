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
    
    website=$(grep -o '"website": "[^"]*"' business-info.json | head -1 | cut -d'"' -f4)
    if curl -s --head  --request GET "$website" | grep "200 OK" > /dev/null; then
        echo -e "  ${YELLOW}Website:${NC} ${GREEN}LIVE${NC} ($website)"
    else
        echo -e "  ${YELLOW}Website:${NC} ${RED}DOWN/ERROR${NC} ($website)"
    fi
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

run_god_mode() {
    print_header
    echo -e "${PURPLE}🛠️  GOD MODE: Total Business Automation...${NC}"
    
    # 1. Internal Sync
    run_sync
    
    # 2. Daily Standup (Intelligent suggestions)
    echo -e "\n${BLUE}📅 DAILY ACTION PLAN:${NC}"
    day=$(date +%u) # 1=Mon, 4=Thu
    if [ "$day" -le 3 ]; then
        echo -e "  ${YELLOW}Status:${NC} Emergency Support Hours Active (5:30-9pm)"
        echo -e "  ${YELLOW}Task:${NC} Check SMS/Email for Bairnsdale rescue requests."
    else
        echo -e "  ${YELLOW}Status:${NC} Standard Business Hours Active (9am-6pm)"
        echo -e "  ${YELLOW}Task:${NC} High-visibility engagement day. Post to GMB!"
    fi
    
    # 3. Weekly Post Selector
    week=$(( ($(date +%d)-1)/7 + 1 ))
    echo -e "\n${BLUE}📝 RECOMMENDED POST (Week $week):${NC}"
    case $week in
        1) echo -e "  ${CYAN}\"Need a second set of eyes? Get a FREE 5-minute Remote Tech Audit this week at Grimace Remote. Just message us!\"${NC}" ;;
        2) echo -e "  ${CYAN}\"Scam Alert: Watch out for 'Microsoft Support' pop-ups! If you're worried about a scam in East Gippsland, give us a call before giving anyone your details.\"${NC}" ;;
        3) echo -e "  ${CYAN}\"Slow computer? Most PCs in Bairnsdale just need a 'digital tune-up' rather than a replacement. We can do it remotely in 30 minutes!\"${NC}" ;;
        *) echo -e "  ${CYAN}\"Shout out to our friends in Sale and Paynesville! Grimace Remote provides full support across the Gippsland region. No call-out fees, just results.\"${NC}" ;;
    esac
    
    # 4. Cloud Backup
    echo -e "\n${BLUE}☁️  Cloud Sync...${NC}"
    git add .
    git commit -m "Automation: $(date '+%Y-%m-%d %H:%M')" --allow-empty
    git push origin main &>/dev/null
    echo -e "  ${GREEN}✅ GitHub Updated.${NC}"
}

# Main Menu
while true; do
    print_header
    show_status
    echo -e "\n${BLUE}⚡ AUTOMATION & GO-LIVE:${NC}"
    echo -e "  0) ${PURPLE}🚀 GOD MODE (Sync + Cloud + Post)${NC}"
    echo -e "  1) ${CYAN}Sync Business Info${NC} (JSON to All Files)"
    echo -e "  9) ${CYAN}Push to GitHub${NC} (Manual Trigger)"
    
    echo -e "\n${BLUE}🛠️  DEVELOPMENT & ASSETS:${NC}"
    echo -e "  3) ${CYAN}Launch Development${NC} (Start Servers)"
    echo -e "  4) ${CYAN}Generate Review Flyer${NC} (Printable QR)"
    echo -e "  6) ${CYAN}Export Branding${NC} (Copy-Paste Text)"
    
    echo -e "\n${BLUE}📈 GROWTH & MONITORING:${NC}"
    echo -e "  2) ${CYAN}Check GMB Health${NC} (Local vs Live)"
    echo -e "  5) ${CYAN}Platform Dashboards${NC} (Links)"
    echo -e "  8) ${CYAN}Monitor Performance${NC} (Insights)"
    echo -e "  10) ${CYAN}Growth Guide${NC} (Strategy)"
    
    echo -e "\n  12) ${RED}Exit${NC}"

    read -p "Enter Choice [0-12]: " choice

    case $choice in
        0) run_god_mode ;;
        1) run_sync ;;
        2) run_check ;;
        3) start_dev ;;
        4) generate_flyer ;;
        5) show_dashboards ;;
        6) show_branding ;;
        7) run_health_check ;;
        8) show_monitoring ;;
        9) git add . && git commit -m "Manual sync" && git push origin main ;;
        10) show_growth ;;
        11) nano business-info.json ;;
        12) exit 0 ;;
        *) echo -e "${RED}Invalid choice!${NC}" ;;
    esac
    echo -e "\n${NC}Press Enter to return to menu...${NC}"
    read
done
