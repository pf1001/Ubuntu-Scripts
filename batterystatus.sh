#!/bin/bash
# Battery status check on Ubuntu 20.04
# Set the script to run as a cron job. e.g to run every 5 minutes.

while true
do
	export DISPLAY=:0.0
	batterylevel=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{print $2}' | grep -P -o '[0-9]+(?=%)'`

	if [ $batterylevel -le 10 ]; then
		notify-send --urgency=CRITICAL "Battery Low" "Level: ${batterylevel}%"
		paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
		exit 0;
	else
		exit 0;
	fi

done
