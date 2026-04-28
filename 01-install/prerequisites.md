# Prerequisites — Servidor Cliente

## Sistema

- Linux Ubuntu 22.04+ (LTS recomendado) — VPS ou local
- macOS 13+ (se cliente roda local)
- Acesso SSH/sudo

## Pacotes obrigatórios

| Tool | Versão min | Install |
|---|---|---|
| Node.js | 20+ | `curl -fsSL https://deb.nodesource.com/setup_20.x \| sudo -E bash -` + `apt install -y nodejs` |
| npm | 10+ | vem com Node 20 |
| git | 2.40+ | `apt install -y git` |
| tmux | 3.0+ | `apt install -y tmux` |
| gh CLI | 2.0+ | https://cli.github.com/ |
| claude CLI | latest | `npm install -g @anthropic-ai/claude-code` |

## Pacotes opcionais (skills específicas)

| Tool | Quando precisa | Install |
|---|---|---|
| `wacli` | WhatsApp integration | https://wacli.dev |
| `ffmpeg` | transcribe-video skill | `apt install -y ffmpeg` |
| `puppeteer` deps | browser/QA skills | `apt install -y libnss3 libgbm1 libasound2` |
| Docker | deployment-patterns skill | https://docs.docker.com/engine/install/ |

## API Keys necessárias

Mínimo: **ANTHROPIC_API_KEY**

Cliente precisa criar conta em https://console.anthropic.com e gerar key. Cobrança é por uso (pay-as-you-go) ou plano Pro/Max.

## Recursos do servidor (recomendado)

- **CPU:** 2+ cores
- **RAM:** 4GB+ (8GB se rodar WhatsApp/Telegram daemons)
- **Disco:** 20GB+ livre (skills + logs + projeto)
- **Rede:** estável, low-latency pra API Anthropic

## Permissões

- Usuário não-root recomendado pra rodar `claude`
- Sudo apenas pra install pacotes
- SSH key (não senha) pra acesso

## Verificação

```bash
node -v        # v20+
npm -v         # 10+
git --version  # 2.40+
tmux -V        # 3.0+
gh --version   # 2.0+
claude --version
```

Se algum falha → install antes de rodar `01-install/install.sh`.
