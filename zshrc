# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

alias getj="curl -Lo- https://bit.ly/janus-bootstrap | bash"
alias geto="curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh"
alias getr="curl -L https://get.rvm.io | bash -s stable"
alias geth="curl http://defunkt.io/hub/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub"
alias zconf="vim ~/.zshrc"
alias ohmy="vim ~/.oh-my-zsh"
alias upj="export JRUBY_OPTS=--1.9"

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

plugins=(gem git bundler brew github heroku yum)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export RI="--format ansi --width 70"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin:/Users/buddhamagnet/.rvm/gems/ruby-1.9.2-p290@rails3tutorial/bin:/Users/buddhamagnet/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/buddhamagnet/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/buddhamagnet/.rvm/bin:~/bin:~/.bin:/usr/local/homebrew/bin:/usr/local/sbin

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"