#!/bin/env zsh

fedora_version=$(rpm -E %fedora)

dnf_repos=(
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$fedora_version.noarch.rpm
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$fedora_version.noarch.rpm
)

dnf_coprs=(
    agriffis/neovim-nightly
)

dnf_packages=(
    @development-tools
    autossh
    bat
    buildah
    chrome-gnome-shell
    cmake
    figlet
    fzf
    g++
    gnome-shell-extension-appindicator
    gnome-tweak-tool
    httpie
    ImageMagick
    make
    neovim
    podman
    python-neovim
    restic
    ripgrep
    rpkg
    texlive-scheme-full
    thefuck
    tmux
    wine
    wireguard-tools
)

flatpak_flathub_packages=(
    chat.rocket.RocketChat
    com.discordapp.Discord
    com.dropbox.Client
    com.github.tchx84.Flatseal
    com.mojang.Minecraft
    com.slack.Slack
    com.valvesoftware.Steam
    org.freedesktop.Platform.ffmpeg
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

    flatpak install -y flathub $flatpak_flathub_packages

step_end


step_start 'Installing Firefox Developer Edition'

    flatpak remote-add --from org.mozilla.FirefoxRepo \
        https://firefox-flatpak.mojefedora.cz/org.mozilla.FirefoxRepo.flatpakrepo
    flatpak install -y org.mozilla.FirefoxRepo org.mozilla.FirefoxDevEdition

step_end


step_start 'Installing Mullvad VPN'

    wget --output-document=$HOME/Downloads/mullvad-latest.rpm \
        https://mullvad.net/download/app/rpm/latest
    sudo dnf install -y ~/Downloads/mullvad-latest.rpm

step_end

