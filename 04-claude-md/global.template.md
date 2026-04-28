# Global CLAUDE.md — {{CLIENTE_NOME}}

> Carregado em TODAS as sessões Claude Code. Customizar com contexto cliente.

---

## Quem é o usuário

- **Nome:** {{NOME}}
- **Role:** {{CARGO}} ({{EMPRESA}})
- **Stack principal:** {{STACK}}
- **Linguagem preferida:** {{PT-BR | EN}}

## Empresa

- **Nome:** {{EMPRESA}}
- **Setor:** {{SETOR}}
- **Tamanho time:** {{N_PESSOAS}}
- **URL principal:** {{URL}}

---

## Stack Padrão

| Camada | Tecnologia |
|--------|-----------|
| **Framework** | {{Next.js / Django / Rails / ...}} |
| **Linguagem** | {{TypeScript / Python / Go / ...}} |
| **Database** | {{Postgres / MySQL / SQLite / ...}} |
| **Hosting** | {{AWS / GCP / Vercel / VPS / ...}} |
| **CI/CD** | {{GitHub Actions / CircleCI / ...}} |

---

## Repositórios principais

```
~/code/{{empresa}}/
├── {{repo1}}      → {{descrição}}
├── {{repo2}}      → {{descrição}}
└── {{repo3}}      → {{descrição}}
```

---

## Comunicação

- **Língua:** {{PT-BR / EN}} para tudo (commits, docs, mensagens)
- **Estilo:** Direto, objetivo, sem rodeios
- **Commits:** Conventional Commits (feat:, fix:, docs:, chore:, refactor:, test:)
- **PRs:** Usar gh CLI, descrição em markdown estruturada

---

## Regras de Código (universais)

- TypeScript strict (sem `any`) — se aplicável
- Imports absolutos com alias (`@/`)
- Sem over-engineering — mínimo necessário
- Não criar docs (`*.md`, README) sem pedir
- Não adicionar comments em código não modificado
- **Segurança:** Nunca commitar `.env`, credentials, API keys
- **Validar integrações** antes de afirmar que funciona — testar localmente, ver schema, dados reais

---

## Workflow

- **Antes de codar:** brainstorm → plano → execute (skills `brainstorming`, `writing-plans`, `executing-plans`)
- **Bug?** Skill `systematic-debugging` antes de propor fix
- **Antes de "tá pronto":** Skill `verification-before-completion`
- **Code review:** Skill `requesting-code-review` antes do merge

---

## Permissões importantes

- **NÃO** rodar `git push` sem confirmação explícita
- **NÃO** force push em main/master
- **NÃO** rodar comandos destrutivos (`rm -rf`, `DROP TABLE`) sem confirmação
- **NÃO** modificar `.env` ou credentials sem pedir

---

## Skills disponíveis

Ver `~/.claude/skills/` ou rodar `/skills` no Claude Code.

Curadas pelo perfil instalado. Não tentar invocar skills que não existem.

---

## Contexto do projeto atual

(Customizar conforme cliente. Exemplos:)

- **Iniciativa atual:** {{descrição da feature/sprint atual}}
- **Stakeholders:** {{quem cobra, quem aprova}}
- **Deadlines:** {{datas relevantes}}
- **Bloqueadores:** {{o que tá travado}}

---

## Fontes externas

- **Tickets:** {{Jira / Linear / GitHub Issues}} URL
- **Docs:** {{Notion / Confluence / etc}} URL
- **Comunicação:** {{Slack / Discord}}
- **Monitoramento:** {{Sentry / Datadog / Grafana}}
