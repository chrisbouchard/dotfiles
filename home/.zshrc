#!/usr/bin/env zsh

# I don't think this test is strictly necessary, but it's not a bad sanity
# check
# if [[ $- != *i* ]]
# then
#     return
# fi

zstyle :compinstall filename "${HOME}/.zshrc"

INIT_DIR="${HOME}/.zsh/init"
START_SCREEN=0

# Source all the init scripts
for f in ${INIT_DIR}/*
do
    source ${f}
done

if (( START_SCREEN ))
then
    screen -AUxRR && exit
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/chris/.sdkman"
[[ -s "/home/chris/.sdkman/bin/sdkman-init.sh" ]] && source "/home/chris/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="/home/chris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
