# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -v
# End of lines configured by zsh-newuser-install
#

bindkey "^[OD" backward-word
bindkey "^[OC" forward-word

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt CORRECT      # command CORRECTION
setopt MENUCOMPLETE
setopt ALL_EXPORT
setopt appendhistory autocd extendedglob nomatch
setopt notify globdots correct pushdtohome cdablevars autolist
setopt correctall autocd recexact longlistjobs
setopt autoresume histignoredups pushdsilent
setopt autopushd pushdminus rcquotes mailwarning
setopt listtypes
setopt recexact
setopt noshwordsplit
setopt printexitvalue
setopt hist_ignore_all_dups
setopt sharehistory

unsetopt menucomplete
unsetopt beep notify
unsetopt bgnice autoparamslash

zstyle ':completion:*' file-sort 'time'

# Autoload zsh modules when they are referenced
#zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
#zmodload -ap zsh/mapfile mapfile

HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'
autoload colors zsh/terminfo

if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
  eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
  (( count = $count + 1 ))
done

unsetopt ALL_EXPORT

# dircolors
#if [ -x /usr/bin/dircolors ]; then
#  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

  alias ls='ls -G -A'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
#fi

# my old bash aliases
#
alias vimremote='mvim --remote'
alias vimremoteall="find . -type f \( -name '*.module' -o -name '*.inc' \) | xargs vim --servername GVIM --remote-silent"
alias la='ls -lAHh'
alias l='ls'
alias z='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'
alias webserv='python -m SimpleHTTPServer'
alias ack='ack-grep'
alias eix="echo 'Szokjal le errol.';apt-cache search"
alias rsyncssh="rsync -avz --progress -e ssh "

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# awesome zsh modules
autoload zmv

# some handy options
setopt no_hup hist_verify

# correcting some keys
autoload zkbd

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# completion stuff
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' menu yes select
xdvi() { command xdvi ${*:-*.dvi(om[1])} }
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*' ignored-patterns '*.sw*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:urls' local /var/www/localhost/htdocs/

# formatting and messages
#zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
#zstyle ':completion:*' group-name ''

# for cd, only list dirs
compctl -/ cd


_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1  # Because we didn't really complete anything
}

zstyle ':completion:*' completer \
    _oldlist _expand _force_rehash _complete

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

ac() { # compress a file or folder
  case "$1" in
    tar.bz2|.tar.bz2) tar cvjf "${2%%/}.tar.bz2" "${2%%/}/"  ;;
    tbz2|.tbz2)       tar cvjf "${2%%/}.tbz2" "${2%%/}/"     ;;
    tbz|.tbz)         tar cvjf "${2%%/}.tbz" "${2%%/}/"      ;;
    tar.gz|.tar.gz)   tar cvzf "${2%%/}.tar.gz" "${2%%/}/"   ;;
    tgz|.tgz)         tar cvjf "${2%%/}.tgz" "${2%%/}/"      ;;
    tar|.tar)         tar cvf  "${2%%/}.tar" "${2%%/}/"        ;;
    rar|.rar)         rar a "${2}.rar" "$2"            ;;
    zip|.zip)         zip -9 "${2}.zip" "$2"            ;;
    7z|.7z)         7z a "${2}.7z" "$2"            ;;
    lzo|.lzo)         lzop -v "$2"                ;;
    gz|.gz)         gzip -v "$2"                ;;
    bz2|.bz2)         bzip2 -v "$2"                ;;
    xz|.xz)         xz -v "$2"                    ;;
    lzma|.lzma)         lzma -v "$2"                ;;
    *)           echo "ac(): compress a file or directory."
    echo "Usage:   ac <archive type> <filename>"
    echo "Example: ac tar.bz2 PKGBUILD"
    echo "Please specify archive type and source."
    echo "Valid archive types are:"
    echo "tar.bz2, tar.gz, tar, bz2, gz, tbz2, tbz,"
    echo "tgz, lzo, rar, zip, 7z, xz and lzma." ;;
  esac
}

