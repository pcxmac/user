################################### SHELL #############################

alias revdep-rebuild="sudo revdep-rebuild"
alias ez_install="python setup.py install --user"
alias pcitree="lspci -tv"
alias usbtree="lsusb -tv"
alias smarctl="smarctl --all"
alias lsblk="lsblk -o name,mountpoint,label,size,uuid"
alias win7="/var/lib/virt/images/MICROSOFT/WINDOWS/WIN-7/run-spice&;/var/lib/virt/images/MICROSOFT/WINDOWS/WIN-7/spice-client;"
alias build="cd /usr/src/linux;make clean;make menuconfig;make -j6 && make modules_install;make install;genkernel --install initramfs;grub2-mkconfig -o /boot/grub/grub.cfg;emerge nvidia-drivers broadcom-sta spl zfs-kmod zfs;"
alias gitclean="git clean -ffdx"
alias bbalance="sudo btrfs balance start -v"
alias eselect="sudo eselect"
alias lsusb="sudo lsusb -v"
alias lspci="sudo lspci -vvvknnD"
alias demerge="sudo emerge -cav"
alias emerge="sudo emerge --ask"
alias eclean="sudo emerge -av --depclean --ask"
alias eupdate="sudo emerge -uDN --with-bdeps=y @world --ask --verbose"
alias esync="sudo emerge --sync --verbose"
alias gputemp="nvidia-settings -q gpucoretemp -t"
alias atigputemp="watch -n4 /opt/bin/aticonfig --adapter=all --odgt --odgc"
alias gitlog="git log --pretty=format:'%h - %an, %ar : %s'"
alias scan="clamscan -r --bell -i"
alias pingsub="nmap -sL 10.1.1.0/24 | grep '('"
alias upgrade="yaourt -Syua --noconfirm"
alias ls="ls -pht --color=auto --ignore='lost+found'"
alias copycheck="rsync -a --checksum --verbose"
alias copynew="rsync -au --verbose"
alias copyig="rsync -a --ignore-existing --verbose"
alias snapr="sudo btrfs subvolume snapshot -r"
alias snap="sudo btrfs subvolume snapshot"
alias ddd="dd if=/dev/zero bs=1G"
alias pkgs-local=""
alias pkgs-official=""
alias entropy="cat /proc/sys/kernel/random/entropy_avail"
alias rcp="rsync --checksum -v -r -l -H -p"
alias pigc="pigz --best"
alias pigd="pigz -d"
alias temp="sensors;aticonfig --odgt"
alias atitemp="aticonfig --odgt"
alias blist="btrfs subvolume list"
alias bdf="btrfs filesystem df"
alias pacclean="yaourt -Qdt;yaourt Scc;"
alias pacremove="yaourt -Rdd"
alias bdel="btrfs subvolume delete"
alias grep="grep --color"

alias df="df -Th"
alias du="du -s --block-size=1M"
alias update-deb="sudo apt-get update;sudo apt-get upgrade -y;sudo apt-get dist-upgrade -y; sudo apt-get autoremove -y;sudo apt-get clean -y"


#copying to multiple directories = echo dir* | xargs -n 1 cp file


#bindkey -M viins '\C-i' complete-word
#bindkey -M viins

bindkey -v # vi-mode/keymap
#bindkey -e # emacs-mode/keymap

bindkey -r '^Q'
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^B' backward-char
bindkey -M viins '^D' delete-char-or-list
bindkey -M viins '^E' end-of-line
bindkey -M viins '^F' forward-char
bindkey -M viins '^K' kill-line
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward
bindkey -M viins '^T' transpose-chars
bindkey -M viins '^Y' yank
bindkey -M emacs '^X^[' vi-cmd-mode

bindkey -M viins '^[[3^' delete-word
bindkey -M viins '^[[3~' delete-char

bindkey -M viins '^[[5^' end-of-line
bindkey -M viins '^[[6^' beginning-of-line


#rxvt
bindkey -M viins '^[OD' backward-word
bindkey -M viins '^[Od' backward-word
bindkey -M viins '^[OC' forward-word
bindkey -M viins '^[Oc' forward-word

bindkey -M viins '^[Oa' history-search-backward
bindkey -M viins '^[[a' history-search-backward
bindkey -M viins '^[Ob' history-search-forward
bindkey -M viins '^[[b' history-search-forward



