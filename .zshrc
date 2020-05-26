# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt no_share_history

autoload -Uz select-word-style
select-word-style shell
bindkey \^U backward-kill-line

export EDITOR=vim
export LESS="-F -X -R"

# Aliases
alias ll='ls -AlhF'
alias df='df -h'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias duh='du -hs $(ls -A) 2>&1 | grep -v "du: " | sort -h'

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls -F --color=auto'
    alias listen='netstat -tulnp'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -F -G'
    alias listen='lsof -i -n -P | grep LISTEN'
fi

alias ..='cd ..'
alias cdd='cd ~/Downloads/'

alias pht='python -m SimpleHTTPServer'
alias p8='ping 8.8.8.8'

function fp() {
    echo `pwd`/"$1"
}

function showcert() {
    if [ -f "$1" ]; then
        openssl x509 -text -noout -in $1
    else
        if [[ $1 =~ :[0-9]+$ ]]; then
            TARGET=$1
        else
            TARGET=$1:443
        fi
        true | openssl s_client -connect $TARGET | openssl x509 -text -noout
    fi
}

# Git shortcuts
if hash git 2>/dev/null; then
    git_rebase() {
        git rebase -i HEAD~$1
    }

    git_discard() {
        git checkout -- $1
    }
    alias gst='git status'
    alias gpp='git pull && git push'
    alias gcb='git checkout -b'
    alias gb='git branch'
    alias gc='git checkout'
    alias gl='git log'
    alias gca='git commit -a'
    alias gd=git_discard
    alias gda='git checkout -- .'
    alias gdf='git diff'
    alias grb=git_rebase
    alias gcam='git commit --amend'
fi

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Go
if hash go 2>/dev/null; then
    export GOPATH="$HOME/go"
    export PATH="$(go env GOPATH)/bin:$PATH"
fi

# NVM
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -f ~/.aliases ]; then . ~/.aliases; fi
if [ -f ~/.iterm2_shell_integration.zsh ]; then . ~/.iterm2_shell_integration.zsh; fi
