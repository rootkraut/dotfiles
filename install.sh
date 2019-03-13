#!/bin/sh

dotfiles_dir="$HOME/dotfiles"
backup_root_folder="$HOME/dotfiles_backup"

#
# Create new backup folder
#
function create_new_backup_dir () {
  if [ ! -d ${backup_root_folder} ]; then
    echo "Will creating backup root folder '${backup_root_folder}'..."
    mkdir ${backup_root_folder}
  fi
  current_ts=$(date +%Y-%m-%d-%T)
  current_backup_folder="${backup_root_folder}/${current_ts}"
  echo "Will creating new backup folder '${current_backup_folder}'..."
  mkdir ${current_backup_folder}
}

#
# Backup given dotfile if existing
#
function backup_dotfile () {
  dotfile=$1 
  if [ -f $HOME/${dotfile} ]; then
      echo "'${dotfile}' found! Will create backup in '${current_backup_folder}..."
      target_dir=$(dirname "${dotfile}")
      mkdir -p ${current_backup_folder}/${target_dir}
      cp ${HOME}/${dotfile} ${current_backup_folder}/${dotfile}
  fi
}

#
# Create symlink from dotfiles directory to ~/<dotfile> for given dotfile
#
function create_dotfile_symlink () {
  dotfile=$1
  echo "Creating symlink for ${dotfile}..."
  ln -sf ${dotfiles_dir}/${dotfile} ~/${dotfile}
}

#
# use given dotfile 
#
function use_dotfile () {
  backup_dotfile $1
  create_dotfile_symlink $1
}

# create a new backup directory for backup of existing dotfiles
create_new_backup_dir

# use ~/<dotfiles>
use_dotfile .xinitrc
use_dotfile .profile
use_dotfile .bash_profile
use_dotfile .bashrc
use_dotfile .vimrc
use_dotfile .Xdefaults
use_dotfile .xinitrc
use_dotfile .Xresources

# use ~/.config/<dotfiles>
use_dotfile .config/aliasrc
use_dotfile .config/i3/config
use_dotfile .config/ranger/commands_full.py
use_dotfile .config/ranger/commands.py
use_dotfile .config/ranger/rc.conf
use_dotfile .config/ranger/rifle.conf
use_dotfile .config/ranger/scope.sh

use_dotfile .scripts/i3cmds/prompt
use_dotfile .scripts/tools/extract
use_dotfile .scripts/tools/ext
use_dotfile .scripts/tools/installBasicApps
use_dotfile .scripts/tools/setbg
use_dotfile .scripts/tools/usebg
