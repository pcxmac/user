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

export TERMINAL="urxvtc&"		# can cause lag ... under heavy load ... or not?
#export TERMINAL="urxvt"

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice


#/usr/bin/feh --bg-tile /usr/local/share/background-images/arch_dtbg.png
#/usr/bin/feh --bg-max /usr/local/share/background-images/arch_dtbg.png
#/usr/bin/feh --bg-fill /usr/local/share/background-images/arch_dtbg.png
#/usr/bin/feh --bg-scale /usr/local/share/background-images/arch_dtbg.png

/usr/bin/numlockx on &

/usr/bin/xscreensaver -no-splash &

#dbus-launch /usr/bin/nm-applet &

#/usr/bin/urxvtd -q -o -f		# performs poorly under heavy system load

/usr/bin/feh --bg-fill ~/.desktop/background-images/nova.jpg&


exec i3 -V >> ~/.i3/i3log 2>&1

#/usr/bin/rofi -dmenu &



exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3 -V >> ~/.i3/i3log 2>&1
#exec dbus-launch --sh-syntax --exit-with-session i3 -V >> ~/.i3/i3log 2>&1


