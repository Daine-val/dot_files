#-- Enable color support of ls and greps -------------------------------------#
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#-- ls aliases ---------------------------------------------------------------#
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -A'
alias llh='ls -lGh'
