#
# ~/.zlogout
#

#!/usr/bin/zsh


UIDMAX=1000

pldp=$(ps aux | grep powerline-daemon | grep -v "grep" | grep $USER | awk '{print $2}')
numSessions=$(ps axno user,tty | awk '$1 >= $UIDMAX && $1 < 65530 && $2 != "?"' | grep $UID | sort -u | wc -l)

if [ ! "$numSessions" -gt 0 ]
then
	kill $pldp
fi
