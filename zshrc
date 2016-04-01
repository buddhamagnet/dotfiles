###### ANTIGEN

. .antigen/antigen.zsh

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle docker
antigen bundle git-prompt
antigen bundle golang
antigen bundle go
antigen bundle sublime
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

###### GOLANG

export GOROOT=`go env GOROOT`
export GOPATH=~/golang
export GO15VENDOREXPERIMENT="1"
export PATH=$PATH:$GOROOT/bin::$GOPATH/bin

###### EDITORS

export EDITOR=vim

###### JUMPLIST

. /usr/bin/z

###### PATHS

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

###### DOCKER

export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm

# DEV DOCKER SETTTINGS, COMMENT OUT TO DISABLE

export DOCKER_HOST=tcp://127.0.0.1:2375
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH

# KILL RUNNING CONTAINERS.
alias dockerkill='docker kill $(docker ps -q)'

# DELETE ALL STOPPED CONTAINERS.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# DELETE ALL UNTAGGED IMAGES.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# DELETE ALL STOPPED CONTAINERS AND UNTAGGED IMAGES.
alias dockerclean='dockercleanc || true && dockercleani'
