#!/bin/env zsh

fedora_version=$(rpm -E %fedora)

dnf_repos=(
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$fedora_version.noarch.rpm
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$fedora_version.noarch.rpm
)

dnf_coprs=(
    agriffis/neovim-nightly
    chrisbouchard/neovide-nightly
)

dnf_packages=(
    autossh
    bat
    buildah
    chrome-gnome-shell
    figlet
    fzf
    gnome-shell-extension-appindicator
    gnome-shell-extension-caffeine
    gnome-shell-extension-disconnect-wifi
    gnome-shell-extension-refresh-wifi
    gnome-tweaks
    httpie
    ImageMagick
    neovide
    neovim
    podman
    python-neovim
    restic
    ripgrep
    rpkg
    thefuck
    tmux
    wireguard-tools
)

flatpak_flathub_packages=(
    com.discordapp.Discord
    com.dropbox.Client
    com.github.tchx84.Flatseal
    com.slack.Slack
    org.gimp.GIMP
    org.inkscape.Inkscape
    org.keepassxc.KeePassXC
    org.signal.Signal
    org.videolan.VLC
)


# Function to print a colored message at the start of each step.
step_start() {
    local bold=$(tput bold)
    local green=$(tput setaf 2)
    local white=$(tput setaf 7)
    local reset=$(tput sgr0)

    echo "${bold}${green}>>> ${white}$1...${reset}"
}

# Function to print a colored message at the end of each step.
step_end() {
    local bold=$(tput bold)
    local green=$(tput setaf 2)
    local white=$(tput setaf 7)
    local reset=$(tput sgr0)

    echo "${bold}${green}>>> ${white}Done${reset}"
    echo
}


step_start 'Adding required DNF repositories'

    sudo dnf install -y $dnf_repos

    for dnf_copr in $dnf_coprs
    do
        sudo dnf copr enable -y $dnf_copr
    done

step_end


step_start 'Installing packages from DNF'

    sudo dnf install -y $dnf_packages

step_end


step_start 'Installing packages from Flathub'

    flatpak remote-add --if-not-exists flathub \
        https://flathub.org/repo/flathub.flatpakrepo
    flatpak install -y flathub $flatpak_flathub_packages

step_end


step_start 'Installing Mullvad VPN'

    wget --output-document=$HOME/Downloads/mullvad-latest.rpm \
        https://mullvad.net/download/app/rpm/latest
    sudo dnf install -y $HOME/Downloads/mullvad-latest.rpm

step_end

