

##
# DEPRECATED BASH
##

#COLOR_DEFAULT="\[\033[00m\]"
#COLOR_GREEN="\[\033[1;32m\]"
#COLOR_YELLOW="\[\033[0;33m\]"
#COLOR_RED="\[\033[1;31m\]"
#COLOR_BLUE_DARK="\[\033[0;34m\]"
#COLOR_BLUE_LIGHT="\[\033[1;34m\]"
#
#if [ "$HOME" = "/root" ]; then
#    PROMPT_COLOR="$COLOR_RED"              # root (local/distant)
#elif [ -n "${SSH_CONNECTION}" ]; then
#    PROMPT_COLOR="$COLOR_GREEN"            # ssh/distant
#else
#    PROMPT_COLOR="$COLOR_YELLOW"           # local
#fi
#
#if [ "$SHELL" != "/bin/zsh" ]; then
#    export PS1="$PROMPT_COLOR(\u@\h \!) $COLOR_BLUE_DARK[\W] $COLOR_BLUE_LIGHT- $ $COLOR_DEFAULT"
#fi
