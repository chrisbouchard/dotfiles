POWERLINE_ROOT="$(python3 -m site --user-site)/powerline"

if (( $+commands[powerline-daemon] ))
then
    powerline-daemon -q
    source "${POWERLINE_ROOT}/bindings/zsh/powerline.zsh"
fi

