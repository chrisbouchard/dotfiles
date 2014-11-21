dotfiles
========

My various configuration files, arranged to be symlinked by [homesick](https://github.com/technicalpickles/homesick).

To install, first install homesick.

    $ gem install homesick

Then clone this repository.

    $ homesick clone chrisbouchard/dotfiles

This will automatically pull down all the subprojects as well. You will have to compile [stderred](https://github.com/sickill/stderred) and [hub](https://github.com/github/hub). This is handled by the rc file.

    $ homesick rc dotfiles

Note: You'll have to have the proper development tools available -- glibc-devel for stderred and go for hub. Finally, symlink the dotfiles.

    $ homesick symlink dotfiles

The goal is that the configuration should take care of itself, but that is not the case yet. There are currently all sorts of hard-coded paths and filenames and configuration options.
