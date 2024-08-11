# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
####################################################################33
##CLARKS CUSTOM ALIASES
#####################################################################3333333

alias ae="vim ~/.bashrc"
alias aa="source ~/.bashrc"
alias ge='vim ~/.gitconfig'

#Git stuff
alias gs='git status'
alias gl='git lg'
alias gcm="git commit -m "
alias gps="git push"
alias gba="git branch --all"
alias gco="git checkout --track "


 

#SUBMODULES
#use this if you cloned a repo and need to pull the immediate submopdules
alias gsui='git submodule update --init'
#use this whenever you pull a repo that has submodules!
alias gsu='git submodule update'
alias gss='git submodule status'
#use "git submodule add"

######################################################################
##END FILE
######################################################################
