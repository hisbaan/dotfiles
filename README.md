# Dotfiles

My dotfiles managed by [chezmoi](https://chezmoi.io)

![desktop screenshot](https://github.com/user-attachments/assets/65257931-f886-403b-a82d-e7e740e8e203)

# Installation

Init the dotfiles with:

```sh
chezmoi init hisbaan # optionally include --ssh
```

Secrets are managed with the unofficial rust bitwarden cli, [`rbw`](https://github.com/doy/rbw).
Authenticate with that:

```sh
rbw login
```

Install the dotfiles with:

```sh
chezmoi apply
```
