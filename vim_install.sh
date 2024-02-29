#!/bin/bash

# Custom vim for MacOSX installer by D.Sánchez (c) 2024
echo "┓┏•     •      ┓┓    "
echo "┃┃┓┏┳┓  ┓┏┓┏╋┏┓┃┃┏┓┏┓"
echo "┗┛┗┛┗┗  ┗┛┗┛┗┗┻┗┗┗ ┛ "
echo "D.Sanchez    (c) 2024"
read

# Install vim-plug ( https://github.com/junegunn/vim-plug )
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download .vimrc file
curl -O https://raw.githubusercontent.com/dsancheznet/applescript-snippets/master/.vimrc

# Install molokay color themea ( https://github.com/tomasr/molokai )
mkdir -p ~/.vim/colors/
cd ~/.vim/colors/
curl -O https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

# Now launch vim and execute PlugInstall
cd ~
vim -c "PlugInstall"
