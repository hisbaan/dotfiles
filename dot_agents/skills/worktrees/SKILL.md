---
name: worktrees
description: Use when creating a worktree
---

Use the `wt` script to manage worktrees. Where the repo is setup as a bare repo, you should create worktrees in the bare directory as siblings of existing worktrees.

Example command `wt a -b hisbaan/ENG-XXXXX-short-slug short-slug` where XXXXX is the linear ticket id. I
If there is no associated linear ticket, just make the branch name `hisbaan/short-slug`

Use `wt --help` to see the features of the `wt` script
