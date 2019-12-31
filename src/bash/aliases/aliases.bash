#############
#  ALIASES  #
#############

###
# NAVIGATION
###

# many dots, so levels, wow
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Listing files
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'

# Replace previous aliases in case `exa` is installed
# See https://the.exa.website
if command -v exa >/dev/null 2>&1; then
    alias l="exa --git --color=automatic"
    alias ls="exa --git --color=automatic"
    alias ll="exa --all --long --git --color=automatic"
    alias la="exa --all --binary --group --header --long --git --color=automatic"
fi

# Shortcuts
alias b="firefox"
alias c="clear"
alias d="cd ~/Downloads"
alias e="vim"
alias g="git"
alias h="history"
alias p="cd ~/Documents/projects"
alias w="cd ~/Documents/work"


###
# BASICS
###

# Allow aliases to be with sudo
alias sudo="sudo "

# Ask if really, really sure to ..
alias cp='cp -vi' # .. copy
alias mv='mv -vi' # .. move
alias rm='rm -vI' # .. burn

# Copy & Paste file contents from the command-line
alias cpy='xclip -selection clipboard'
alias pst='xclip -selection clipboard -o'

# Copy public key to clipboard:
alias pubkey="cpy ~/.ssh/id_rsa.pub | echo '=> Public key copied to pasteboard.'"

# Human-readable disk commands
alias du='du -kh'
alias df='df -kTh'
alias dd='dd status=progress'
alias free='free -h --giga'

# Show processes
alias psa="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Show active IP addresses in home network
alias ipnet="nmap -sn 192.168.178.0/24"


###
# MISCELLANEOUS
###

# Lock the screen (when going AFK) - For locking the screen, use 'SUPER+L'
alias afk="sudo systemctl suspend"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Thinking of http://xkcd.com/530/ - Linux version @mathiasbynensalias
alias stfu="amixer -q sset Master 0%"
alias pumpitup="amixer -q sset Master 100%"

# List ten most popular commands
alias popular="history | awk '{CMD[\$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n10"


###
# SOFTWARE
###

alias bi="buildah images"
alias bc="buildah containers"
alias etcher="balena-etcher-electron"
alias dotbot="bash ~/.dotfiles/install.sh"


###
# HARDWARE
###

alias motherboard="dmidecode -t 2 | less"
alias cpu="dmidecode -t 4 | less"
alias memory="dmidecode -t 17 | less"
alias cdrom="wodim --devices"


###
# PYTHON
###

# Loads virtualenvwrapper + sets aliases if installed
if [ -f $PYTHONUSERBASE/bin/virtualenvwrapper.sh ]; then
    source $PYTHONUSERBASE/bin/virtualenvwrapper.sh

    # virtualenvwrapper aliases @bbengfort
    # See https://gist.github.com/bbengfort/246bc820e76b48f71df7
    alias venv="workon"
    alias venv.exit="deactivate"
    alias venv.ls="lsvirtualenv"
    alias venv.show="showvirtualenv"
    alias venv.init="mkvirtualenv"
    alias venv.rm="rmvirtualenv"
    alias venv.switch="workon"
    alias venv.add="add2virtualenv"
    alias venv.cd="cdproject"
    alias venv.cdsp="cdsitepackages"
    alias venv.cdenv="cdvirtualenv"
    alias venv.lssp="lssitepackages"
    alias venv.proj="mkproject"
    alias venv.setproj="setvirtualenvproject"
    alias venv.wipe="wipeenv"
fi


alias 75='7z a -r -t7z -m0=lzma2 -mx=9 -myx=9 -mqs=on -ms=on'