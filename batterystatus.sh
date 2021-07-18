#!/bin/bash
# Battery status check on Ubuntu 20.04
# Set in your .profile with "sh batterystatus.sh &"
# or change the script slightly and Set the script to run as a cron job. e.g to run every 5 minutes.

#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
while true
do
	export DISPLAY=:1
	batterylevel=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{print $2}' | grep -P -o '[0-9]+(?=%)'`

	if [ $batterylevel -le 10 ]; then
		notify-send --urgency=CRITICAL "Battery Low" "Level: ${batterylevel}%"
		paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
	fi
	sleep 60
done
