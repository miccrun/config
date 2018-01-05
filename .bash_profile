export EDITOR=vim

alias ll='ls -alhF'
alias df='df -h'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias du='du -c -h'
alias duh='du -h -d 1'

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls -F --color=auto'
    alias listen='netstat -tulnp'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -F -G'
    alias listen='lsof -i -n -P | grep LISTEN'
fi

#Git shortcuts
git_rebase() {
    git rebase -i HEAD~$1
}
alias gst='git status'
alias gpp='git pull && git push'
alias gcb='git checkout -b'
alias gb='git branch'
alias gc='git checkout'
alias gl='git log'
alias gca='git commit -a'
alias gda='git checkout -- .'
alias gdf='git diff'
alias grb=git_rebase

alias ..='cd ..'
alias cdd='cd ~/Downloads/'

alias pht='python -m SimpleHTTPServer'
alias p8='ping 8.8.8.8'

function fp() {
    echo `pwd`/"$1"
}

export PATH="$HOME/.vim/bundle/powerline/scripts:/usr/local/bin:/usr/local/sbin:$(go env GOPATH)/bin:$PATH"

# Go
export GOPATH="$HOME/go"

# Powerline
. ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
