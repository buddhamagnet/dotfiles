# WELCOME

date

# ANTIGEN

source ~/Sites/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle golang
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle z
antigen bundle command-not-found
antigen bundle copyfile
antigen bundle colored-man-pages
antigen bundle vundle

antigen theme gnzh

antigen apply

###### GOLANG

export GOPATH=~/golang
export PATH=$PATH:~/Library/Python/2.7/bin:$GOROOT/bin::$GOPATH/bin

###### EDITORS

export EDITOR=vim

###### JUMPLIST

. /usr/local/bin/z.sh

###### PATHS

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
