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
    # Vim mode
    VIM_NORMAL="%{$fg_bold[yellow]%}(N)%{$reset_color%}"
    VIM_INSERT="%{$fg_bold[cyan]%}(I)%{$reset_color%}"
    if [[ ! -n $KEYMAP ]]; then
        VIM_PROMPT="${VIM_INSERT}"
    else
        VIM_PROMPT="${${KEYMAP/(vicmd|opp)/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    fi
    # Add virtualenv
    if [ -n "${VIRTUAL_ENV+x}" ]; then
        export RPROMPT='%{$fg[magenta]%}$(virtualenv_info)%{$reset_color%}'
    else
        export RPROMPT=""
    fi
    export PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg_bold[yellow]%}$(box_name)%{$reset_color%}%{$fg_bold[cyan]%}:${PWD/#$HOME/~}%{$reset_color%}%{$fg[blue]%}$(git_prompt_info)%{$reset_color%} %(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )${VIM_PROMPT} $ '

}

function zle-line-init zle-keymap-select {
    set_prompt
    zle reset-prompt
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}

bindkey -v

bindkey '\e.' insert-last-word
# bindkey -m viins '\e.' insert-last-word

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=10
