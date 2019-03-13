#!/usr/bin/env bash

############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
echo "Changing directory to $dir"
cd $dir
files=$(find -type f | cut -c 3-)
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -f ~/$file ]; then
        mv ~/$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/$file
    else
        echo "~/$file does not exist"
    fi
done

source ~/.zshrc
