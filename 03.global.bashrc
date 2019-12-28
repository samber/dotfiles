# .bashrc

if [ ${SHELL} = "/bin/bash" ]; then
   if [ -f /etc/bashrc ]; then
        . /etc/bashrc
   fi
fi

##################################  GLOBAL  ##################################
#export savehist=5000
#export HISTSIZE=
#export HISTFILESIZE=
export EDITOR='emacs -nw'
export PAGER=less
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export ENV=dev
export PATH=$PATH:/usr/local/src/bin:/usr/local/sbin:/usr/local/opt/ruby/bin

# bash:
#set show-all-if-ambiguous on
#set show-all-if-unmodified on
#set completion-ignore-case on
#set colored-stats on
#shopt -s dotglob

LANG=en_US.UTF-8
LANGUAGE=en_US:en
LC_MESSAGES="C"
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC=en_US.UTF-8
LC_TIME=en_US.UTF-8
LC_COLLATE="en_US.UTF-8"
LC_MONETARY=en_US.UTF-8
LC_MESSAGES="en_US.UTF-8"
LC_PAPER=en_US.UTF-8
LC_NAME=en_US.UTF-8
LC_ADDRESS=en_US.UTF-8
LC_TELEPHONE=en_US.UTF-8
LC_MEASUREMENT=en_US.UTF-8
LC_IDENTIFICATION=en_US.UTF-8
LC_ALL=
