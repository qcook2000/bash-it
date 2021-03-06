cite about-alias
about-alias 'general aliases'

# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

alias _="sudo"

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=auto"
fi
which gshuf &> /dev/null
if [ $? -eq 1 ]
then
  alias shuf=gshuf
fi

alias c='clear'
alias k='clear'
alias cls='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias q='exit'

alias irc="$IRC_CLIENT"

alias rb='ruby'

alias updateme='sh ~/.bash_it/update-me.sh'
alias updateprofile='sh ~/.bash_it/silent-install.sh && source ~/.bash_profile'

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

# Shell History
alias h='history'

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Directory
alias	md='mkdir -p'
alias	rd='rmdir'

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


sshq() {
  ssh -t -A $1 'bash <(curl -s https://raw.github.com/qcook2000/bash-it/master/silent-install.sh) && source ~/.bash_profile' && ssh -A $1
}

alias spm="npm -reg http://npm-registry.spotify.net -userconfig ~/.spmrc --always-auth=true"
