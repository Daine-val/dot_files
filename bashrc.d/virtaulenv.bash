#-- Virtualenvwrapper config -------------------------------------------------#
virtualenvwrapper=$(which virtualenvwrapper.sh)

if [ -n "${virtualenvwrapper}" ]; then
    export WORKON_HOME="$HOME/.virtualenvs"
    export PROJECT_HOME="$HOME/src/python"
    source $virtualenvwrapper
fi

