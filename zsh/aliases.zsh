alias reload!='. ~/.zshrc'
alias cds='source `which virtualenvwrapper_lazy.sh` && workon spotify && cd ~/Work/Spotify/Code/payments'
alias vi='vim'
alias gpom='git pull --rebase origin master'
alias gpum='git pull upstream master'
alias :q='exit'

alias yirc='vim ~"/Documents/LimeChat Transcripts/#payment-dev/$(date -v -1d +"%Y-%m-%d")"*.txt'
alias greppy='grep --include "*.py" -R'

# alias glnice='git log --pretty="%C(auto)%h;%Cblue%ae;%Creset%s;%ai"'
alias spm='npm --registry http://npm-registry.spotify.net --userconfig ~/.spmrc --always-auth=true'
