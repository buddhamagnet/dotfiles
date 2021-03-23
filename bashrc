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

###### JUMPLIST

. /usr/local/bin/z.sh


