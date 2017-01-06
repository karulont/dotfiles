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

if [[ $TERM == xterm-termite ]]; then
    . /etc/profile.d/vte.sh
    __vte_prompt_command
fi

export PATH=$PATH:~/.local/bin
alias dotfiles='/usr/bin/git --git-dir=/home/karl/.dotfiles/ --work-tree=/home/karl'
