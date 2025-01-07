# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Have ASDF prepend its shims to the path so they have the highest priority.
export ASDF_FORCE_PREPEND=yes

# Have asdf-golang look in go.mod for a Go version.
export ASDF_GOLANG_MOD_VERSION_ENABLED=true

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

# export DISPLAY=${DISPLAY:-':0'}
export PAGER=$(which less)
export VISUAL=${VISUAL:-emacs}
export EDITOR=${EDITOR:-emacs}

export DOTNET_ROOT=${DOTNET_ROOT:-/opt/homebrew/opt/dotnet/libexec}

# If fd is installed, use it for fzf because it's faster than the built-in find command.
if which fd &>/dev/null
then
    export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git"
fi


