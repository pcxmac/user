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
#export PATH=$HOME/.powerline/scripts:$HOME/.gem/ruby/2.1.0/bin:$PATH
export PATH=/usr/games/bin:$PATH

#export SHELL=/usr/bin/bash ## ARCH
#export SHELL=/bin/bash	## GENTOO

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

################################################ BINDKEYS ################################

bind '"\eOD"':backward-word
bind '"\eOd"':backward-word
bind '"\eOC"':forward-word
bind '"\eOc"':forward-word

set -o emacs                          # Set emacs mode in bash (see below)


# POWERLINE ###################################################################


    # AUTOMATED INSTALL
    powerlinestatus="$(pip freeze 2>/dev/null | grep 'powerline-status')"
    if [ -z "$powerlinestatus" ]
    then
        pip install --user $USER git+git://github.com/powerline/powerline
    fi

    # AUTOMATED UPGRADE (10 days)
    updateWhen=10
    revDate="$(date -d "$(ls -ail $HOME/.local/bin/powerline | awk '{print $7" "$8}')" +%s)"
    thisDate="$(date -d now +%s)"
    diffDate="$(( ($thisDate - $revDate) / 86400))"
    if [ $diffDate -gt $updateWhen ]
    then
        pip install --user $USER git+git://github.com/powerline/powerline   --upgrade
    fi

    # !!! get python version/location ...

    # export powerline bin and bind zsh
    export PATH=~/.local/bin:$PATH
    . ~/.local/lib64/python2.7/site-packages/powerline/bindings/bash/powerline.sh

    # utilize powerline-daemon for quicker responses from powerline
    powerline-daemon -q




############################################# FUZZY FINDER ################################

#source ~/.fzf.bash

#fh() { 
#	eval $(history | fzf +s | sed 's/ *[0-9]* *//') 
#}
#fp() { 
#	ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}; 
#}
#fd() { 
#	DIR=$(find ${1:-*} ${1:-.??*} | fzf) && cd "$DIR"; 
#}

#bind '"\C-F":"fh\n"'    # fzf history
#bind '"\C-T":"fp\n"'    # fzf process
#bind '"\C-E":"fd\n"'    # fzf directory

###################################### GEN (UNTRACKED/CUSTOM) DOT FILES ##############################

#if [[ ! -c $HOME/.tmux.conf ]]
#then
#	touch $HOME/.tmux.conf
#	echo "source '$HOME/.powerline/powerline/bindings/tmux/powerline.conf'" >> $HOME/.tmux.conf
#	echo "set -g default-terminal \"screen-256color\"" >> $HOME/.tmux.conf
#fi

##################################### GIT SETTINGS ###################################################
#
# git config --global user.email "name@host"
# git config --global user.name "name"

# git config --global core.editor "vim"

# git config --global push.default "simple"

# git config --global color.branch auto
# git config --global color.diff auto
# git config --global color.interactive auto
# git config --global color.status auto


