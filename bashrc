source ~/.bash/aliases
source ~/.bash/drupal
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/rails
source ~/.bash/ruby
source ~/.bash/thisgig

# configure prompt to show branch
PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;{PWD/#HOME/~}\007"'

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  
