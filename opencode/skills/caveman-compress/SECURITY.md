# Security

## Snyk High Risk Rating

`caveman-compress` receives a Snyk High Risk rating due to static analysis heuristics. This document explains what the skill does and does not do.

### What triggers the rating

1. **subprocess usage**: The skill calls the `opencode` CLI (`opencode run --pure`) via `subprocess.run()` to reach the LLM, using opencode's own auth store. The subprocess call uses a fixed argument list plus the prompt as a single positional argument — no shell interpolation or `shell=True` occurs. User file content reaches the CLI as a process argument, not a shell command.

2. **File read/write**: The skill reads the file the user explicitly points it at, compresses it, and writes the result back to the same path. A `.original.md` backup is saved to an out-of-tree data dir (`$XDG_DATA_HOME/caveman-compress/backups/<parent-dir-name>/`, or `%LOCALAPPDATA%\caveman-compress\backups\<parent-dir-name>\` on Windows). Beyond the target file and that backup location, no files are read or written.

### What the skill does NOT do

- Does not execute user file content as code
- Does not make network requests except to the configured LLM provider (via `opencode run` or, optionally, the Anthropic SDK)
- Does not access files outside the path the user provides
- Does not use shell=True or string interpolation in subprocess calls
- Does not collect or transmit any data beyond the file being compressed

### Auth behavior

By default the skill shells out to `opencode run`, which authenticates through opencode's own auth store (`opencode auth login`) — no `claude` CLI and no `ANTHROPIC_API_KEY` required. If `ANTHROPIC_API_KEY` is set and the `anthropic` Python package is installed, the skill uses the Anthropic Python SDK directly (no subprocess) as an optional fast path.

### File size limit

Files larger than 500KB are rejected before any API call is made.

### Reporting a vulnerability

If you believe you've found a genuine security issue, please open a GitHub issue with the label `security`.
