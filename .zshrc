# zsh config file

# aliases
## Detect which `ls` flavor is in use
## from https://github.com/mathiasbynens/dotfiles/blob/main/.aliases
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'     # colors from https://geoff.greer.fm/lscolors/
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='exfxcxdxbxegedabagacad'																	# colors from https://geoff.greer.fm/lscolors/
fi


alias la="ls -Al ${colorflag}" 				                 # show hidden files
alias lk="ls -lSr ${colorflag}"             				 # sort by size
alias lc="ls -lcr ${colorflag}" 				             # sort by change time
alias lu="ls -lur ${colorflag}"             				 # sort by access time
alias lr="ls -lR ${colorflag}"              				 # recursive ls
alias lt="ls -ltr ${colorflag}"   					         # sort by date
alias lm="ls -al ${colorflag}|more"     				     # pipe through more
alias l1="ls -1 ${colorflag}"           				     # one-col file list
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"	 # list only directories

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
