# MCP Essentials — Cliente

> MCPs (Model Context Protocol) estendem capabilities do Claude Code com tools externas. Curar igual skills — menos é mais.

---

## 🔥 Sempre instalar

### context7 — docs scraping

Busca docs atualizadas de qualquer biblioteca. Evita Claude usar docs desatualizadas do training.

```bash
claude mcp add context7 -- npx -y @context7/mcp-server@latest
```

Quando usa: pergunta sobre lib, framework, API, CLI tool, cloud service.

### claude-mem — memória persistente

Persiste contexto cross-session. Cliente lembra do que foi feito.

```bash
claude mcp add claude-mem -- npx -y @thedotmack/claude-mem@latest
```

Quando usa: "fizemos X já?", "qual foi a decisão sobre Y?", retomar trabalho.

---

## ⚙️ Recomendado por perfil

### Devs

**github-cli** — operações GitHub via Claude
```bash
# gh CLI já oferece isso. MCP só se cliente quer abstrair.
```

**postgres / supabase / planetscale** — query DB direto
```bash
claude mcp add postgres -- npx -y @modelcontextprotocol/server-postgres@latest
# config: connection string em env
```

### Frontend

**puppeteer / playwright** — browser automation, screenshot, QA
```bash
claude mcp add browser -- npx -y @modelcontextprotocol/server-puppeteer@latest
```

### Ops

**filesystem** — read/write controlado em paths específicos
```bash
claude mcp add filesystem -- npx -y @modelcontextprotocol/server-filesystem@latest /allowed/path
```

---

## 🚫 Cuidado com excesso

Cada MCP tool consome **token budget** + aumenta confusão do Claude pra escolher tool certa. Regra:

- **Mínimo viável:** context7 + claude-mem
- **Adicionar opt-in:** quando cliente pedir capability específica
- **Não passar de 5-7 MCPs** sem justificativa

---

## Verificar MCPs instalados

```bash
claude mcp list
```

## Remover MCP

```bash
claude mcp remove <name>
```
