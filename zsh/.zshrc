################################################################################
# zsh CONFIGURATION FILE
# zsh reference https://zsh.sourceforge.io/
# All dotfiles can be found here: http://github.com/rastilization/dotfiles
################################################################################


########################################################
# Enable Powerlevel10k instant prompt
# Should stay close to the top of ~/.zshrc.
########################################################

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


########################################################
# Init completion
########################################################

autoload -Uz compinit
compinit


########################################################
# Exports
########################################################

export PATH=$HOME/bin:/usr/local/bin:$PATH

export BROWSER='firefox'
export TERMINAL='alacritty'
export VISUAL='nvim'
export TERM='xterm-256color'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if [[ $LANG = '' ]]; then
	export LANG=en_US.UTF-8
fi


########################################################
# Configuration
########################################################

unsetopt BEEP
setopt COMPLETE_IN_WORD

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HISTORY_IGNORE="(l|ls|la|pwd|exit|clear|cd|cd ..|..)"
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

setopt COMPLETE_ALIASES


########################################################
# Cursor
########################################################

# echo -e -n "\x1b[\x30 q" # blinking block
# echo -e -n "\x1b[\x31 q" # blinking block also
# echo -e -n "\x1b[\x32 q" # steady block
echo -e -n "\x1b[\x33 q" # blinking underline
# echo -e -n "\x1b[\x34 q" # steady underline
# echo -e -n "\x1b[\x35 q" # blinking bar
# echo -e -n "\x1b[\x36 q" # steady bar


########################################################
# Keybindings
########################################################

# bindkey -v
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-word
bindkey '^L' forward-word
bindkey '^J' down-line-or-history
bindkey '^K' up-line-or-history
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history


########################################################
# Functions
########################################################

md() {
  mkdir -p "$1"
  cd "$1"
}

is() {
  [[ -s $1          ]] || { echo "is not valid"; return; }
  [[ -L $1 && -d $1 ]] && { echo "is a dir symlink"; return; }
  [[ -L $1 && -f $1 ]] && { echo "is a file symlink"; return; }
  [[ -d $1          ]] && { echo "is a dir"; return; }
  [[ -f $1          ]] && { echo "is a file"; return; }
}

extract() {
 if [ -f $1 ] ; then
   case $1 in
     *.tar.bz2) tar xvjf $1   ;;
     *.tar.gz)  tar xvzf $1   ;;
     *.tar.xz)  tar xvfJ $1   ;;
     *.bz2)     bunzip2 $1    ;;
     *.rar)     unrar x $1    ;;
     *.gz)      gunzip $1     ;;
     *.tar)     tar xvf $1    ;;
     *.tbz2)    tar xvjf $1   ;;
     *.tgz)     tar xvzf $1   ;;
     *.zip)     unzip $1      ;;
     *.Z)       uncompress $1 ;;
     *.7z)      7z x $1       ;;
     *)         echo "could not extract '$1'" ;;
   esac
 else
   echo "'$1' is not valid"
 fi
}


########################################################
# Aliases
########################################################

alias vim='nvim'

# Reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l='ls -AX --group-directories-first --color'
alias la='ls -oAhX --group-directories-first --color'
alias ll='ls -laFh --group-directories-first --color'

# Confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias rmr='rm -r'
alias rmf='rm -rf'

# Helpers
alias pls='sudo'
alias ping='ping -c 5'
alias grep='grep --color=auto'
alias clr='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."'
alias lpath='echo $PATH | tr ":" "\n"' # list the PATH separated by new lines

# Useragent curl
alias iecurl='curl -H "User-Agent: Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)"'
alias ffcurl='curl -H "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.0 (.NET CLR 3.5.30729)"'


########################################################
# Sources
########################################################

# Zsh plugins
[[ -f ~/.shell/zsh_plugins.sh ]] && source ~/.shell/zsh_plugins.sh

# Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Python things
[[ -f ~/.shell/pythonrc ]] && source ~/.shell/pythonrc

# Source localrc
[[ -f ~/.localrc ]] && source ~/.localrc


########################################################
# Evals
########################################################

eval "$(zoxide init zsh)"
