# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rick/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/rick/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/rick/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/rick/.fzf/shell/key-bindings.zsh"
