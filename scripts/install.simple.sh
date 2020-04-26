#!/bin/bash

if [ "$(whoami)" != "root" ]; then 
  echo "You need to execute this script as sudo"
  exit 1
fi

apt-get install vim
apt-get install zsh
apt-get install git

apt-get install tmux
apt-get install autojump

rm $HOME/.aliases
rm $HOME/.bashrc
rm $HOME/.env
rm $HOME/.gitconfig
rm $HOME/.profile
rm $HOME/.tmux.conf
rm $HOME/.vimrc
rm $HOME/.zprofile

ln -s $HOME/.dotfiles/.aliases.simple    $HOME/.aliases
ln -s $HOME/.dotfiles/.bashrc.simple     $HOME/.bashrc
ln -s $HOME/.dotfiles/.env               $HOME/.env
ln -s $HOME/.dotfiles/.gitconfig.simple  $HOME/.gitconfig
ln -s $HOME/.dotfiles/.profile           $HOME/.profile
ln -s $HOME/.dotfiles/.tmux.conf.simple  $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.vimrc.simple      $HOME/.vimrc
ln -s $HOME/.dotfiles/.zprofile          $HOME/.zprofile

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c 'PluginInstall' -c 'qa!'

tmux
zsh

echo "Et voilà."