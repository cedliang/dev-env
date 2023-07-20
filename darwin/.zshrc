############################# STARTUP ##############################

# macchina

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

############################# OH MY ZSH ############################

export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# ZSH_THEME="agnoster"
# DEFAULT_USER=ced
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
ZSH_THEME="powerlevel10k/powerlevel10k"

export FZF_DEFAULT_COMMAND='fd -u'
export FZF_DIRECTORIES_COMMAND='fd -u --type d'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND=$FZF_DIRECTORIES_COMMAND

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting git-auto-fetch fzf copybuffer aliases tmux cp)

source $ZSH/oh-my-zsh.sh

############################# ALIASES ##############################

alias cat='bat -p --paging=never'
alias rlf='readlink -f'
alias brow='arch -x86_64 /usr/local/Homebrew/bin/brew'

alias pip=pip3.11
alias pip3=pip3.11
alias python=python3.11
alias python3=python3.11

alias gswi='git switch $(git branch | fzf)'

############################# PATH #################################

path=(/opt/homebrew/opt/python@3.11/bin $path)
path=($HOME/Library/Python/3.11/bin $path)

path=(/opt/homebrew/bin $path)

path=($HOME/.local/bin $path)

export PATH

############################# DEV ##################################

# Python
CERT_PATH=$(python3.11 -m certifi)
export SSL_CERT_FILE=${CERT_PATH}
export REQUESTS_CA_BUNDLE=${CERT_PATH}

# Haskell GHC
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# Go
export GOPATH=$HOME/.go

############################# MISC #################################

ssh-add --apple-load-keychain > /dev/null 2>&1

test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

eval $(thefuck --alias)

############################# CLEANUP ##############################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
