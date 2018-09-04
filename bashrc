date
shopt -s histappend
shopt -s histreedit
shopt -s histverify
HISTCONTROL='ignoreboth'
export PS1="\e[0;32m[\u@\h \W]\$ \e[m "

###### GOLANG

export GOPATH=~/golang
export PATH=$PATH:$GOROOT/bin::$GOPATH/bin

###### EDITORS

export EDITOR=vim

###### JUMPLIST

. /usr/local/bin/z.sh

###### PATHS

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

###### DOCKER PAIN

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

###### NVM CONFIG BECAUSE I HAVE TO JS

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



