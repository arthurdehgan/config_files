# Kilo Config

Personal [Kilo](https://kilo.ai) configuration: global `kilo.jsonc` (permissions, instructions) and instruction files.

## Layout

```
kilo/
├── kilo.jsonc                  # Main config — permissions + instructions globs
├── instructions/               # Extra instructions loaded via the `instructions` field
│   └── commit-messages.md      # Commit message ruleset
└── install.sh
```

## Install

```bash
./kilo/install.sh
```

What it does:

1. Copies `kilo.jsonc` and `instructions/` into `~/.config/kilo/`

Copy mode is **overwrite** (`cp`) — the repo config replaces the current one.

Kilo also reads `AGENTS.md`, `.kilo/`, `~/.kilo/` and `~/.kilocode/` for project-level config, commands, agents and skills; only the global config is managed here.

## Notes

- `instructions` are glob patterns; the config uses `~/.config/kilo/instructions/*.md` so the repo stays portable.
- The `external_directory` entries in `kilo.jsonc` are machine-specific (temp dirs); update them if your temp path differs.