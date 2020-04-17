# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



####################################################################33
##CLARKS CUSTOM ALIASES
#####################################################################3333333
alias aliasreset='source ~/.bashrc; echo re- source ~/.bashrc'
alias aliasedit='vim ~/.bashrc'



alias apachereset='sudo service apache2 restart; echo apache has been restarted'
alias mysqlstart='echo entering mysql as root;  mysql -u root -p'

alias cw='cd /var/www/html/'
alias cs='cd /home/clark/Gitrepos;'
alias webdev='pwd; echo teleport to webdev directory; cd /var/www/html/;'

alias rpi2='echo ssh into rpi2 attempt; ssh pi@192.168.1.249;'
alias rpi3='echo ssh into rpi3 attempt to the pi wifi; ssh pi@192.168.1.251;'
alias cpu='echo ssh into PC; ssh clark@192.168.1.248;'
alias spotify='spotify &'
alias eagle='/home/clark/eagle/eagle-9.3.0/eagle &'
alias ae='aliasedit'
alias aa='aliasreset'

alias gs='git status'
alias gl='git lg'


alias ge='vim ~/.gitconfig'

 

#SUBMODULES
#use this if you cloned a repo and need to pull the immediate submopdules
alias gsui='git submodule update --init'
#use this whenever you pull a repo that has submodules!
alias gsu='git submodule update'
alias gss='git submodule status'
#use "git rm --cached <thing" to clear the weird sourctree errors
#use "git submodule add"

alias re='cp ~/Gitrepos/godrus/* /var/www/html/; cp ~/Gitrepos/godrus/img/* /var/www/html/img/'
alias utor='utserver -settingspath /opt/utorrent-server-alpha-v3_3/'
# utorrent webgui: http://192.168.1.248:8080/gui/web/index.html
# login as user:admin password:<blank>

alias ptor='ps | grep utserver'
alias utornum="ps| grep utserver | awk '{print$1}' "
#to kill use: kill -9 <PID> or kill all as below
alias utorkill='killall -9 utserver' 

# Webdev
alias lg='tail /var/log/php_errors'
alias pe='sudo vim /etc/php/7.0/apache2/php.ini'
######################################################################
##END FILE
######################################################################
