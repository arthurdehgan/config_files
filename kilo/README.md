# Kilo Config

Personal [Kilo](https://kilo.ai) configuration: global `kilo.jsonc` (permissions, instructions) and instruction files.

## Layout

```
kilo/
├── kilo.jsonc                  # Main config — permissions + instructions globs
├── instructions/               # Extra instructions loaded via the `instructions` field
│   └── commit-messages.md      # Commit message ruleset
├── install.sh                  # macOS / Linux installer
└── install.ps1                 # Windows PowerShell installer
```

## Install

### macOS / Linux

```bash
./kilo/install.sh
```

### Windows (PowerShell)

```powershell
.\kilo\install.ps1
```

If PowerShell blocks the script, bypass the execution policy for that run:

```powershell
powershell -ExecutionPolicy Bypass -File .\kilo\install.ps1
```

Both scripts do the same thing:

1. Copies `kilo.jsonc` and `instructions/` into `~/.config/kilo/` (`$HOME\.config\kilo` on Windows)

Copy mode is **overwrite** (`cp` / `Copy-Item`) — the repo config replaces the current one.

Kilo also reads `AGENTS.md`, `.kilo/`, `~/.kilo/` and `~/.kilocode/` for project-level config, commands, agents and skills; only the global config is managed here.

## Notes

- `instructions` are glob patterns; the config uses `~/.config/kilo/instructions/*.md` so the repo stays portable.
- The `external_directory` entries in `kilo.jsonc` are machine-specific (temp dirs); entries for both macOS and Windows are kept, so remove or adjust the ones that do not apply to the current machine.