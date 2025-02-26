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

# # Asdf hasn't been hooked up yet, so this will be the system Python
# ZSH_POWERLINE_PYTHON="$(which python3)"
#
# ZSH_POWERLINE_ADDITIONAL_PACKAGES=(
#     powerline-gitstatus
#     powerline-inject
#     powerline-pyenv
# )

ZSH_THEME=candy

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # Autocompletion
  pip
  ng
  npm
  # Functional
  asdf
  bd
  direnv
  gpg-agent
  homeshick
  fzf
  tmux
  vi-mode
  zsh-syntax-highlighting
)

# alias homesick="homeshick"

source $ZSH/oh-my-zsh.sh

# Oh-My-ZSH turns on history sharing by default, which means all shells update
# each-others histories (reverse search, up arrow, etc.). This is a bit
# obnoxious, so let's disable it again.
unsetopt share_history

source-export() {
    [[ -f $1 ]] || exit 1

    set -a
    source $1
    set +a
}

# For SeatGeek's letsgo
# TODO: Move to an OMZ plugin?
if [[ -x $HOME/.letsgo/bin/letsgo ]]
then
    source $HOME/.letsgo/config/shell/zsh/setup.completion.sh
fi

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
