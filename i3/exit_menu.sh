#!/bin/bash

#taken from https://faq.i3wm.org/question/1262/exiting-i3-without-mouse-click/?answer=1263#post-id-1263

# this program uses dmenu to replace the default exit method in i3-wm. normally,
# a i3-msg bar pops up and asks for confimation on exit, but only mouse input is
# accepted. annoying.

while [ "$select" != "NO" -a "$select" != "YES" ]; do
    select=$(echo -e 'NO\nYES' | dmenu -nb '#151515' -nf '#999999' -sb '#f00060' -sf '#000000'  -i -p "You pressed the exit shortcut. Do you really want to exit i3? This will end your x session.")

    [ -z "$select" ] && exit 0
done
[ "$select" = "NO" ] && exit 0
i3-msg exit

#-fn '-*-*-medium-r-normal-*-*-*-*-*-*-100-*-*'
