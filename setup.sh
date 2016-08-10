#!/bin/bash

# this will setup the homefolder to get the git stuff

# pre aktions
exPath=`pwd`

# Deinstall old crap
sudo apt-get remove vim-runtime vim-tiny vim

# Install new stuff
sudo apt-get install \
                 build-essential\
                 cmake\
                 zsh\
                 ncdu\
                 vim-nox\
                 ctags\
                 tmux\
                 tree\
                 git\
                -Y

# user bin folder link
if ! [ -L ~/bin  ]; then
  ln -s ${exPath}/bin ~/bin
else
  echo "bin is already a symlinc..."
fi

# tmux conf
if ! [ -L  ~/.tmux.conf ]; then
  ln -s ${exPath}/dotfiles/tmux.conf ~/.tmux.conf
else
  echo ".tmux is already a symlinc..."
fi

# zsh conf
if ! [ -L ~/.zshrc  ]; then
  ln -s ${exPath}/dotfiles/zshrc ~/.zshrc
else
  echo ".zshrc is already a symlinc..."
fi

# zsh additonal configs
if ! [ -L ~/.zshrc.local  ]; then
  ln -s ${exPath}/dotfiles/zshrc.local ~/.zshrc.local
else
  echo ".zshrc is already a symlinc..."
fi


# vim folder
if ! [ -L ~/.vim  ]; then
  ln -s ${exPath}/dotfiles/vim ~/.vim

  # setup vundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo ".vim is already a symlinc..."
fi

# first pull of all Plugins
vim +PluginInstall +qall

# build autocomplete
#sudo ${exPath}/dotfiles/vim/bundle/YouCompleteMe/install.py --all

