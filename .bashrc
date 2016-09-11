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
#export PATH=$HOME/.gem/ruby/2.1.0/bin:$PATH
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

# PYTHON ######################################################################

export PYTHONPATH=~/.local/lib64/python2.7/site-packages

# POWERLINE ###################################################################


    # installed ? (if not) then install
        # git clone
        if [ ! -d ~/.powerline ]
        then
            git clone https://github.com/powerline/powerline.git .powerline

        fi

        if [ ! -d ~/.local/lib64/python2.7/site-packages ]
        then
            mkdir -p ~/.local/lib64/python2.7/site-packages
            # link .powerline/powerline to .local/lib64/python2.7/sites-packages/powerline
            ln -s ~/.powerline/powerline ~/.local/lib64/python2.7/site-packages/powerline
        fi



    PATH=~/.powerline/scripts:$PATH

    # export powerline bin and bind zsh
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



# https://robinwinslow.uk/2012/07/20/tmux-and-ssh-auto-login-with-ssh-agent-finally/ (MODIFIED...)

# TMUX ON SSH CONNECTIONS

# get parent process ... if not sshd, then don't bother with joining tmux session...

ppid="$(ps -p $$ -o ppid=)"
ppid="${ppid// /}"
pcom=$(ps -p $ppid -o command=)

#echo "pcom = $pcom"

if [ -z "$TMUX" ] && [[ $pcom == sshd* ]]; then

    # we're not in a tmux session
    if [ ! -z "$SSH_TTY" ]; then
        # We logged in via SSH

        # if ssh auth variable is missing
        if [ -z "$SSH_AUTH_SOCK" ]; then
            export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"
        fi

        # if socket is available create the new auth session
        if [ ! -S "$SSH_AUTH_SOCK" ]; then
            `ssh-agent -a $SSH_AUTH_SOCK` > /dev/null >&1
            echo $SSH_AGENT_PID &gt; $HOME/.ssh/.auth_pid
        fi

        # if agent isn't defined, recreate it from pid file
        if [ -z $SSH_AGENT_PID ]; then
            export SSH_AGENT_PID=`cat $HOME/.ssh/.auth_pid 2>/dev/null`
        fi

        # Add all default keys to ssh auth
        ssh-add 2>/dev/null

        # start tmux
        tmux attach 2>/dev/null
    fi
fi


