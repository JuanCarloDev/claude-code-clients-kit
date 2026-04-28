# Claude Code Kit

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Skills curadas](https://img.shields.io/badge/skills-36%20curadas-orange)](03-skills/CATALOG.md)

Kit técnico pra setup do Claude Code com skills curadas. Substitui o pacote default de 130+ skills por ~30 selecionadas por perfil.

> **Filosofia:** menos é mais. Claude Code com 130 skills escolhe a errada — fica burro. Curado por perfil é mais previsível.

---

## Estrutura

```
claude-code-kit/
├── README.md                  # este arquivo
├── 00-quickstart.md           # setup 5min
│
├── 01-install/
│   ├── install.sh             # installer interativo
│   ├── prerequisites.md       # node, claude, git, tmux
│   └── verify.md              # checks pós-instalação
│
├── 02-settings/
│   ├── settings.json          # ~/.claude/settings.json com defaults seguros
│   └── .env.template          # template env vars
│
├── 03-skills/                 # SKILLS CURADAS
│   ├── CATALOG.md             # catálogo completo
│   ├── core/      (12)        # universais
│   ├── dev/       (8)         # devs only
│   ├── frontend/  (5)         # frontend devs
│   ├── marketing/ (7)         # marketing/content
│   └── ops/       (5)         # devops/infra
│
├── 04-claude-md/
│   ├── global.template.md     # ~/.claude/CLAUDE.md template
│   └── project.template.md    # <repo>/CLAUDE.md template
│
└── 05-mcp/
    ├── essential.md           # context7, claude-mem
    └── optional.md            # gmail, slack, postgres, etc
```

---

## Quickstart

```bash
git clone https://github.com/JuanCarloDev/claude-code-clients-kit.git ~/cck
cd ~/cck
./01-install/install.sh
```

Installer pergunta perfil. Setup completo em ~5min.

Detalhes em [`00-quickstart.md`](00-quickstart.md).

---

## Perfis

| Perfil | Skills | Pra quem |
|---|---|---|
| `core` | 12 | baseline universal |
| `dev` | 20 | devs full-stack |
| `frontend` | 25 | devs com foco UI |
| `marketing` | 19 | time marketing/content |
| `ops` | 17 | devops/infra |
| `full` | ~36 | tudo |

Comparação: install default Claude Code + plugins comum = 100+ skills. Kit = ~30. **Redução ~70%**.

---

## Princípios de Curadoria

| Regra | Por quê |
|---|---|
| Máximo ~30 skills por perfil | Claude Code com 130 skills escolhe errada |
| Skills universais primeiro | Brainstorming, debugging, planning servem qualquer projeto |
| Skills opt-in por categoria | Frontend só pra quem faz frontend |
| Skills pessoais/específicas FORA | Não vazar workflow do dono pra cliente |
| Settings com defaults seguros | `defaultMode: default`, deny `rm -rf`, sudo, etc |

---

## Contribuindo

PRs welcome. Antes de abrir:

1. Skill nova precisa ser **universal** (não pessoal, não cliente-específica)
2. Validada em uso real (3+ usos bem-sucedidos)
3. Documentada no [`03-skills/CATALOG.md`](03-skills/CATALOG.md)
4. Testada via `01-install/install.sh --profile <categoria>`

Issues e discussions abertas pra dúvidas.

---

## Origem das Skills

Skills agrupadas neste kit vêm de:
- [Anthropic superpowers plugin](https://github.com/anthropics/claude-plugins) (MIT)
- Skills públicas da comunidade Claude Code
- Curadoria/wrapper próprios

Cada skill mantém atribuição original em seu `SKILL.md`.

---

## License

MIT — veja [`LICENSE`](LICENSE).
