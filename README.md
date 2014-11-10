dotfiles
========

My various configuration files, arranged to be symlinked by [homesick](https://github.com/technicalpickles/homesick).

To install, first install homesick.
```
$ gem install homesick
```
Then clone this repository and symlink it.
```
$ homesick clone chrisbouchard/dotfiles
$ homesick symlink dotfiles
```
This will automatically pull down all the subprojects as well. You will have to compile [stderred](https://github.com/sickill/stderred):
```
$ cd ~/.zsh/stderred
$ make
```

The goal is that the configuration should take care of itself, but that is not the case yet. There are currently all sorts of hard-coded paths and filenames and configuration options.
