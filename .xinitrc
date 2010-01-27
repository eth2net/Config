#!/bin/bash
#exec /usr/bin/awesome
#exec gnome-session
#gnome-screensaver &
#gnome-settings-daemon &
#gnome-power-manager &
#nm-applet &
#update-notifier &
xrdb ~/.Xresources

exec /usr/bin/awesome
#feh --bg-scale ~/gentoo-minimal-1280x1024.jpg

#export XMODIFIERS="@im=fcitx"
#export XIM=fcitx
#export XIM_PROGRAM=fcitx
#exec fcitx &
export XMODIFIERS=@im=scim
export XIM=scim
export XIM_PROGRAM=scim
export GTK_IM_MODULE=scim
exec scim


