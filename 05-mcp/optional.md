# MCPs Opcionais

Adicionar **só se cliente pedir** capability específica.

---

## Comunicação

### Slack
```bash
claude mcp add slack -- npx -y @modelcontextprotocol/server-slack@latest
# env: SLACK_BOT_TOKEN, SLACK_TEAM_ID
```

### Gmail (Google Workspace)
```bash
claude mcp add gmail -- npx -y mcp-remote@latest https://gmailmcp.googleapis.com/mcp/v1
# OAuth flow no primeiro uso
```

### Google Calendar
```bash
claude mcp add calendar -- npx -y mcp-remote@latest https://calendarmcp.googleapis.com/mcp/v1
```

### Google Drive
```bash
claude mcp add drive -- npx -y mcp-remote@latest https://drivemcp.googleapis.com/mcp/v1
```

### Notion
```bash
claude mcp add notion -- npx -y mcp-remote@latest https://mcp.notion.com/mcp
```

---

## Dados

### Postgres
```bash
claude mcp add postgres -- npx -y @modelcontextprotocol/server-postgres@latest
# connection string via env
```

### Supabase
```bash
claude mcp add supabase -- npx -y @supabase/mcp-server@latest
```

### SQLite
```bash
claude mcp add sqlite -- npx -y @modelcontextprotocol/server-sqlite@latest /path/to/db.sqlite
```

---

## Browser/Web

### Playwright
```bash
claude mcp add playwright -- npx -y @modelcontextprotocol/server-playwright@latest
```

### Firecrawl (web scraping)
```bash
claude mcp add firecrawl -- npx -y @firecrawl/mcp-server@latest
# env: FIRECRAWL_API_KEY
```

### Exa (semantic web search)
```bash
claude mcp add exa -- npx -y @exa-labs/mcp-server@latest
# env: EXA_API_KEY
```

---

## Reuniões

### Fathom (transcrições)
```bash
claude mcp add fathom -- npx -y mcp-remote@latest https://api.fathom.ai/mcp
# OAuth flow no primeiro uso
```

---

## DevOps

### Sentry
```bash
claude mcp add sentry -- npx -y @sentry/mcp-server@latest
# env: SENTRY_AUTH_TOKEN
```

### AWS
```bash
claude mcp add aws -- npx -y @aws/mcp-server@latest
# AWS creds via ~/.aws/credentials
```

---

## Custo de MCPs

Cada MCP carrega tools no contexto inicial (gasta tokens) E adiciona opções pra Claude escolher. Trade-off:

| MCPs ativos | Token overhead estimado | Confusão Claude |
|---|---|---|
| 0 | 0 tokens | Nenhuma |
| 2-3 | ~2-5k tokens | Mínima |
| 5-7 | ~10-15k tokens | Aceitável |
| 10+ | ~25k+ tokens | Alta — escolhe tool errada |

**Regra de ouro:** se MCP não é usado em > 50% das sessões → remover.
