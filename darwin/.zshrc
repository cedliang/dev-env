############################# STARTUP ##############################

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

############################# OH MY ZSH ############################

export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

ZSH_THEME="powerlevel10k/powerlevel10k"

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:'
FZF_LSCOLORS='rs=0:di=34:ln=36:mh=00:pi=40;33:so=35:do=35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=32:*.7z=31:*.ace=31:*.alz=31:*.apk=31:*.arc=31:*.arj=31:*.bz=31:*.bz2=31:*.cab=31:*.cpio=31:*.crate=31:*.deb=31:*.drpm=31:*.dwm=31:*.dz=31:*.ear=31:*.egg=31:*.esd=31:*.gz=31:*.jar=31:*.lha=31:*.lrz=31:*.lz=31:*.lz4=31:*.lzh=31:*.lzma=31:*.lzo=31:*.pyz=31:*.rar=31:*.rpm=31:*.rz=31:*.sar=31:*.swm=31:*.t7z=31:*.tar=31:*.taz=31:*.tbz=31:*.tbz2=31:*.tgz=31:*.tlz=31:*.txz=31:*.tz=31:*.tzo=31:*.tzst=31:*.udeb=31:*.war=31:*.whl=31:*.wim=31:*.xz=31:*.z=31:*.zip=31:*.zoo=31:*.zst=31:*.avif=35:*.jpg=35:*.jpeg=35:*.mjpg=35:*.mjpeg=35:*.gif=35:*.bmp=35:*.pbm=35:*.pgm=35:*.ppm=35:*.tga=35:*.xbm=35:*.xpm=35:*.tif=35:*.tiff=35:*.png=35:*.svg=35:*.svgz=35:*.mng=35:*.pcx=35:*.mov=35:*.mpg=35:*.mpeg=35:*.m2v=35:*.mkv=35:*.webm=35:*.webp=35:*.ogm=35:*.mp4=35:*.m4v=35:*.mp4v=35:*.vob=35:*.qt=35:*.nuv=35:*.wmv=35:*.asf=35:*.rm=35:*.rmvb=35:*.flc=35:*.avi=35:*.fli=35:*.flv=35:*.gl=35:*.dl=35:*.xcf=35:*.xwd=35:*.yuv=35:*.cgm=35:*.emf=35:*.ogv=35:*.ogx=35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:'
# FZF_LSCOLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

export FZF_DEFAULT_COMMAND="LS_COLORS='$FZF_LSCOLORS' fd -j4 -u --color=always -E 'OrbStack*' ."
export FZF_DIRECTORIES_COMMAND="LS_COLORS='$FZF_LSCOLORS' fd -j4 -u --type d --color=always -E 'OrbStack*' ."

# export FZF_DEFAULT_COMMAND="fd -u . -E 'Library*'"
# export FZF_DIRECTORIES_COMMAND="fd -u --type d . -E 'Library*'"

export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND=$FZF_DIRECTORIES_COMMAND

export FZF_DEFAULT_OPTS="--border --preview-window=border-rounded --margin=1 --scrollbar=▌▐ --info=right --ansi"
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
