date
shopt -s histappend
shopt -s histreedit
shopt -s histverify
HISTCONTROL='ignoreboth'
export PS1="\e[0;32m[\u@\h \W]\$ \e[m "

###### GOLANG

export GOPATH=~/golang
export PATH=$PATH:$GOROOT/bin::$GOPATH/bin
export PATH=$(brew --prefix openvpn)/sbin:$PATH

###### EDITORS

export EDITOR=vim

###### JUMPLIST

. /usr/local/bin/z.sh


