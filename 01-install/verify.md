# Verify — Pós-instalação

Checklist pra confirmar que o setup tá funcional.

## 1. Estrutura

```bash
ls -la ~/.claude/
# Esperado:
# - skills/         (symlinks pro kit)
# - settings.json
# - CLAUDE.md
# - .env
# - commands/       (vazio ou com customs)
# - hooks/          (vazio ou com customs)
```

## 2. Skills instaladas

```bash
ls ~/.claude/skills/ | wc -l
# Esperado: 12 (core) / 20 (dev) / 25 (frontend) / 19 (marketing) / 18 (ops) / ~37 (full)

ls -la ~/.claude/skills/ | head -5
# Esperado: links simbólicos (l no início) apontando pro kit
```

## 3. Settings válido

```bash
cat ~/.claude/settings.json | jq . > /dev/null && echo "✅ JSON válido" || echo "❌ JSON inválido"
```

## 4. Env preenchido

```bash
grep -q "^ANTHROPIC_API_KEY=sk-ant-" ~/.claude/.env && echo "✅ API key preenchida" || echo "❌ Preencher ANTHROPIC_API_KEY"
ls -l ~/.claude/.env  # esperado: -rw------- (600)
```

## 5. CLAUDE.md customizado

```bash
grep -q "{{CLIENTE_NOME}}" ~/.claude/CLAUDE.md && echo "❌ CLAUDE.md ainda tem placeholders — customizar" || echo "✅ CLAUDE.md customizado"
```

## 6. Claude CLI funciona

```bash
claude --version
# Esperado: claude X.Y.Z
```

## 7. Sessão de teste

```bash
echo "diga olá em 3 palavras" | claude --print
# Esperado: resposta da AI em ~3 palavras
```

## 8. Skills carregadas

Dentro de `claude` interativo:
```
/skills
```
Esperado: lista das skills curadas (núm conforme perfil).

## 9. Memory carregado

Dentro de `claude` interativo:
```
/memory
```
Esperado: mostra `~/.claude/CLAUDE.md` carregado.

## 10. MCPs (se configurou)

```bash
claude mcp list
# Esperado: lista de MCPs configurados
```

---

## Troubleshooting

| Sintoma | Causa | Fix |
|---|---|---|
| `claude: command not found` | npm global não no PATH | `npm config get prefix` + adicionar `bin` ao PATH |
| Skills não aparecem em `/skills` | symlinks quebrados | `ls -la ~/.claude/skills/` checa links, reinstalar |
| `Authentication failed` | API key inválida ou faltando | checar `~/.claude/.env`, restart claude |
| `permission denied` em comandos | `defaultMode` muito restritivo | revisar `~/.claude/settings.json` permissions.allow |
| Hook errors no startup | hook script com bug | desabilitar hooks em `settings.json`, debug isolado |
