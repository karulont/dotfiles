#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias less='less -R'
export EDITOR=vim
PS1='\[\e[32m\][\u@\h \W]\[\e[m\]\$ '

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

[[ -f /usr/share/fzf/completion.bash ]] && \
    . /usr/share/fzf/completion.bash && \
    . /usr/share/fzf/key-bindings.bash

[ -f /usr/bin/rg ] &&
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}

_ctrlp_helper() {
    local file=$(fzf)
    if [ -e "$file" ]; then
        vim "$file"
    fi
}

bind -x '"\C-p": _ctrlp_helper;'
bind -x '"\C-n": (setsid i3-sensible-terminal </dev/null >/dev/null 2>/dev/null &);'

alias dotfiles='/usr/bin/git --git-dir=/home/karl/.dotfiles/ --work-tree=/home/karl'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000

function adoc() {
    PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin" \
    ADOC_TEMP=/home/karl/dokumendimallid/asciidoctor-pdf/resources \
    /home/karl/dokumendimallid/asciidoctor-pdf/adoc2pdf.sh $1
}
