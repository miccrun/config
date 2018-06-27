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

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Go
if hash go 2>/dev/null; then
    export GOPATH="$HOME/go"
    export PATH="$(go env GOPATH)/bin:$PATH"
fi

# Powerline
if hash powerline-daemon 2>/dev/null; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

# NVM
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
