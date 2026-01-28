# zsh config file

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgre --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ct='cat ~/Dropbox/github_token.txt | xclip -sel clip'

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_SAVE_NO_DUPS

CASE_SENSITIVE='false'
setopt MENU_COMPLETE
setopt no_list_ambiguous

# Use modern completion system
autoload -Uz compinit
compinit; _comp_options+=(globdots) # start autocomplete with hidden files= compatability

# Directory history
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

setopt auto_cd # cd just by typing directory

# git branch info in RPROMPT
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats '%F{9}%r%f %B%b'

precmd(){
    vcs_info
}

setopt prompt_subst # enable prompt substitution
PROMPT='%B%F{9}%n %~ %#%b%f '
RPROMPT=\$vcs_info_msg_0_ # git branch information

# user functions
trace(){
    curl -s -L -D - "$1" -o /dev/null -w '%{url_effective}' | grep -i "Location:"
}

s(){
    echo "Running the ${1} script..."
    if [[ $1 == aw || $1 == animate-wallpaper ]]
    then
        ~/Scripts/animate-wallpaper "${@:2}"
    else 
        ~/Scripts/"$1"
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# python virtual environment
export PATH="/opt/python/bin:$PATH"
