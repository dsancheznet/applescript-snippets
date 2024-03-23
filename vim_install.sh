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
curl -O https://raw.githubusercontent.com/hzchirs/vim-material/master/colors/vim-material.vim
curl -O https://raw.githubusercontent.com/sainnhe/everforest/master/colors/everforest.vim
curl -O https://raw.githubusercontent.com/raphamorim/lucario/main/colors/lucario.vim
curl -O https://raw.githubusercontent.com/nordtheme/vim/main/colors/nord.vim
curl -O https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/colors/PaperColor.vim

# Now launch vim and execute PlugInstall
cd ~
vim -c "PlugInstall"
