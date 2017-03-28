source ~/Sites/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle golang
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

###### GOLANG

export GOROOT=`go env GOROOT`
export GOPATH=~/golang:~/Sites/5calls/go
export GO15VENDOREXPERIMENT="1"
export PATH=$PATH:$GOROOT/bin::$GOPATH/bin
export DRUPAL_ENDPOINT=http://stage.economist.com/ec-services
export DRUPAL_CDN_ENDPOINT=http://cdn.static-economist.com
API_GATEWAY_ENDPOINT=http://mt-content.stage.s.aws.economist.com

cover () { 
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

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
# KILL ALL CONTAINERS
alias dockerboom='docker ps -a -q | xargs docker rm'

# DELETE ALL STOPPED CONTAINERS.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# DELETE ALL UNTAGGED IMAGES.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# DELETE ALL STOPPED CONTAINERS AND UNTAGGED IMAGES.
alias dockerclean='dockercleanc || true && dockercleani'

export NVM_DIR="/Users/buddhamagnet/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
