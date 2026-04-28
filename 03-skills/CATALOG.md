# Skills Catalog — Curadoria Cliente

> Skills selecionadas dos 130+ disponíveis em `~/.claude/skills/` e `~/code/juan/claude-code-team-setup/skills/`. Filtro: **universal, production-ready, sem viés Juan**.

---

## 🔥 CORE — todo cliente recebe (12 skills)

Skills que servem qualquer cliente, qualquer stack. Baseline obrigatória.

| Skill | Quando usa | Origem |
|---|---|---|
| `brainstorming` | Antes de qualquer trabalho criativo (features, components, decisions) | superpowers |
| `writing-plans` | Tem spec multi-step, antes de tocar código | superpowers |
| `executing-plans` | Plano escrito pronto, executar em sessão separada | superpowers |
| `systematic-debugging` | Bug, test failure, comportamento inesperado | superpowers |
| `verification-before-completion` | Antes de afirmar "tá pronto" / commit / PR | superpowers |
| `requesting-code-review` | Completou task grande, antes do merge | superpowers |
| `receiving-code-review` | Recebeu feedback de review, antes de implementar | superpowers |
| `search-first` | Antes de codar, procurar libs/patterns existentes | team-setup |
| `using-git-worktrees` | Feature work que precisa isolamento | superpowers |
| `using-tmux-for-interactive-commands` | Tools interativos (vim, REPL, rebase -i) | superpowers |
| `finishing-a-development-branch` | Implementação completa, decidir como integrar | superpowers |
| `skill-creator` | Cliente vai criar skills próprias | personal |

---

## 💻 DEV — full-stack (+8 skills)

Adicionar pra cliente com time de devs.

| Skill | Quando usa |
|---|---|
| `tdd-workflow` | Feature nova, bugfix, refactor — test-driven |
| `subagent-driven-development` | Plano com tasks independentes, paralelizar |
| `finding-duplicate-functions` | Audit semântico de duplicação |
| `api-design` | REST patterns, naming, status codes, pagination |
| `database-migrations` | Schema changes, zero-downtime, rollbacks |
| `deployment-patterns` | CI/CD, Docker, health checks, rollback |
| `security-review` | Auth, user input, secrets, payment flows |
| `mcp-builder` | Cliente quer criar MCP server próprio |

---

## 🎨 FRONTEND — UI devs (+5 skills)

Cliente faz frontend (Next.js, React).

| Skill | Quando usa |
|---|---|
| `frontend-design` | Criar UIs distintivas, evitar AI slop aesthetic |
| `frontend-patterns` | React, Next.js, state management, perf |
| `react-portal-modals` | Modals, drawers, tooltips em React |
| `design-review` | QA visual: spacing, hierarchy, AI slop detection |
| `theme-factory` | Stylize artifacts (slides, docs, reports) |

---

## 📣 MARKETING — content/growth team (+7 skills)

Time marketing usa Claude Code pra copy, ads, SEO.

| Skill | Quando usa |
|---|---|
| `copywriting` | Escrever marketing copy do zero |
| `copy-editing` | Revisar copy existente |
| `cold-email` | B2B cold email + follow-up sequences |
| `email-sequence` | Drip campaigns, automated email flows |
| `ai-seo` | Otimizar pra LLM citation (ChatGPT, Perplexity) |
| `seo-audit` | Audit SEO técnico de site |
| `content-strategy` | Planejamento editorial, calendário |

---

## 🔧 OPS — DevOps/infra (+5 skills)

Cliente tem time infra/SRE.

| Skill | Quando usa |
|---|---|
| `vps-setup` | Setup VPS Ubuntu fresh (Node, Nginx, PM2, SSL) |
| `deployment-patterns` | Já em DEV, mas reforça aqui |
| `database-migrations` | Já em DEV, mas reforça aqui |
| `analytics-tracking` | Setup/audit analytics & measurement |
| `slack-messaging` | Send/read Slack via Claude Code |

---

## 🚫 EXCLUÍDAS (não vão pro cliente)

### Pessoais (não-universais)
- Skills de produtividade pessoal (diary, mood tracking, life dashboard)
- Skills de auto-aprendizado / metacognição
- Skills de job hunt / prospecção pessoal
- Skills de outreach social pessoal (DMs, scraping)

### Cliente-específicas (não-portáveis)
- Skills de publishers proprietários
- Skills de hubs internos
- Skills com voice triggers ou comandos próprios
- Skills com workflows ligados a stack proprietária

### Redundantes / niche
- `c-level-advisor`, `business-growth`, `finance-advisor` (vagas demais, plug-and-play piora)
- `eval-harness` (avançado, opt-in)
- `continuous-learning-v2` (hooks pesados, opcional)
- `lean-ctx` (MCP avançado, opcional)
- `graphify` (niche)

### Opcionais sob demanda
- `pdf` (se cliente trabalha com PDFs)
- `transcribe-video` (se cliente faz transcrição)
- `generate-image` (se cliente gera imagens)
- `web-artifacts-builder` (se cliente faz claude.ai artifacts)
- `gstack`, `browse` (QA testing automatizado)
- `canvas-design`, `logo-designer` (design assets)
- `remotion-ads` (video ads)
- `carousel-designer` (IG carousels)

---

## Resumo por perfil

| Perfil | Skills count |
|---|---|
| `core` | 12 |
| `core + dev` | 20 |
| `core + dev + frontend` | 25 |
| `core + marketing` | 19 |
| `core + ops` | 17 |
| `full` (todas curadas) | ~36 |

Comparação: `~/.claude/skills/` Juan = 132 skills. Cliente médio = 20-25. **Redução de ~80%**.

---

## Como adicionar skill nova ao kit

1. Skill validada em uso real (3+ usos bem-sucedidos)
2. Universal (não cliente-específica, não Juan-específica)
3. PR no repo `claude-code-clientes-kit`:
   ```bash
   cp -r ~/.claude/skills/<skill> 03-skills/<categoria>/
   git add 03-skills/<categoria>/<skill>
   git commit -m "feat(skills): add <skill> to <categoria>"
   ```
4. Atualizar este CATALOG.md
5. Atualizar `01-install/install.sh` se default-on
