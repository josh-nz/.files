#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/.files
# Original starting point borrowed from:
# https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
############################

########## Variables

dir=~/.files                    # dotfiles directory
olddir=$dir/_dotfiles_old             # old dotfiles backup directory
files="bash_profile emacs.d shellrc ruby-version zshrc"    # list of files/folders to symlink in homedir

##########

if [ -d $olddir ]; then
  echo "Backups exist in $olddir. Sort these, delete $olddir and try again"
  exit 1
fi

# move any existing dotfiles in homedir to backup directory, then create symlinks from the homedir to any files in the ~/.files directory specified in $files
for file in $files; do
    if [ -e ~/.$file ]; then
        if [ -h ~/.$file ]; then
          realdir=`readlink ~/.$file`
          echo "Removing symlink ~/.$file which pointed to $realdir"
          rm ~/.$file
        else
          if [ ! -d $olddir ]; then
              mkdir $olddir
          fi
          echo "Backing up ~/.$file"
          mv -f ~/.$file $olddir
        fi
    fi
    echo "Creating symlink to .$file in home directory."
    ln -s $dir/$file ~/.$file
done
