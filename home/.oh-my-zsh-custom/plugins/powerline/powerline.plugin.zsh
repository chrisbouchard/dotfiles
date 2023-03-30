: ${ZSH_POWERLINE_PYTHON:=python3}
: ${ZSH_POWERLINE_VENV:=$HOME/.powerline.venv}

function powerline_rebuild_venv() {
    echo "Rebuilding the powerline virtual environment at $ZSH_POWERLINE_VENV..."

    local venv_bin=$ZSH_POWERLINE_VENV/bin

    rm -rf $ZSH_POWERLINE_VENV
    $ZSH_POWERLINE_PYTHON -m venv $ZSH_POWERLINE_VENV
    $venv_bin/pip install \
        powerline-status \
        $ZSH_POWERLINE_ADDITIONAL_PACKAGES[@]
}

() {
    local venv_bin=$ZSH_POWERLINE_VENV/bin

    if [[ ! -e $ZSH_POWERLINE_VENV ]]
    then
        echo "No powerline virtual environment found. Creating at $ZSH_POWERLINE_VENV..."

        $ZSH_POWERLINE_PYTHON -m venv $ZSH_POWERLINE_VENV
        $venv_bin/pip install \
            powerline-status \
            $ZSH_POWERLINE_ADDITIONAL_PACKAGES[@]
    fi

    # Override the powerline and powerline-config command paths so the shell
    # integration uses that instead of $PATH.
    export POWERLINE_COMMAND=$venv_bin/powerline
    export POWERLINE_CONFIG_COMMAND=$venv_bin/powerline-config

    # Start Powerline daemon in the background.
    $venv_bin/powerline-daemon --quiet

    # Parse powerline-status's site root from pip show.
    local site_root="$(
        $venv_bin/pip show powerline-status |
            awk 'BEGIN { FS=": " } /Location:/ { print $2 }'
    )"

    source $site_root/powerline/bindings/zsh/powerline.zsh
}
