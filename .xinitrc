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

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export TERMINAL="urxvtc&"

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

/usr/bin/feh --bg-fill ~/.desktop/background-images/gentoo.png&

#/usr/bin/feh --bg-tile /usr/local/share/background-images/arch_dtbg.png
#/usr/bin/feh --bg-max /usr/local/share/background-images/arch_dtbg.png
#/usr/bin/feh --bg-fill /usr/local/share/background-images/arch_dtbg.png
#/usr/bin/feh --bg-scale /usr/local/share/background-images/arch_dtbg.png

/usr/local/bin/xscreensaver -no-splash &

/usr/bin/urxvtd -q -o -f

#exec i3 -V >> ~/.i3/i3log 2>&1
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3 -V >> ~/.i3/i3log 2>&1
