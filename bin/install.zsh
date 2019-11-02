#!/bin/env zsh

# Directory where Homeshick will install its repositories
repo_dir=$HOME/.homesick/repos

# Names of repositories we want to install
repo_names=(
    # My dotfiles
    chrisbouchard/dotfiles

    # Other utilities that my dotfiles use (via symlink)
    robbyrussell/oh-my-zsh
    Shougo/dein.vim
    Tarrasch/zsh-bd
    tmux-plugins/tpm
    vlevit/notify-send.sh
    zsh-users/zsh-syntax-highlighting
)


# Function to print a colored message at each step.
echo_step() {
    local bold=$(tput bold)
    local green=$(tput setaf 2)
    local white=$(tput setaf 7)
    local reset=$(tput sgr0)

    echo "$bold$green==> $white$1...$reset"
}


echo_step 'Installing Homeshick'

# Install Homeshick (Shell-based Homesick replacement). If it's already
# installed we'll skip this step. We assume it's installed if $repo_dir already
# exists.
if [[ ! -d $repo_dir ]]
then
    mkdir -p $repo_dir
    git clone https://github.com/andsens/homeshick.git $repo_dir/homeshick
else
    echo "    Repository directory $repo_dir already exists, skipping installation."
fi

source $repo_dir/homeshick/homeshick.sh

echo
echo_step 'Installing Repositories'

# Clone each repository
for repo_name in $repo_names
do
    homeshick clone --batch $repo_name
done

echo
echo_step 'Linking'

# Install dotfiles via Homeshick.
homeshick link --force

