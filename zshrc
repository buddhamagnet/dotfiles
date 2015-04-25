# path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# set name of the theme to load.
ZSH_THEME="muse"

# oh-my-zsh
alias geto="curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh"
alias zconf="vim ~/.zshrc"
alias ohmy="vim ~/.oh-my-zsh"

alias s="bin/rails s"
alias c="bin/rails c"
alias gen="bin/rails g"
alias r="bin/rake"
alias m="bin/rake db:migrate"
alias b="bin/bundle"

# set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# incomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/

plugins=(git brew bundler git-hubflow github rails rake ruby rvm sublime tmux go golang)

source $ZSH/oh-my-zsh.sh
[[ -f ~/.zshrc-local ]] && . ~/.zshrc-local
[[ -f ~/.localrc ]] && . ~/.localrc

export EDITOR=vim

# source z jump-list
. /usr/bin/z

export GOROOT=`go env GOROOT`
export GOPATH=~/golang
# export GOPATH=~/api4
export PATH=$PATH:$GOROOT/bin::$GOPATH/bin

alias -s go="go run"


export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/buddhamagnet/.boot2docker/certs/boot2docker-vm
