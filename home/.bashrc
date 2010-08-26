# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

PATH=""/opt/bin:/usr/local/sbin:/usr/sbin:/sbin:/bin":$PATH"
export LANG="en_US.UTF-8"
export LC_CTYPE="zh_CN.UTF-8"

# Put your fun stuff here.
if [[ -f /etc/profile.d/bash-completion.sh ]] ; then
    source /etc/profile.d/bash-completion.sh
fi

EDITOR=vim

alias gtm="gnome-terminal"
alias m='pgrep mlnet >/dev/null 2>&1 && echo vd | nc -q 1 localhost 4000 | awk '"'"'/\[D/{print "\033[0;32m"$7"\t\033[4;31m"$8"%\033[0m\t",$14"KB/s"} /Down:/'"'"
alias eu="sudo emerge -auDN world"
alias ec="sudo emerge -ac"
alias rd="sudo revdep-rebuild"
alias ecc="sudo emerge -aC"
alias ep="sudo emerge -pv"
alias es="emerge -s"
alias ess="sudo emerge --sync"
alias upenv="sudo env-update && source /etc/profile"
alias nautilus="nautilus --no-desktop"
alias wn='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
