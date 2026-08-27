# opencode Config

Personal [opencode](https://opencode.ai) configuration: agents, slash commands, skills, and the caveman plugin.

## Layout

```
opencode/
├── AGENTS.md           # Global ruleset (caveman mode)
├── opencode.jsonc      # Main config — loads the caveman plugin
├── agents/             # cavecrew subagents (investigator, builder, reviewer)
├── commands/           # Slash commands (caveman, caveman-commit, ...)
├── plugins/
│   └── caveman/        # Plugin: terse mode tracking + slash commands
└── skills/             # Skills: caveman*, cavecrew, grilling, teach, handoff, ...
```

## Install

Installs opencode itself (via the official installer) and copies these config files to `~/.config/opencode`.

```bash
./opencode/install.sh
```

What it does:

1. Installs the opencode CLI: `curl -fsSL https://opencode.ai/install | bash`
2. Copies `opencode.jsonc`, `AGENTS.md`, `agents/`, `commands/`, `skills/`, `plugins/` into `~/.config/opencode/`
3. Installs the plugin's runtime deps: `npm install` in `~/.config/opencode/plugins/caveman/`

Copy mode is **overwrite** (`cp -r`) — the repo config replaces the current one.

## Dependencies

- **npm** — required to install the caveman plugin's packages (`npm install`)
- **python3** — required by the `caveman-compress` skill scripts

## Usage

Skills auto-load when their trigger matches. The caveman ruleset in `AGENTS.md` takes effect once opencode is restarted after the config is installed.