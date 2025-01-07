#!/usr/bin/env zsh

# Directory where Homeshick will install its repositories
repo_dir=$HOME/.homesick/repos

# Names of repositories we want to install
repo_names=(
    # Other utilities that my dotfiles use (via symlink)
    asdf-vm/asdf
    robbyrussell/oh-my-zsh
    Tarrasch/zsh-bd
    tmux-plugins/tpm
    zsh-users/zsh-syntax-highlighting

    # My Emacs config
    'https://git.sr.ht/~chrisbouchard/emacs.d'

    # My dotfiles
    chrisbouchard/dotfiles
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

# Function to check if a command exists.
command_exists() {
    type $1 &>/dev/null
}


step_start 'Installing Homeshick'

    # Install Homeshick (Shell-based Homesick replacement). If it's already
    # installed we'll skip this step. We assume it's installed if $repo_dir already
    # exists.
    if [[ ! -d $repo_dir ]]
    then
        mkdir -p $repo_dir
        git clone https://github.com/andsens/homeshick.git $repo_dir/homeshick
    else
        echo -e "\tRepository directory $repo_dir already exists, skipping installation."
    fi

    source $repo_dir/homeshick/homeshick.sh

step_end


step_start 'Installing Repositories'

    # Clone each repository
    for repo_name in $repo_names
    do
        homeshick clone --batch $repo_name
    done

step_end


step_start 'Linking'

    # Install dotfiles via Homeshick.
    homeshick link --force

step_end


if command_exists systemctl
then
    step_start 'Reloading systemd configuration'

        systemctl --user daemon-reload

    step_end
fi
