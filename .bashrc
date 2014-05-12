#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

############################################## ENV ########################################

export LANG=en_US.UTF-8
export USER=$(/usr/bin/whoami)
export PATH=/bin:/sbin
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/bin/core_perl:$PATH
export PATH=$HOME/.powerline/scripts:$HOME/.gem/ruby/2.1.0/bin:$PATH

export SHELL=/usr/bin/bash
export EDITOR=vim

############################################### SHELL #####################################

alias ls='ls --color=auto'
alias df='df -Th'
alias du='du -h'
alias update-deb="sudo apt-get update;sudo apt-get upgrade -y;sudo apt-get dist-upgrade -y; sudo apt-get autoremove -y;sudo apt-get clean -y"

PS1='[\u@\h \W]\$ '

############################################### HISTORY ###################################

export HISTFILE=~/.bash_histfile
HISTSIZE=65536
shopt -s histappend
PROMPT_COMMAND='history -a'

################################################ POWERLINE ################################

export POWERLINE_COMMAND="powerline"
export _POWERLINE_DEFAULT_MODE="emacs"
export _POWERLINE_MODE="emacs"

# POWERLINE-DAEMON REQUIRED

#export POWERLINE_COMMAND=powerline-client

#if [[ "$(ps aux | grep $USER | grep "powerline-daemon" | grep -v "grep" | wc -l)" == 0 ]]
#then
#        ~/.powerline/scripts/powerline-daemon;
#fi

# POWERLINE REQUIRED

if [[ ! $PATH == *".powerline/scripts"* ]]
then
        export PATH=~/.powerline/scripts:$PATH
fi

. ~/.powerline/powerline/bindings/bash/powerline.sh

############################################# FUZZY FINDER ################################

source ~/.fzf.bash

fh() { 
	eval $(history | fzf +s | sed 's/ *[0-9]* *//') 
}
fp() { 
	ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}; 
}
fd() { 
	DIR=$(find ${1:-*} ${1:-.??*} | fzf) && cd "$DIR"; 
}

bind '"\C-F":"fh\n"'    # fzf history
bind '"\C-T":"fp\n"'    # fzf process
bind '"\C-E":"fd\n"'    # fzf directory

###################################### GEN (UNTRACKED/CUSTOM) DOT FILES ##############################

#if [[ ! -c $HOME/.tmux.conf ]]
#then
#	touch $HOME/.tmux.conf
#	echo "source '$HOME/.powerline/powerline/bindings/tmux/powerline.conf'" >> $HOME/.tmux.conf
#	echo "set -g default-terminal \"screen-256color\"" >> $HOME/.tmux.conf
#fi
