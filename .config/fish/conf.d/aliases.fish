# general aliases
alias cls='clear'
alias quit='exit'
alias md='mkdir'
alias which='type'
alias que='whatis'
alias nul='/dev/null'
alias shutd='sudo shutdown 0'
alias m='man'

# apt aliases
alias install='sudo apt install'
alias uninstall='sudo apt remove'
alias aptup='sudo apt update'
alias fullupdate='sudo apt update && sudo apt full-upgrade'
alias aptfind='sudo apt update 1>/dev/null && apt-file search'

# ls aliases
alias ll='exa -lagh --git'
alias l='exa -aF'

# cd aliases
alias ..='cd ..'
alias cdc='cd ~; clear'

# Code
alias c='code -n .'
alias cr='code -r .'

# Net
alias trace='traceroute'
