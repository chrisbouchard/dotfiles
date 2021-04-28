# dotfiles

My various configuration files, arranged to be cloned and symlinked by
[Homeshick][homeshick]. In addittion to a standard Fedora install, this setup
assumes the following external dependencies, which are not currently installed
by the install script:

* zsh (I usually install using `dnf`)


## Bootstrapping

Download and run `bin/install.zsh`, or run it directly from GitHub:

    $ curl https://raw.githubusercontent.com/chrisbouchard/dotfiles/master/bin/install.zsh | zsh

If you are on Fedora, you can also run `bin/install-fedora.zsh` for my
Fedora-specific setup. This script is _not_ able install zsh, since the script
itself is written in zsh.

    $ curl https://raw.githubusercontent.com/chrisbouchard/dotfiles/master/bin/install-fedora.zsh | zsh


[homeshick]: https://github.com/andsens/homeshick

