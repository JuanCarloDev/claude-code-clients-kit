#!/usr/bin/env bash
# Claude Code Kit — Installer
# Uso: ./install.sh [--profile core|dev|frontend|marketing|ops|full] [--update]

set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="$HOME/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"
PROFILE="${PROFILE:-}"
UPDATE_MODE=false

# Parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile) PROFILE="$2"; shift 2 ;;
    --update) UPDATE_MODE=true; shift ;;
    *) echo "unknown arg: $1"; exit 1 ;;
  esac
done

echo "═══════════════════════════════════════════════"
echo "  Claude Code Kit — Installer"
echo "═══════════════════════════════════════════════"

# ============================================
# 1. CHECK PREREQS
# ============================================
echo ""
echo "[1/6] Checking prerequisites..."

command -v node >/dev/null || { echo "❌ node not found. Install Node 20+"; exit 1; }
command -v git >/dev/null || { echo "❌ git not found"; exit 1; }
command -v claude >/dev/null || {
  echo "⚠️  claude CLI not found. Install via: npm install -g @anthropic-ai/claude-code"
  read -p "Install now? [y/N] " yn
  [[ "$yn" =~ ^[Yy]$ ]] && npm install -g @anthropic-ai/claude-code
}

NODE_VER=$(node -v | cut -d. -f1 | tr -d 'v')
[[ "$NODE_VER" -lt 20 ]] && { echo "❌ Node 20+ required (have $NODE_VER)"; exit 1; }

echo "✅ node $(node -v), claude $(claude --version 2>/dev/null || echo '?')"

# ============================================
# 2. SELECT PROFILE
# ============================================
if [[ -z "$PROFILE" ]]; then
  echo ""
  echo "[2/6] Select profile:"
  echo "  1) core       — 12 skills universais (baseline)"
  echo "  2) dev        — core + 8 dev"
  echo "  3) frontend   — core + dev + 5 frontend"
  echo "  4) marketing  — core + 7 marketing"
  echo "  5) ops        — core + 6 ops"
  echo "  6) full       — todas categorias (~37 skills)"
  read -p "Profile [1-6]: " p
  case "$p" in
    1) PROFILE=core ;;
    2) PROFILE=dev ;;
    3) PROFILE=frontend ;;
    4) PROFILE=marketing ;;
    5) PROFILE=ops ;;
    6) PROFILE=full ;;
    *) echo "invalid"; exit 1 ;;
  esac
fi

echo "✅ profile: $PROFILE"

# ============================================
# 3. CREATE ~/.claude STRUCTURE
# ============================================
echo ""
echo "[3/6] Setting up ~/.claude/ ..."

mkdir -p "$SKILLS_DIR" "$CLAUDE_DIR/commands" "$CLAUDE_DIR/hooks"

# Backup existing settings
if [[ -f "$CLAUDE_DIR/settings.json" && "$UPDATE_MODE" == false ]]; then
  cp "$CLAUDE_DIR/settings.json" "$CLAUDE_DIR/settings.json.bak.$(date +%s)"
  echo "  backup: settings.json.bak.*"
fi

# ============================================
# 4. INSTALL SKILLS (symlink, not copy — easier updates)
# ============================================
echo ""
echo "[4/6] Installing skills (profile: $PROFILE)..."

install_skill() {
  local src="$1"
  local name=$(basename "$src")
  local dst="$SKILLS_DIR/$name"
  [[ ! -d "$src" ]] && { echo "  ⚠️  skip (not found): $name"; return; }
  [[ -L "$dst" || -d "$dst" ]] && rm -rf "$dst"
  ln -s "$src" "$dst"
  echo "  ✓ $name"
}

# Always install core
for skill in "$KIT_DIR/03-skills/core/"*; do
  [[ -d "$skill" ]] && install_skill "$skill"
done

# Install per profile
case "$PROFILE" in
  dev|frontend|full)
    for skill in "$KIT_DIR/03-skills/dev/"*; do
      [[ -d "$skill" ]] && install_skill "$skill"
    done
    ;;
esac

case "$PROFILE" in
  frontend|full)
    for skill in "$KIT_DIR/03-skills/frontend/"*; do
      [[ -d "$skill" ]] && install_skill "$skill"
    done
    ;;
esac

case "$PROFILE" in
  marketing|full)
    for skill in "$KIT_DIR/03-skills/marketing/"*; do
      [[ -d "$skill" ]] && install_skill "$skill"
    done
    ;;
esac

case "$PROFILE" in
  ops|full)
    for skill in "$KIT_DIR/03-skills/ops/"*; do
      [[ -d "$skill" ]] && install_skill "$skill"
    done
    ;;
esac

SKILL_COUNT=$(ls -1 "$SKILLS_DIR" | wc -l | tr -d ' ')
echo "✅ $SKILL_COUNT skills instaladas"

# ============================================
# 5. SETTINGS
# ============================================
echo ""
echo "[5/6] Installing settings..."

if [[ ! -f "$CLAUDE_DIR/settings.json" ]] || [[ "$UPDATE_MODE" == false ]]; then
  cp "$KIT_DIR/02-settings/settings.json" "$CLAUDE_DIR/settings.json"
  echo "  ✓ settings.json"
fi

if [[ ! -f "$CLAUDE_DIR/CLAUDE.md" ]]; then
  cp "$KIT_DIR/04-claude-md/global.template.md" "$CLAUDE_DIR/CLAUDE.md"
  echo "  ✓ CLAUDE.md (CUSTOMIZAR — nome cliente, stack, projetos)"
fi

# ============================================
# 6. ENV
# ============================================
echo ""
echo "[6/6] Env setup..."

if [[ ! -f "$CLAUDE_DIR/.env" ]]; then
  cp "$KIT_DIR/02-settings/.env.template" "$CLAUDE_DIR/.env" 2>/dev/null || \
    echo "ANTHROPIC_API_KEY=" > "$CLAUDE_DIR/.env"
  chmod 600 "$CLAUDE_DIR/.env"
  echo "  ✓ ~/.claude/.env (PREENCHER ANTHROPIC_API_KEY)"
fi

echo ""
echo "═══════════════════════════════════════════════"
echo "  ✅ Instalação completa"
echo "═══════════════════════════════════════════════"
echo ""
echo "Próximos passos:"
echo "  1. nano ~/.claude/.env       (adicionar ANTHROPIC_API_KEY)"
echo "  2. nano ~/.claude/CLAUDE.md  (customizar contexto cliente)"
echo "  3. claude                    (iniciar primeira sessão)"
echo ""
echo "Skills instaladas: $SKILL_COUNT (perfil $PROFILE)"
