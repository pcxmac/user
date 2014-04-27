#
# ~/.zlogout
#

#!/usr/bin/zsh

# SANITIZE INTERACTIVE ONLY POWERLINE-DAEMON INVOCATIONS
# list users still logged in, who won't be affected
usli="$(who | awk '{print $1}' | uniq | grep -v $USER)";

# list powerline-daemons still under logged out (non-interactive) users?
uwpdr=$(ps aux | grep powerline-daemon | grep -v "grep" | awk '{print $1}' | uniq);

# difference between logged in users and powerline-daemon users represents daemons needing to be killed
difu=$(diff <(echo "$usli") <(echo "$uwpdr") | sed -n '1!p' | awk '{print $2}' | sed '/^$/d');

while read nUser; 
do 

        if [[ "$(ps aux | grep $nUser | grep "powerline-daemon" | grep -v "grep" | wc -l)" > 0 ]]
        then
                sudo -u $nUser powerline-daemon --kill;
        fi
 
done < <(echo "$difu")

