#!/bin/sh

dotfiles_dir="~/dotfiles"
backup_root_folder="~/dotfiles_backup"

# Will check for backup root folder and create it if not present
if [ ! -d ${backup_root_folder} ]; then
  echo "Will creating backup root folder '${backup_root_folder}'..."
  mkdir ${backup_root_folder}
fi

# create current timestamp folder in backup root folder
current_ts=$(date +%Y-%m-%d-%T)
current_backup_folder="${backup_root_folder}/${current_ts}"
mkdir ${current_backup_folder}

#
# Check for every .dotfile and create backup if needed
#

if [ -f ~/.xinitrc ]; then
    echo "'.xinitrc' found! Will create backup in '${current_backup_folder}..."
    cp ~/.xinitrc ${current_backup_folder}
fi
ln -sf ${dotfiles_dir}/.xinitrc ~/.xinitrc

