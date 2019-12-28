# .bashrc

alias grep='2> /dev/null grep --color -i -n -I --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules}'
alias df='df -h'
alias du='du -hd1'
alias free='free -h'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias ........='cd ../../../..'
alias ls='ls -h'
alias l='ll'
alias ll='ls -lsh'
alias la='ls -a'
alias lla='ll -a'
alias lal='lla'
alias dmesg="dmesg -T -w"   # human readable time + follow (-w)
#alias ls='ls -v --group-directories-first'
alias cp='cp -p'
#alias tar='tar --same-owner --same-permissions'
alias tree='tree -Cfi'
alias j='jobs'
alias h='htop'
alias f='fg'
alias got="git" # fucking keyboard
alias emacs='/usr/local/bin/emacs -nw'
alias ne='emacs'
#alias gimp='/Applications/GIMP.app/Contents/MacOS/GIMP-bin'
#alias ls='ls --color'
alias ping="ping -c 9999999"  # overrides systemadmin oh-my-zsh plugin
alias power="system_profiler SPPowerDataType"

#alias sound='tput bel'

alias sudo='sudo '              # http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias service='sudo service'
alias yum='sudo yum'
alias htop='sudo htop'
alias openvpn='sudo openvpn'

#alias vsts='docker run -it --rm microsoft/vsts-cli:0.1.0'

# root :
#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'
