export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"

macchina

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

ZSH_THEME="agnoster"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

export FZF_DEFAULT_COMMAND='fd -H'
export FZF_DIRECTORIES_COMMAND='fd -H --type d'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DIRECTORIES_COMMAND"

# zstyle :omz:plugins:keychain agents ssh
# zstyle :omz:plugins:keychain identities id_ed25519 id_ecdsa
# zstyle :omz:plugins:keychain options --quiet
# plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting git-auto-fetch fzf thefuck copybuffer keychain aliases)

plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting git-auto-fetch fzf thefuck copybuffer aliases)
source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.local/bin:$PATH

alias cat='bat -p --paging=never'
alias rlf='readlink -f'
