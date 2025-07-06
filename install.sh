#!/bin/bash
rm -f ~/.dotfiles && ln -s $(ghq root)/github.com/nhayashi/dotfiles ~/.dotfiles

for f in .bash_aliases .bash_profile .bashrc .ideavimrc .profile .tmux.conf; do
    rm -f ~/$f && ln -s ~/.dotfiles/$f ~/$f
done

rm -f ~/.config/dein && ln -s ~/.dotfiles/.config/dein ~/.config/dein
rm -f ~/.config/git  && ln -s ~/.dotfiles/.config/git  ~/.config/git
rm -f ~/.config/nvim && ln -s ~/.dotfiles/.config/nvim ~/.config/nvim

