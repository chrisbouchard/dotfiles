#!/bin/env zsh

fedora_version=$(rpm -E %fedora)

dnf_repos=(
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$fedora_version.noarch.rpm
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$fedora_version.noarch.rpm
)

dnf_coprs=(
    agriffis/neovim-nightly
    jdoss/wireguard
)

dnf_packages=(
    autossh
    chrome-gnome-shell
    dropbox
    figlet
    fzf
    httpie
    ImageMagick
    java-1.8.0-openjdk
    java-11-openjdk
    neovim
    podman
    podman-docker
    postgresql
    postgresql-contrib
    postgresql-server
    restic
    texlive
    thefuck
    tmux
    wine
    wireguard-dkms
    wireguard-tools
)

flatpak_packages=(
    com.discordapp.Discord
    com.googleplaymusicdesktopplayer.GPMDP
    com.mojang.Minecraft
    com.valvesoftware.Steam
    org.freedesktop.Platform.ffmpeg
    org.gimp.GIMP
    org.inkscape.Inkscape
    org.keepassxc.KeePassXC
    org.mozilla.FirefoxDevEdition
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


step_start 'Adding required Flatpak repositories'

    # TODO: Move this to an array?
    flatpak remote-add --from org.mozilla.FirefoxRepo \
        https://firefox-flatpak.mojefedora.cz/org.mozilla.FirefoxRepo.flatpakrepo

step_end


step_start 'Installing packages from Flatpak'

    flatpak install -y $flatpak_packages

step_end

