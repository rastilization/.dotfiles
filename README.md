# .dotfiles

- [Installation](#installation)
- [Fonts](#fonts)


- Theme: [catppuccin](#theme-catppuccin)
- Distro: [fedora](#distro-fedora)
- WM: [i3](#wm-i3)
- Shell: [zsh](#shell-zsh)
- Terminal: [alacritty](#terminal-alacritty)
- Bar: [polybar](#bar-polybar)
- Launcher: [rofi](#launcher-rofi)
- Notifications: [dunst](#notification-dunst)
- Composite: [picom](#composite-picom)
- Browser: [firefox](#browser-firefox)
___

## Installation
Move previous dotfiles to backup before installation.  
Installation is processed by stow utility. It makes symlinks from dotfiles.

```bash
$ git clone <https://github.com/rastilization/.dotfiles.git> ~/.dotfiles
$ cd ~/.dotfiles
$ ./install.sh
```
___

## Fonts

- SourceCodePro
- NerdFont
___

## Theme: catppuccin
page: https://github.com/catppuccin/catppuccin

### Used stuff
- [cursors](https://github.com/catppuccin/cursors)
- [i3](https://github.com/catppuccin/i3)
- [polybar](https://github.com/catppuccin/polybar)
- [nvim](https://github.com/catppuccin/nvim)
- [rofi](https://github.com/catppuccin/rofi)
- [dunst](https://github.com/catppuccin/dunst)
___

## Distro: fedora
page: https://getfedora.org/
___

## WM: i3
page: https://i3wm.org/
___

## Shell: zsh
page: https://www.zsh.org/

### Used stuff
- [neofetch](https://github.com/dylanaraps/neofetch) - cli system info
- [onefetch](https://github.com/o2sh/onefetch) - cli git repo info
- [zoxide](https://github.com/ajeetdsouza/zoxide) - cli smart pathing
- [fzf](https://github.com/junegunn/fzf) - cli fuzzy finder
___

## Terminal: alacritty
page: https://github.com/alacritty/alacritty

### Known issues
Proving it runs on the GPU: For Nvidia you can use `watch -n -1 nvidia-smi` command to ensure that alacritty uses GPU.
___

## Bar: polybar
page: https://github.com/polybar/polybar

### Known issues
[i3 doesnt apply offset of polybar](https://github.com/polybar/polybar/wiki/Known-Issues#override-redirect-in-i3)
___

## Launcher: rofi
page: https://github.com/davatorium/rofi
___

## Notifications: dunst
page: https://github.com/dunst-project/dunst
___

## Composite: picom
page: https://github.com/yshui/picom
___

## Browser: firefox
page: https://www.mozilla.org/firefox/
___
