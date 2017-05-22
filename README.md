My *nix Configuration
======

Git Protocol
---
For read and write
```bash
git init
git remote add origin git@github.com:micbase/config.git
git fetch
git checkout --track -b master origin/master
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```


HTTPS Protocol
---
Read only
```bash
git init
git remote add origin https://github.com/micbase/config.git
git fetch
git checkout --track -b master origin/master
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
