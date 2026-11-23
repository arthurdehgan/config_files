# Commit messages

Before running `git commit` (or any command that creates a commit), always:

1. Show the exact commit message you intend to use, verbatim, in the chat.
2. List the files being committed (`git status` / `git diff --staged` summary).
3. Wait for explicit user confirmation. Never commit until the user approves that exact message.

If the user requests changes to the message, revise it, show the new version, and wait for confirmation again.

Do not use `-m` with a message the user has not seen. Do not amend, force-push, or create merge commits without the same preview-and-confirm step.