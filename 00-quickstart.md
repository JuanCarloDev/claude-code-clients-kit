# Quickstart (5min)

## Prereqs

- Linux Ubuntu 22.04+ ou macOS 13+
- Node 20+
- Git, tmux, gh CLI
- API key Anthropic (https://console.anthropic.com)

## Setup

```bash
# 1. Clone
git clone https://github.com/JuanCarloDev/claude-code-clients-kit.git ~/cck
cd ~/cck

# 2. Installer interativo
./01-install/install.sh

# 3. API key
nano ~/.claude/.env  # ANTHROPIC_API_KEY=sk-ant-...

# 4. Customizar CLAUDE.md
nano ~/.claude/CLAUDE.md  # ajustar nome, stack, projetos

# 5. Verificar
claude --version
ls ~/.claude/skills/ | wc -l   # ~30 skills
```

## Perfis

| Perfil | Skills | Pra quem |
|---|---|---|
| `core` | 12 | baseline universal |
| `dev` | 20 | devs full-stack |
| `frontend` | 25 | UI devs |
| `marketing` | 19 | content/growth |
| `ops` | 17 | devops/infra |
| `full` | ~36 | tudo |

## Atualizar

```bash
cd ~/cck && git pull && ./01-install/install.sh --update
```

## Skills custom

```bash
# Adicionar skill avulsa
ln -s /path/to/your-skill ~/.claude/skills/

# Remover
rm ~/.claude/skills/<skill-name>
```

## Próximos passos

- `01-install/verify.md` — 10 checks pós-instalação
- `04-claude-md/global.template.md` — template CLAUDE.md
- `05-mcp/essential.md` — MCPs recomendados
