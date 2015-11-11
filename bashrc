#-- If not running interactively, don't do anything --------------------------#
[ -z "$PS1" ] && return


#-- Use Vim ------------------------------------------------------------------#
export VISUAL=vim
export EDITOR="$VISUAL"


#-- History file -------------------------------------------------------------#
HISTSIZE=1000
HISTFILESIZE=2000

# No duplicate lines or lines starting with space
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend


#-- Window Settings ----------------------------------------------------------#
# Check the window size after each command and, if necessary, update the
# values of LINES and COLUMNS.
shopt -s checkwinsize

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi


#-- Useful Settings ----------------------------------------------------------#
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable tab completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#-- Alias definitions --------------------------------------------------------#
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#-- Prompt Settings ----------------------------------------------------------#
# set variable identifying the chroot you work in
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;33m\]\W \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W \$ '
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac


#-- Virtualenvwrapper config -------------------------------------------------#
if [ -f  /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME="$HOME/.virtualenvs"
    export PROJECT_HOME="$HOME/src/python"
    source /usr/local/bin/virtualenvwrapper.sh
fi
