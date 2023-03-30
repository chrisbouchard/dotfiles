# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Work-around until GNOME stops overriding $PATH
if ! [[ $PATH = *$HOME/.local/bin* ]] then
    source $HOME/.config/environment.d/10-path.conf
fi

fpath=(
    # Add homeshick's completions to the function path
    $HOME/.homesick/repos/homeshick/completions
    $fpath
)

if [[ -d /opt/homebrew ]]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# For SeatGeek's letsgo
if [[ -x $HOME/.letsgo/bin/letsgo ]]
then
    source $HOME/.letsgo/config/shell/zsh/setup.environment.sh
fi

# export LANG=en_US.UTF-8

if [ $(umask) = '000' ]
then
    # Sometimes WSL doesn't set the umask correctly.
    umask 022
fi

# # Sometimes WSL doesn't set the shell correctly. I don't see any reason not to
# # set it explicitly.
# export SHELL=$(which zsh)

# export DISPLAY=${DISPLAY:-':0'}
export PAGER=$(which less)
export VISUAL=${VISUAL:-emacs}
export EDITOR=${EDITOR:-emacs}

# # Set JAVA_HOME if we can get it automatically from Java
# if which javac &>/dev/null
# then
#     export JAVA_HOME=$(readlink -f $(which javac) | sed 's:/bin/javac$::')
# fi

# If fd is installed, use it for fzf because it's faster than the built-in find command.
if which fd &>/dev/null
then
    export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git"
fi

# # Composer wants to install binaries in ~/.config/composer, which is weird.
# # Let's just put them in ~/.composer.
# Iexport COMPOSER_HOME=$(realpath $HOME/.composer)

# # Preferred setup for nvim-gtk
# export NVIM_GTK_NO_HEADERBAR=1
# export NVIM_GTK_PREFER_DARK_THEME=1

# # NVM requires $NVM_DIR not to be a symlink, so we'll use the resolved path.
# export NVM_DIR=$(realpath $HOME/.nvm)
