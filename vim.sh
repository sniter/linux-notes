#!/bin/sh

VIM_DIR=~/.vim
VIM_AUTOLOAD_DIR=${VIM_DIR}/autload
VIM_BUNDLE_DIR=${VIM_DIR}/bundle

mkdir -p ${VIM_AUTOLOAD_DIR}
mkdir -p ${VIM_BUNDLE_DIR}
mkdir -p ${VIM_DIR}/doc

# Installing Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim 

# Installing Python-Mode
git clone https://github.com/klen/python-mode.git ${VIM_BUNDLE_DIR}/python-mode
#
# Manually add
#
# " Pathogen load
# filetype off
#
# call pathogen#infect()
# call pathogen#helptags()
#
# filetype plugin indent on
# syntax on

# Installing NerdTree
git clone https://github.com/scrooloose/nerdtree ${VIM_BUNDLE_DIR}/nerdtree
echo "let NERDTreeDirArrows = 0" >> ~/.vimrc
