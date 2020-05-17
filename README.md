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
pip install powerline-status
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
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
pip install powerline-status
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

Post Installation
---
```bash
cd ~/.vim/bundle/YouCompleteMe
python3 ./install.py --js-completer --go-completer
```
