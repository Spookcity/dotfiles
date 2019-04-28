# (cat $HOME/.config/wpg/sequences &)

# PATHS
[ -f ~/.oh-my-zsh/custom/exports ] && source ~/.oh-my-zsh/custom/exports
[ -f ~/.oh-my-zsh/custom/aliases ] && source ~/.oh-my-zsh/custom/aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path to your oh-my-zsh installation.
export ZSH=/home/rick/.oh-my-zsh
export LC_ALL=en_US.UTF-8

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='\uf0da'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time battery)
POWERLEVEL9K_DIR_HOME_BACKGROUND='cyan'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='green'
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_DIR_ETC_BACKGROUND='cyan'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='005'
VCS_GIT_ICON=''
POWERLEVEL9K_TIME_BACKGROUND='013'
#POWERLEVEL9K_TIME_FOREGROUND='000'
# POWERLEVEL9K_COLOR_SCHEME='light'
# Advanced `vcs` color customization
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='green'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

#ZSH_THEME="spaceship"
SPACESHIP_DIR_COLOR=cian
SPACESHIP_VENV_SHOW=true
SPACESHIP_BATTERY_SHOW=true
#SPACESHIP_TIME_PREFIX="at "
#SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=blue

# Config history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

# cd
setopt AUTO_CD

# completion
setopt AUTO_LIST
setopt AUTO_MENU

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# COLORS
eval $(dircolors -b $HOME/.dircolors/dircolors.256dark)

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(
    z
    zsh-autosuggestions
    zsh-completions
    git-open
    web-search
    zsh-syntax-highlighting
    #history-substring-search
    fzf
    sublime
    )

autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# Other
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source "/usr/bin/virtualenvwrapper.sh"

# substring search keys
#bindkey '^[[D' history-substring-search-up
#bindkey '^[[C' history-substring-search-down
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down


