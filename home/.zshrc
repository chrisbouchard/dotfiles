# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Skip Oh-My-ZSH update prompt, since Homeshick will be handling updates.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

ZSH_THEME=candy

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  fzf
  gpg-agent
  homeshick
  mise
  ng
  npm
  pip
  vi-mode
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Oh-My-ZSH turns on history sharing by default, which means all shells update
# each-others histories (reverse search, up arrow, etc.). This is a bit
# obnoxious, so let's disable it again.
unsetopt share_history

# For 1Password Shell Plugins
# https://developer.1password.com/docs/cli/shell-plugins
if [[ -e $HOME/.config/op/plugins.sh ]]
then
    source $HOME/.config/op/plugins.sh
fi

# For Emacs EAT Package
if [[ -n $EAT_SHELL_INTEGRATION_DIR ]]
then 
    source $EAT_SHELL_INTEGRATION_DIR/zsh
fi

if [[ -e $HOME/.zshrc.local ]]
then
    source $HOME/.zshrc.local
fi

source-export() {
    [[ -f $1 ]] || exit 1

    setopt allexport
    source $1
    unsetopt allexport
}
