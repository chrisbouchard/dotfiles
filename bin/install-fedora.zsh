#!/usr/bin/env zsh

fedora_version=$(rpm -E %fedora)

dnf_repos=(
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$fedora_version.noarch.rpm
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$fedora_version.noarch.rpm
)

dnf_packages=(
    autossh
    bat
    buildah
    chrome-gnome-shell
    fd-find
    figlet
    fzf
    gcc
    gcc-c++
    gnome-tweaks
    httpie
    ImageMagick
    make
    podman
    ripgrep
    rpkg
    thefuck
    tmux
    wireguard-tools
)

dnf_remove_packages=(
    PackageKit-command-not-found
    gnome-software
)

flatpak_flathub_packages=(
    com.discordapp.Discord
    com.dropbox.Client
    com.github.tchx84.Flatseal
    com.slack.Slack
    org.gimp.GIMP
    org.inkscape.Inkscape
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

step_end


step_start 'Installing packages from DNF'

    sudo dnf update -y --refresh
    sudo dnf install -y $dnf_packages

step_end


step_start 'Removing unnecessary packages from DNF'

sudo dnf update -y --refresh
sudo dnf remove -y $dnf_remove_packages

step_end


step_start 'Installing packages from Flathub'

    flatpak remote-add --if-not-exists flathub \
        https://flathub.org/repo/flathub.flatpakrepo
    flatpak install -y flathub $flatpak_flathub_packages

step_end
