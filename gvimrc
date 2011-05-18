set guioptions-=T " hide toolbar
set lines=55 columns=100
set guifont=DejaVu\ Sans\ Mono:h13

colorscheme vividchalk

let hostfile=$HOME.'/.vim/gvimrc-'.hostname()

if filereadable(hostfile)	
  exe 'source ' . hostfile
endif