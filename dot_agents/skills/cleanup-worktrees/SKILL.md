---
name: worktrees
description: Use when cleaning up worktrees
disable-model-invocation: true
---

Use the `wt` script to manage worktrees. Run `wt --help` to see the options

Go through the existing worktrees for this repo, and for each one:

1. check if the associated PRs are merged or closed
2. check if the worktree has uncommited changes
3. delete the worktree using the `wt` helper script

Do this in parallel for each worktree. The macOS filesystem is slow

Give one report at the end containing the list of deleted worktrees and the list of skipped worktrees.

NEVER cleanup worktrees `main` or `develop`
