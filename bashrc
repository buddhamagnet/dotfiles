date
shopt -s histappend
shopt -s histreedit
shopt -s histverify
HISTCONTROL='ignoreboth'
export PS1="\e[0;32m[\u@\h \W]\$ \e[m "

###### GOLANG

export GOPATH=~/go
export PATH=$PATH:$GOROOT/bin::$GOPATH/bin

###### EDITORS

export EDITOR=vim

###### PAGERS

export PAGER="/usr/bin/most -s"

###### JUMPLIST

. /usr/local/bin/z.sh

###### NVM

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm