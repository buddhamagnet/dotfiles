mkdir .tmp
hg clone https://bitbucket.org/ns9tks/vim-l9/ .tmp
hg update .tmp
rm -R .tmp/.hg
mv .tmp/* .
rm -R .tmp
hg add *