ad() { # decompress archive (to directory $2 if wished for and possible)
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2|*.tgz|*.tbz2|*.tbz) mkdir -v "$2" 2>/dev/null ; tar xvjf "$1" -C "$2" ;;
      *.tar.gz)             mkdir -v "$2" 2>/dev/null ; tar xvzf "$1" -C "$2" ;;
      *.tar)             mkdir -v "$2" 2>/dev/null ; tar xvf "$1"  -C "$2" ;;
      *.rar)             mkdir -v "$2" 2>/dev/null ; unrar x   "$1"     "$2" ;;
      *.zip)             mkdir -v "$2" 2>/dev/null ; unzip   "$1"  -d "$2" ;;
      *.7z)             mkdir -v "$2" 2>/dev/null ; 7z x    "$1"   -o"$2" ;;
      *.lzo)             mkdir -v "$2" 2>/dev/null ; lzop -d "$1"   -p"$2" ;;
      *.gz)             gunzip "$1"                       ;;
      *.bz2)             bunzip2 "$1"                       ;;
      *.Z)                 uncompress "$1"                       ;;
      *.xz|*.txz|*.lzma|*.tlz)     xz -d "$1"                           ;;
      *)
    esac
  else
    echo "Sorry, '$2' could not be decompressed."
    echo "Usage: ad <archive> <destination>"
    echo "Example: ad PKGBUILD.tar.bz2 ."
    echo "Valid archive types are:"
    echo "tar.bz2, tar.gz, tar, bz2,"
    echo "gz, tbz2, tbz, tgz, lzo,"
    echo "rar, zip, 7z, xz and lzma"
  fi
}

al() { # list content of archive but don't unpack
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2|*.tbz2|*.tbz) tar -jtf "$1"     ;;
      *.tar.gz)                     tar -ztf "$1"     ;;
      *.tar|*.tgz)                 tar -tf "$1"     ;;
      *.gz)                 gzip -l "$1"     ;;
      *.rar)                 rar x "$1"     ;;
      *.zip)                 unzip -l "$1"     ;;
      *.7z)                 7z l "$1"     ;;
      *.lzo)                 lzop -l "$1"     ;;
      *.xz|*.txz|*.lzma|*.tlz)      xz -l "$1"     ;;
    esac
  else
    echo "Sorry, '$1' is not a valid archive."
    echo "Valid archive types are:"
    echo "tar.bz2, tar.gz, tar, gz,"
    echo "tbz2, tbz, tgz, lzo, rar"
    echo "zip, 7z, xz and lzma"
  fi
}

alias drush='~/shellscript/drush/drush'

# page up and down
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward

bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

bindkey "^R" history-incremental-search-backward

# show git branch if in a git repo
setopt prompt_subst

function git-branch-name () {
  git branch 2> /dev/null | grep '^\*' | sed 's/^\*\ //'
}

function git-dirty () {
  git status 2> /dev/null | grep "nothing to commit (working directory clean)"
  echo $?
}

function git-prompt() {
  if [ $no_git_prompt ]; then
    return
  fi
  gstatus=$(git status 2> /dev/null)
  branch=$(echo $gstatus | head -1 | sed 's/^# On branch //')
  dirty=$(echo $gstatus | sed 's/^#.*$//' | tail -2 | grep 'nothing to commit (working directory clean)'; echo $?)
  if [[ x$branch != x ]]; then
    dirty_color=$fg[green]
    if [[ $dirty = 1 ]] { dirty_color=$fg[red] }
    [ x$branch != x ] && echo "%{$PR_BLUE%}[%{$dirty_color%}$branch%{$reset_color%}%{$PR_BLUE%}]"
  fi
}

function git-scoreboard () {
  git log | grep Author | sort | uniq -ci | sort -r
}

PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="$PR_GREEN%n@%m%u$PR_NO_COLOR:$PR_BLUE%~$PR_NO_COLOR%(!.#.$) "
#PS1="$PR_GREEN%n@%m%u$PR_NO_COLOR:$PR_BLUE%~`git-prompt`$PR_NO_COLOR%(!.#.$) "
#PROMPT='%{$reset_color%}%B%n%b@%m %~`git-prompt`%(!.#.>) '
PROMPT='%{$PR_GREEN%}%n@%m%u%{$PR_NO_COLOR%}:%{$PR_BLUE%}%~`git-prompt`%{$reset_color%}%(!.#.$) '
#RPS1=""

# I don't use it most of the time
export no_git_prompt=true

translate() {
  wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=${2:-en}|${3:-hu}" | sed -E -n 's/[[:alnum:]": {}]+"translatedText":"([^"]+)".*/\1/p';
  echo ''
  return 0;
}

export SLASHEMOPTIONS="boulder:0, color, autodig, !cmdassist, norest_on_space, showexp"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
zstyle ':completion:*' list-colors 'ExFxCxDxBxegedabagacad'

# macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:/Applications/MAMP/Library/bin/
export MANPATH=/opt/local/share/man:$MANPATH

export ECO="lp:~economist-magic/economist-magic"
