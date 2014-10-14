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

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

/usr/bin/feh --bg-center ~/.desktop/background-images/arch_dtbg.png&
#/usr/bin/feh --bg-tile /usr/local/share/background-images/arch_dtbg.png
#/usr/bin/feh --bg-max /usr/local/share/background-images/arch_dtbg.png
#/usr/bin/feh --bg-fill /usr/local/share/background-images/arch_dtbg.png
#/usr/bin/feh --bg-scale /usr/local/share/background-images/arch_dtbg.png

/usr/bin/xscreensaver -no-splash &

exec i3
