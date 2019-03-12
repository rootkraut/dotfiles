#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="nvim"
export JAVA_HOME=/usr/lib/jvm/default
export JDK_HOME=$JAVA_HOME 
export GRADLE_HOME=/usr/share/java/gradle
export PATH="$PATH:$HOME/go/bin"
export FILE_MANAGER="ranger"
export MY_BROWSER="chromium"
export TERMINAL="urxvt"

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# startx if i3 not already running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
