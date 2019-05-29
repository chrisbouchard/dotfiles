# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

path=(
  $HOME/bin
  $HOME/.local/sbin
  $HOME/.local/bin
  $HOME/.cabal/bin
  $HOME/.cargo/bin
  $HOME/.rbenv/bin
  $HOME/maude
  $path
)

export LANG=en_US.UTF-8

if [ $(umask) = '000' ]
then
    # Sometimes WSL doesn't set the umask correctly.
    umask 022
fi

# Sometimes WSL doesn't set the shell correctly. I don't see any reason not to
# set it explicitly.
export SHELL=$(which zsh)

export DISPLAY=${DISPLAY:-':0'}
export PAGER=$(which less)
export VISUAL=nvim
export EDITOR=$VISUAL

# Set JAVA_HOME if we can get it automatically from Java
if which javac &>/dev/null
then
    export JAVA_HOME=$(readlink -f $(which javac) | sed 's:/bin/javac$::')
fi

# If fd is installed, use it for fzf because it's faster than the built-in find command.
if which fd &>/dev/null
then
    export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git"
fi

# Preferred setup for nvim-gtk
export NVIM_GTK_NO_HEADERBAR=1
export NVIM_GTK_PREFER_DARK_THEME=1

