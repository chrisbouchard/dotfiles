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

