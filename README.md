# Preview

![desktop screenshot](https://github.com/user-attachments/assets/65257931-f886-403b-a82d-e7e740e8e203)

# System Info

| _Item_                  | _Program_                                                          |
| ----------------------- | ------------------------------------------------------------------ |
| _OS_                    | [Arch Linux](https://archlinux.org)                                |
| _WM_                    | [hyprland](https://hyprland.org/)                                  |
| _Bar_                   | [Waybar](https://github.com/Alexays/Waybar)                        |
| _Terminal_              | [wezterm](https://wezfurlong.org/wezterm/)                         |
| _Current Color Scheme_  | [Catppuccin Mocha](https://github.com/catppuccin/catppuccin)       |
| _Color Scheme Manager_  | [flavours](https://github.com/Misterio77/flavours)                 |
| _Shell_                 | [zsh](https://www.zsh.org/)                                        |
| _AUR Helper_            | [paru](https://github.com/Morganamilo/paru)                        |
| _Editor_                | [neovim](https://neovim.io)                                        |
| _Font_                  | [MesloLGS Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts) |
| _App Launcher_          | [Tofi](https://github.com/philj56/tofi)                            |
| _Browser_               | [Zen](https://www.mozilla.org/firefox/)                            |
| _Startpage_             | [bento](https://github.com/MiguelRAvila/Bento)                     |
| _Terminal File Manager_ | [Yazi](https://github.com/sxyazi/yazi)                             |
| _GUI File Manager_      | [Nautilus](https://gitlab.gnome.org/GNOME/nautilus)                |
| _Notification Daemon_   | [Dunst](https://github.com/dunst-project/dunst)                    |
| _Video Player_          | [mpv](https://mpv.io/)                                             |
| _System Monitor_        | [btop](https://github.com/aristocratos/btop)                       |
| _Image Viewer_          | [imv](https://sr.ht/~exec64/imv/)                                  |
| _Document Viewer_       | [Zathura](https://pwmt.org/projects/zathura/)                      |

# Installation

## Manual

- Clone the repo and migrate configuration files as necessary.
- All of my explicityly installed programs are in the `pkglist.txt` and `pkglist-aur.txt` files.

## Automatic _(Arch Linux only, work in progress)_

Run the following set of commands on an Arch Linux system.

```sh
git clone https://github.com/hisbaan/hass $HOME/hass; \
$HOME/hass/hass.sh
```

Answer the prompts that appear.

The script will create a backup folder for your old configs in =~/hass-backup=. There will be an uninstall script in the future that assumes =~/hass-backup= exists so don't delete the folder if you're just trying out my config.
