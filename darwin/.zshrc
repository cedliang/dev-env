############################# STARTUP ##############################

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

############################# OH MY ZSH ############################

export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

ZSH_THEME="powerlevel10k/powerlevel10k"

# export FZF_DEFAULT_COMMAND='fd -u'
# export FZF_DIRECTORIES_COMMAND='fd -u --type d'

export FZF_DEFAULT_COMMAND="fd -u . -E 'Library*'"
export FZF_DIRECTORIES_COMMAND="fd -u --type d . -E 'Library*'"

export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND=$FZF_DIRECTORIES_COMMAND

export FZF_DEFAULT_OPTS="--border --preview-window=border-rounded --margin=1 --scrollbar=▌▐ --info=right"
export FZF_ALT_C_OPTS="--preview 'tree -L 1 -C {}'"
export FZF_CTRL_R_OPTS=""
export FZF_CTRL_T_OPTS="--preview '[ -d {} ] && tree -L 1 -C {} || ([ -f {} ] && bat -n --color=always {})'"
export FZF_COMPLETION_OPTS=$FZF_CTRL_T_OPTS

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# set this to 2 + (2 if borders) + (2 * margin)
# eg, with borders and margin 1, this is 6
zstyle ':fzf-tab:*' fzf-pad 6
zstyle ':fzf-tab:*' switch-group ',' '.'

plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting git-auto-fetch fzf copybuffer aliases tmux cp extract fancy-ctrl-z)

source $ZSH/oh-my-zsh.sh

############################# ALIASES ##############################

alias cat='bat -pP'
alias rlf='readlink -f'
alias ls='eza'

alias rcp='rsync -avhzP'
alias rmv='rsync -avhzP --remove-source-files'
alias rup='rsync -avhzPu'
alias rsy='rsync -avhzPu --del'

# create pull request with bitbucket push
alias gpcpr='git push 2>&1 | grep https | awk '\''{print $2}'\'' | xargs open'

############################# PATH #################################

path=(/opt/homebrew/opt/python@3.11/bin $path)
# path=($HOME/Library/Python/3.11/bin $path)

path=(/opt/homebrew/bin $path)

path=($HOME/.local/bin $path)

export PATH

############################# DEV ##################################

# Python
CERT_PATH=$(python3 -m certifi)
export SSL_CERT_FILE=${CERT_PATH}
export REQUESTS_CA_BUNDLE=${CERT_PATH}

# Haskell GHC
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# Go
export GOPATH=$HOME/.go

# .NET
export DOTNET_CLI_TELEMETRY_OPTOUT=1

############################# MISC #################################

ssh-add --apple-load-keychain > /dev/null 2>&1

test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

eval $(thefuck --alias)

############################# CLEANUP ##############################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
