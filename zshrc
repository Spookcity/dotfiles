# PATHS
[ -f ~/.oh-my-zsh/custom/exports ] && source ~/.oh-my-zsh/custom/exports
[ -f ~/.oh-my-zsh/custom/aliases ] && source ~/.oh-my-zsh/custom/aliases

# Path to your oh-my-zsh installation.
  export ZSH=/home/rick/.oh-my-zsh

# Theme
POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_SHORTEN_DIR_LENGTH="1"
#POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Config history
setopt SHARE_HISTORY 
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS 

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# keybindings
bindkey -e                      # emacs keybindings
bindkey '\e[1;5C' forward-word            # C-Right
bindkey '\e[1;5D' backward-word           # C-Left
bindkey '\e[2~'   overwrite-mode          # Insert
bindkey '^A'      beginning-of-line       # Home

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

autoload -U compinit && compinit
# Other

source $ZSH/oh-my-zsh.sh
source /usr/bin/virtualenvwrapper.sh


# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export CC=${CROSS_COMPILE}/usr/bin/gcc
export CXX=${CROSS_COMPILE}/usr/bin/g++

# ssh
# export SSH_KEY_PATH="~/.ssh/id_rsa"
