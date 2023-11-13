############################# OH MY ZSH ############################

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

ZSH_THEME="powerlevel10k/powerlevel10k"

export FZF_DEFAULT_COMMAND='fd -u'
export FZF_DIRECTORIES_COMMAND='fd -u --type d'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DIRECTORIES_COMMAND"

export FZF_ALT_C_OPTS="--preview 'tree -L 1 -C {}' --info=right --border=thinblock --preview-window=border-thinblock --margin=1 --scrollbar=▌▐ --separator=━"
export FZF_CTRL_R_OPTS="--border=thinblock --margin=1 --scrollbar=▌▐ --separator=━"
export FZF_CTRL_T_OPTS="--preview '[ -d {} ] && tree -L 1 -C {} || ([ -f {} ] && bat -n --color=always {})' --info=right --border=thinblock --preview-window=border-thinblock --margin=1 --scrollbar=▌▐ --separator=━"

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'

# zstyle :omz:plugins:keychain agents ssh
# zstyle :omz:plugins:keychain identities id_ed25519 id_ecdsa
# zstyle :omz:plugins:keychain options --quiet
# plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting git-auto-fetch fzf thefuck copybuffer keychain aliases tmux cp extract fancy-ctrl-z)

plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting git-auto-fetch fzf copybuffer aliases tmux cp extract fancy-ctrl-z)

source $ZSH/oh-my-zsh.sh

############################# ALIASES ##############################

alias cat='bat -pP'
alias rlf='readlink -f'

alias rcp='rsync -avhzP'
alias rmv='rsync -avhzP --remove-source-files'
alias rup='rsync -avhzPu'
alias rsy='rsync -avhzPu --del'

############################# PATH #################################

path=($HOME/.local/bin $path)

export PATH

############################# DEV ##################################

# Go
export GOPATH=$HOME/.go

############################# MISC #################################

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"

eval $(thefuck --alias)

############################# CLEANUP ##############################
