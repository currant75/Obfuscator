#!/bin/bash
# ============================================
# LUA OBFUSCATOR MAX v4.0 — Termux Setup
# Input/Output dari Penyimpanan Lokal
# ============================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║     LUA OBFUSCATOR MAX v4.0 — Termux Auto-Setup              ║${NC}"
echo -e "${CYAN}║     Ultra Security Edition | Penyimpanan Lokal               ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check Termux
if [ -d "/data/data/com.termux" ]; then
    echo -e "${GREEN}[✓] Termux environment detected!${NC}"
else
    echo -e "${YELLOW}[!] Bukan Termux, setup tetap berjalan...${NC}"
fi

# Update packages
echo -e "${BLUE}[1/5] Update & upgrade packages...${NC}"
pkg update -y && pkg upgrade -y

# Install Python
echo -e "${BLUE}[2/5] Install Python...${NC}"
pkg install python -y

# Install git
echo -e "${BLUE}[3/5] Install Git...${NC}"
pkg install git -y

# Create workspace
echo -e "${BLUE}[4/5] Setup workspace...${NC}"
WORK_DIR="$HOME/lua-obfuscator-max"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

# Check tool file
if [ ! -f "lua_obfuscator_max.py" ]; then
    echo -e "${YELLOW}[!] lua_obfuscator_max.py tidak ditemukan di folder ini${NC}"
    echo -e "${YELLOW}[!] Copy file ke: $WORK_DIR${NC}"
    echo ""
    echo -e "${CYAN}Cara pakai setelah setup:${NC}"
    echo -e "  cd $WORK_DIR"
    echo -e "  python3 lua_obfuscator_max.py -i /sdcard/script.lua -o /sdcard/protected.lua --max"
    echo ""
    exit 1
fi

chmod +x lua_obfuscator_max.py

# Create alias
echo -e "${BLUE}[5/5] Buat shortcut alias...${NC}"

SHELL_RC=""
if [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
fi

if [ -n "$SHELL_RC" ]; then
    if ! grep -q "lua-obfuscator-max" "$SHELL_RC"; then
        echo "" >> "$SHELL_RC"
        echo "# === LUA OBFUSCATOR MAX v4.0 ===" >> "$SHELL_RC"
        echo "alias luaobf='cd $WORK_DIR && python3 lua_obfuscator_max.py'" >> "$SHELL_RC"
        echo "alias luaobf-max='cd $WORK_DIR && python3 lua_obfuscator_max.py --max'" >> "$SHELL_RC"
        echo -e "${GREEN}[✓] Alias ditambahkan ke $(basename $SHELL_RC)${NC}"
    fi
fi

# Create example folders
mkdir -p "$WORK_DIR/examples/input"
mkdir -p "$WORK_DIR/examples/output"

# Create example test file
cat > "$WORK_DIR/examples/input/test_script.lua" << 'EOF'
-- Test Lua Script
local function calculateArea(radius)
    local pi = 3.14159265359
    local area = pi * radius * radius
    return area
end

local function factorial(n)
    if n <= 1 then return 1 end
    return n * factorial(n - 1)
end

local function main()
    local circleArea = calculateArea(7.5)
    local fact5 = factorial(5)
    print("Circle area: " .. string.format("%.2f", circleArea))
    print("Factorial of 5: " .. fact5)
end

main()
EOF

echo ""
echo -e "${MAGENTA}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${MAGENTA}║  ✅ SETUP SELESAI!                                           ║${NC}"
echo -e "${MAGENTA}╠══════════════════════════════════════════════════════════════╣${NC}"
echo -e "${MAGENTA}║  Folder: $WORK_DIR                             ║${NC}"
echo -e "${MAGENTA}║  Tool:   lua_obfuscator_max.py                               ║${NC}"
echo -e "${MAGENTA}╠══════════════════════════════════════════════════════════════╣${NC}"
echo -e "${MAGENTA}║  📱 CARA PENGGUNAAN (PENYIMPANAN LOKAL):                     ║${NC}"
echo -e "${MAGENTA}║                                                              ║${NC}"
echo -e "${MAGENTA}║  1 FILE (Basic):                                             ║${NC}"
echo -e "${MAGENTA}║     python3 lua_obfuscator_max.py \                          ║${NC}"
echo -e "${MAGENTA}║       -i /sdcard/script.lua \                                ║${NC}"
echo -e "${MAGENTA}║       -o /sdcard/protected.lua                               ║${NC}"
echo -e "${MAGENTA}║                                                              ║${NC}"
echo -e "${MAGENTA}║  1 FILE (Maximum Security):                                  ║${NC}"
echo -e "${MAGENTA}║     python3 lua_obfuscator_max.py \                          ║${NC}"
echo -e "${MAGENTA}║       -i /sdcard/script.lua \                                ║${NC}"
echo -e "${MAGENTA}║       -o /sdcard/protected.lua --max                         ║${NC}"
echo -e "${MAGENTA}║                                                              ║${NC}"
echo -e "${MAGENTA}║  1 FILE + Watermark:                                         ║${NC}"
echo -e "${MAGENTA}║     python3 lua_obfuscator_max.py \                          ║${NC}"
echo -e "${MAGENTA}║       -i /sdcard/script.lua \                                ║${NC}"
echo -e "${MAGENTA}║       -o /sdcard/protected.lua \                             ║${NC}"
echo -e "${MAGENTA}║       --max --watermark "MyScript v1.0"                      ║${NC}"
echo -e "${MAGENTA}║                                                              ║${NC}"
echo -e "${MAGENTA}║  BATCH (Semua .lua di folder):                               ║${NC}"
echo -e "${MAGENTA}║     python3 lua_obfuscator_max.py \                          ║${NC}"
echo -e "${MAGENTA}║       -d /sdcard/lua_files/ \                                ║${NC}"
echo -e "${MAGENTA}║       -o /sdcard/output/ --max                               ║${NC}"
echo -e "${MAGENTA}║                                                              ║${NC}"
echo -e "${MAGENTA}║  TINGKAT TERAMAN (Semua layer max):                          ║${NC}"
echo -e "${MAGENTA}║     python3 lua_obfuscator_max.py \                          ║${NC}"
echo -e "${MAGENTA}║       -i /sdcard/in.lua \                                    ║${NC}"
echo -e "${MAGENTA}║       -o /sdcard/out.lua --max -v \                          ║${NC}"
echo -e "${MAGENTA}║       --watermark "Protected by Me"                          ║${NC}"
echo -e "${MAGENTA}║                                                              ║${NC}"
echo -e "${MAGENTA}║  TEST:                                                       ║${NC}"
echo -e "${MAGENTA}║     python3 lua_obfuscator_max.py \                          ║${NC}"
echo -e "${MAGENTA}║       -i examples/input/test_script.lua \                    ║${NC}"
echo -e "${MAGENTA}║       -o examples/output/test_protected.lua --max -v         ║${NC}"
echo -e "${MAGENTA}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}Quick test:${NC}"
echo -e "  cd $WORK_DIR"
echo -e "  python3 lua_obfuscator_max.py -i examples/input/test_script.lua -o examples/output/test_protected.lua --max -v"
echo ""
