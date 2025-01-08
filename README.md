# dotfiles

My various configuration files, arranged to be cloned and symlinked by
[Homeshick][homeshick]. It's grown a bit past _just_ dotfiles&mdash;e.g., to
include some fonts&mdash;but it's still about drop-in configuration.


## Bootstrapping

Download and run `bin/install.zsh`, or run it directly from GitHub:

    $ curl https://raw.githubusercontent.com/chrisbouchard/dotfiles/master/bin/install.zsh | zsh
    
This clones homeshick, and then uses it to clone several other castles,
including this one. It then uses homeshick to link all the castles. And finally,
if `systemctl` is available, it reloads the user's systemd configuration.

The install script has been run successfully on macOS and Fedora. Its only
dependencies are `zsh` and `git`. (It does not require homeshick, and will
install its own.) Recent versions of macOS include both `zsh` and `git`. Fedora
includes `git`, but you'll have to install `zsh` separately (e.g., with `sudo
dnf install zsh`).

If you are on Fedora, you can additionally run `bin/install-fedora.zsh` for
Fedora-specific setup.

    $ curl https://raw.githubusercontent.com/chrisbouchard/dotfiles/master/bin/install-fedora.zsh | zsh
    
This installs a bunch of extra applications and utilities that I like to have
available. I haven't updated this script in a while, though, so I don't
guarantee it works or matches what I would install today. (At some point I
should build a similar script for macOS using homebrew.)


[homeshick]: https://github.com/andsens/homeshick

