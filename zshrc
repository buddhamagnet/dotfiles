cal
date
source ~/Sites/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle golang
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

###### GOLANG

export GOPATH=~/golang
export PATH=$PATH:$GOROOT/bin::$GOPATH/bin

cover () { 
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

###### EDITORS

export EDITOR=vim

###### JUMPLIST

. /usr/local/bin/z.sh

###### PATHS

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/buddhamagnet/.nvm/versions/node/v7.2.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/buddhamagnet/.nvm/versions/node/v7.2.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/buddhamagnet/.nvm/versions/node/v7.2.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/buddhamagnet/.nvm/versions/node/v7.2.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
