#!/bin/sh
#xsetroot -solid black &
#exec /usr/bin/awesome
#exec gnome-session
#gnome-screensaver &
#gnome-settings-daemon &
#gnome-power-manager &
#nm-applet &
#update-notifier &
xrdb ~/.Xresources

#feh --bg-scale ~/gentoo-minimal-1280x1024.jpg
#/usr/sbin/NetworkManager &
#nm-applet &
exec wicd-client &
exec dropbox start &

export GTK_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE="ibus"
ibus-daemon -r -d -x

#export XMODIFIERS="@im=SCIM"
#export XIM=scim
#export XIM_PROGRAM=scim
#export GTK_IM_MODULE=scim
#export QT_IM_MODULE=scim
#exec scim 
#exec openbox
#exec openbox-session
#exec gnome-session
#exec openbox-gnome-session
exec /usr/bin/awesome
#export XMODIFIERS="@im=fcitx"
#export XIM=fcitx
#export XIM_PROGRAM=fcitx
#exec fcitx &

#export XMODIFIERS="@im=SCIM"
#export XIM=scim
#export XIM_PROGRAM=scim
#export GTK_IM_MODULE=scim
#export QT_IM_MODULE=scim
#exec scim -d
