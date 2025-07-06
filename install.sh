#!/bin/bash
git config --global ghq.root ~/code/src

rm -f ~/.dotfiles && ln -s $(ghq root)/github.com/nhayashi/dotfiles ~/.dotfiles

for f in .bash_aliases .bash_profile .bashrc .ideavimrc .profile .tig-completion.sh .tigrc .tigrc.vim .tmux.conf; do
    rm -f ~/$f && ln -s ~/.dotfiles/$f ~/$f
done

rm -f ~/.config/git/ignore && ln -s ~/.dotfiles/.config/git/ignore ~/.config/git/ignore

# TODO: configure nvim

#rm -f ~/.bash_aliases      && ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
#rm -f ~/.bashrc            && ln -s ~/.dotfiles/.bashrc ~/.bashrc
#rm -f ~/.gitignore_global  && ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
#rm -f ~/.ideavimrc         && ln -s ~/.dotfiles/.ideavimrc ~/.ideavimrc
#rm -f ~/.tig-completion.sh && ln -s ~/.dotfiles/.tig-completion.sh ~/.tig-completion.sh
#rm -f ~/.tigrc             && ln -s ~/.dotfiles/.tigrc ~/.tigrc
#rm -f ~/.tigrc.vim         && ln -s ~/.dotfiles/.tigrc ~/.tigrc.vim
#rm -f ~/.tmux.conf         && ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
