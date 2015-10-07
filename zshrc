###### OH-MY-ZSH

# Path to oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
ZSH_THEME="muse"

alias geto="curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh"

alias zconf="vim ~/.zshrc"

alias ohmy="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/

plugins=(docker docker-compose git git-prompt go golang jsontools sublime tmux vagrant)

source $ZSH/oh-my-zsh.sh
[[ -f ~/.zshrc-local ]] && . ~/.zshrc-local
[[ -f ~/.localrc ]] && . ~/.localrc

###### GOLANG

alias gob=go build
alias goi=go install
alias gov=go vet
alias gol=golint

export GOROOT=`go env GOROOT`
export GOPATH=~/golang
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
