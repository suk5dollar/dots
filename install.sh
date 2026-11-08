#!/usr/bin/env bash

dotfiles=(
    bash_profile
    bashrc
    gitconfig
    tmux.conf
    vimrc
    config/htop
    vim
)

for f in "${dotfiles[@]}"; do
    if [[ -d $HOME/.$f || -f $HOME/.$f ]] && [[ ! -L $HOME/.$f ]]; then
        rm -r "$HOME/.$f"
    fi
    ln -sfnv "$PWD/$f" "$HOME/.$f"
done





