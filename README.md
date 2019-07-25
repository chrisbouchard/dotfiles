# dotfiles

My various configuration files, arranged to be cloned and symlinked by
[Homeshick][homeshick]. In addittion to a standard Fedora install, this setup
assumes the following external dependencies, which are not currently installed
by the install script:

* Powerline
* Restic
* ZSH


## Bootstrapping

Download and run `bin/install.zsh`, or run it directly from GitHub:

    $ curl https://raw.githubusercontent.com/chrisbouchard/dotfiles/master/bin/install.zsh | zsh


## Setting up Restic Backups

This setup includes Systemd services to create daily external backups, using
[Restic][restic] in a [Backblaze B2][backblaze-b2] bucket. After bootstrapping,
create the following `.conf` files based on the existing `.conf.sample`
files:

* `~/.config/systemd/user/restic-backup.service.d/local.conf`
* `~/.config/systemd/user/restic-prune.service.d/local.conf`

Then run

    $ systemctl --user daemon-reload

to load the services and timers into Systemd.

These backup services are based on the ones described in [_Automate backups
with restic and systemd_ in Fedora Magazine][automate-backups], but modified to
fit my setup.


[automate-backups]: https://fedoramagazine.org/automate-backups-with-restic-and-systemd/
[backblaze-b2]: https://www.backblaze.com/b2/cloud-storage.html
[homeshick]: https://github.com/andsens/homeshick
[restic]: https://restic.net/

