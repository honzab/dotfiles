export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
export PATH="./bin:/usr/local/bin:/usr/local/sbin:$HOME/.sfs:$ZSH/bin:$PATH"

# Add gnu-sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

if [ -d "/usr/local/texlive/2013/bin/x86_64-darwin" ]; then
    PATH="/usr/local/texlive/2013/bin/x86_64-darwin:$PATH"
fi

if ! [[ -n $SSH_CONNECTION ]]; then
    # Add local settings
    export PATH=/usr/local/bin:${PATH} # Homebrew
    # export PATH=${PATH}:/usr/local/share/python # for pip executables
    export WORKON_HOME=${HOME}/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=$(brew --prefix)/bin/python

    # Less hackery
    export LESS=-JMQRSi
    export PAGER="less $LESS"

    # Go path
    export GOPATH=${HOME}/Go
    export PATH=${PATH}:${GOPATH}/bin
fi