#tmux
bindkey -M viins '^[[1;5d' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M viins '^[[1;5c' forward-word
bindkey -M viins '^[[1;5C' forward-word

bindkey -M viins '^[OA' history-search-backward
bindkey -M viins '^[OB' history-search-forward



bindkey -M viins '^H' backward-kill-word
bindkey -M viins '^[' kill-word

bindkey -M emacs ' ' magic-space
bindkey -M viins ' ' magic-space

bindkey -M isearch '^J' accept-search 2>/dev/null

autoload -U compinit promptinit zcalc zsh-mime-setup select-word-style
select-word-style shell

compinit
promptinit
zsh-mime-setup

# shell processes longer than 3 minutes get output stats
REPORTTIME=3

setopt interactivecomments
setopt hist_ignore_all_dups
setopt auto_cd
setopt extendedglob
setopt glob_complete
setopt pushd_minus
setopt pushd_silent
setopt pushd_to_home
setopt pushd_ignore_dups
setopt RM_STAR_WAIT
setopt ZLE
setopt NO_HUP
setopt ignore_eof
setopt no_flow_control
setopt no_beep
setopt no_clobber
setopt no_case_glob
setopt numeric_glob_sort
setopt rc_expand_param

setopt cd_able_vars
#setopt correct
setopt complete_in_word
setopt notify
setopt c_bases
setopt bash_auto_list
setopt chase_links
setopt auto_pushd
setopt multios
setopt magic_equal_subst
setopt auto_name_dirs

################################################ PROMPT ####################################

export PS1="[%n@%m %1~]$ "


#################################### ENV ##############################

export LANG=en_US.UTF-8	# ssh
export USER=$(/usr/bin/whoami) # powerline, continuity
export SHELL=/bin/zsh # continuity
export EDITOR=vim # continuity

export PATH=/bin:/sbin:/opt/bin
export PATH=$PATH:/usr/games/bin
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/bin/core_perl:$PATH

export PATH=$HOME/.local/bin:$PATH


##################################### HISTORY #########################

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

export HISTFILE=~/.zhistfile
export HISTSIZE=20000
export SAVEHIST=$HISTSIZE

################################## COMPLETION #########################

#yaourt completion
#fpath=(~/.zsh/functions $fpath)

setopt completealiases
setopt completeinword
setopt menucomplete

#COMPLETION

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete
#zstyle ':completion:*' completer _expand _force_rehash _complete _approximate _ignored

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:default' menu 'select=0'
zstyle ':completion:*' file-sort modification reverse
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

unsetopt LIST_AMBIGUOUS
setopt COMPLETE_IN_WORD

zstyle ':completion:*:manuals' separate-sections true
#zstyle ':completion:*' list-separator 'fREW'
zstyle ':completion:*:windows' menu on=0
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) )'
zstyle ':completion:*:corrections' format '%B%d (errors %e)%b'
zstyle ':completion::*:(rm|vi):*' ignore-line true
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::approximate*:*' prefix-needed false
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

############################ MISC #########################################################

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
	. ~/.local/lib64/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

	# utilize powerline-daemon for quicker responses from powerline
	powerline-daemon -q



############################### FUZZY FINDER ##################################

#source ~/.fzf.zsh

#fzf_history() { zle -I; eval $(history 1 | fzf +s | sed 's/ *[0-9]* *//') ; };
#fzf_killps() { zle -I; ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9} ; };
#fzf_cd() { zle -I; DIR=$(find ${1:-*} ${1:-.??*} | fzf) && cd "$DIR" ; };

#zle -N fzf_history;
#bindkey '^F' fzf_history
#zle -N fzf_killps;
#bindkey '^Q' fzf_killps
#zle -N fzf_cd;
#bindkey '^E' fzf_cd

###################################### GEN (UNTRACKED/CUSTOM) DOT FILES ##############################

#if [[ ! -c $HOME/.tmux.conf ]]
#then
#        touch $HOME/.tmux.conf
#        echo "source '$HOME/.powerline/powerline/bindings/tmux/powerline.conf'" >> $HOME/.tmux.conf
#        echo "set -g default-terminal \"screen-256color\"" >> $HOME/.tmux.conf
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


# ZSH-SYNTAX-HIGHLIGHTING #######################################################

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# zsh-history-substring-search ##################################################

source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


# Setup zsh-autosuggestions #####################################################

source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)

bindkey '^T' autosuggest-toggle


