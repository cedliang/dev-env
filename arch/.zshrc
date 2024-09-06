############################# STARTUP ##############################

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

FZF_LSCOLORS='rs=0:di=34:ln=36:mh=00:pi=40;33:so=35:do=35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=32:*.7z=31:*.ace=31:*.alz=31:*.apk=31:*.arc=31:*.arj=31:*.bz=31:*.bz2=31:*.cab=31:*.cpio=31:*.crate=31:*.deb=31:*.drpm=31:*.dwm=31:*.dz=31:*.ear=31:*.egg=31:*.esd=31:*.gz=31:*.jar=31:*.lha=31:*.lrz=31:*.lz=31:*.lz4=31:*.lzh=31:*.lzma=31:*.lzo=31:*.pyz=31:*.rar=31:*.rpm=31:*.rz=31:*.sar=31:*.swm=31:*.t7z=31:*.tar=31:*.taz=31:*.tbz=31:*.tbz2=31:*.tgz=31:*.tlz=31:*.txz=31:*.tz=31:*.tzo=31:*.tzst=31:*.udeb=31:*.war=31:*.whl=31:*.wim=31:*.xz=31:*.z=31:*.zip=31:*.zoo=31:*.zst=31:*.avif=35:*.jpg=35:*.jpeg=35:*.mjpg=35:*.mjpeg=35:*.gif=35:*.bmp=35:*.pbm=35:*.pgm=35:*.ppm=35:*.tga=35:*.xbm=35:*.xpm=35:*.tif=35:*.tiff=35:*.png=35:*.svg=35:*.svgz=35:*.mng=35:*.pcx=35:*.mov=35:*.mpg=35:*.mpeg=35:*.m2v=35:*.mkv=35:*.webm=35:*.webp=35:*.ogm=35:*.mp4=35:*.m4v=35:*.mp4v=35:*.vob=35:*.qt=35:*.nuv=35:*.wmv=35:*.asf=35:*.rm=35:*.rmvb=35:*.flc=35:*.avi=35:*.fli=35:*.flv=35:*.gl=35:*.dl=35:*.xcf=35:*.xwd=35:*.yuv=35:*.cgm=35:*.emf=35:*.ogv=35:*.ogx=35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:'

export FZF_DEFAULT_COMMAND="LS_COLORS='$FZF_LSCOLORS' fd -u --color=always"
export FZF_DIRECTORIES_COMMAND="LS_COLORS='$FZF_LSCOLORS' fd -u --type d --color=always"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DIRECTORIES_COMMAND"

export FZF_DEFAULT_OPTS="--border --preview-window=border-rounded --margin=1 --scrollbar=▌▐ --info=right --ansi --color=bg+:#403c37"
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

zstyle ':omz:update' mode auto

bindkey '^ ' autosuggest-accept
export EDITOR=nvim
 
# zstyle :omz:plugins:keychain agents ssh
# zstyle :omz:plugins:keychain identities id_ed25519 id_ecdsa
# zstyle :omz:plugins:keychain options --quiet
# plugins=(
#     git
#     fzf-tab
#     zsh-autosuggestions
#     zsh-syntax-highlighting
#     git-auto-fetch
#     fzf
#     thefuck
#     copybuffer
#     keychain
#     aliases
#     tmux
#     cp
#     extract
#     fancy-ctrl-z
# )

plugins=(
    git
    fzf-tab
    zsh-autosuggestions
    zsh-syntax-highlighting
    git-auto-fetch
    fzf
    copybuffer
    aliases
    tmux
    cp
    extract
    fancy-ctrl-z
)

source $ZSH/oh-my-zsh.sh

############################# ALIASES ##############################

alias cat='bat -pP'
alias rlf='readlink -f'
alias ls='eza --color-scale=all'

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

# .NET
# export DOTNET_ROOT=$HOME/.dotnet
export MSBUILDDISABLENODEREUSE=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

############################# MISC #################################

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"

# eval $(thefuck --alias)

############################# CLEANUP ##############################

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

