autoload colors && colors

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

export ZSH_THEME_GIT_PROMPT_PREFIX="("
export ZSH_THEME_GIT_PROMPT_SUFFIX=")"

set_prompt () {
    # Add virtualenv
    if [ -n "${VIRTUAL_ENV+x}" ]; then
        export RPROMPT='%{$fg[magenta]%}$(virtualenv_info)%{$reset_color%}'
    else
        export RPROMPT=""
    fi
   if [[ -n $SSH_CONNECTION ]]; then
        export PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )$ '
    else
        export PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg_bold[yellow]%}$(box_name)%{$reset_color%}%{$fg_bold[cyan]%}:${PWD/#$HOME/~}%{$reset_color%}%{$fg[blue]%}$(git_prompt_info)%{$reset_color%} %(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )$ '
    fi
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
