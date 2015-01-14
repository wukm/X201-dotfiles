#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# see my note in the script. this should really be done by an Xorg rule instead.

if [ -f /home/lxvk/bin/autoxrandr.sh ]; then
  . /home/lxvk/bin/autoxrandr.sh    # set the right display
fi

# this just sets caps lock correctly.
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap


# could maybe do this elsewhere. also randomly reverts, so use an alias 'fixcaps'
setxkbmap -option ctrl:nocaps

# you can never be too sure
xset b off

# apparently i want to run this here to register my .Xresources file.
# see the wiki on X_resources. apparently the file can be anywhere
# for example in the .config directory.
# the point of creating the xresources thing is for urxvt

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

redshift &

exec i3 -V >> ~/.i3/i3log 2>&1
