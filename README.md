# dotfiles-opencode

Clean, git-tracked backup of the OpenCode + MCP proxy (mcpo) configs.

**Purpose:** Every config change is committed here so the previous working
state is always recoverable. If a change breaks something, `git log` + `git
show` gets you back. No more manual copy-paste recovery, no more surprises.

## Structure

```
dotfiles-opencode/
├── opencode/opencode.jsonc   # OpenCode config (models, provider, MCPs)
├── mcpo/config.json          # MCP proxy (mcpo) server config
├── restore.sh                # Copies files back to ~/.config/
├── PROACTIVE.md              # Full proactive GitHub MCP playbook
├── TRENDING.md               # Trending tools — avoid rebuilds & breakage
├── scripts/refresh-trending.sh # Refresh TRENDING.md (manual or weekly)
├── .gitignore                # Blocks secrets & junk from ever being committed
└── README.md
```

## Proactive development system (anti-breakage)

**Rule:** never build from scratch if it exists. Before ANY build, search
GitHub, mimic the best existing repo, then fork + customize.

- **PROACTIVE.md** — the full playbook: ordered search steps (repos → code →
  issues → read file), available GitHub MCP tools, and the fork-mimic-
  customize philosophy.
- **TRENDING.md** — curated list of trending, maintained tools per category
  (auth, dashboard/UI, MCP servers, boilerplates). **Check this file first**
  when starting something new.
- **scripts/refresh-trending.sh** — refreshes TRENDING.md via
  `github_search_repositories`; run weekly or on demand.

Requires `GITHUB_PERSONAL_ACCESS_TOKEN` to be set (see Secrets system below) —
without it the GitHub MCP is inactive and all proactive calls fail.

## Secrets system — ZERO plaintext secrets

This repo is **privacy safe by design**. It contains **no API keys, no tokens,
no passwords**. Secrets are injected at runtime via environment variables:

- `opencode.jsonc` uses `{env:VAR}` placeholders, resolved by OpenCode at load:
  - `{env:MALIKS_OMNIROUTE_KEY}` — OmniRoute API key
  - `{env:CONTEXT7_API_KEY}` — Context7 MCP bearer token
  - `{env:GITHUB_PERSONAL_ACCESS_TOKEN}` — GitHub MCP token
- Real values live only in `~/.zshrc` (exports) and the shell environment.
- `mcpo/config.json` contains no headers or env secrets at all.

**If you ever see a real token value in this repo, that is a bug — fix it and
rotate the key.**

## How to restore

```bash
cd ~/dotfiles-opencode
./restore.sh
```

The script copies `opencode.jsonc` → `~/.config/opencode/` and
`mcpo/config.json` → `~/.config/mcpo/` (with `chmod 600`), and snapshots any
existing files to `*.bak-<timestamp>` first. Restart OpenCode / mcpo after.

## How to refresh the backup after a config change

```bash
cp ~/.config/opencode/opencode.jsonc ~/dotfiles-opencode/opencode/opencode.jsonc
cp ~/.config/mcpo/config.json ~/dotfiles-opencode/mcpo/config.json
cd ~/dotfiles-opencode
git add -A && git commit -m "chore: snapshot config after <change>"
```

## Model reference (current defaults)

- **Default model:** `omniroute/Free Pickles` — 8x free combo (priority strategy)
- Free single models: `oc/big-pickle`, `oc/deepseek-v4-flash-free`,
  `oc/minimax-m3-free`, `oc/qwen3.6-plus-free`, `oc/minimax-m2.5-free`,
  `oc/nemotron-3-super-free`, `oc/trinity-large-preview-free`,
  `oc/ling-2.6-1t-free`
- Auto routers: `auto/best-free`, `auto/coding:free`, `auto/best-fast`,
  `auto/best-reasoning`