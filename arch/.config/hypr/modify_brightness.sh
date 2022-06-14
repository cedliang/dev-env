#!/usr/bin/env zsh

BRIGHTNESS_INCREMENT=7
CONTRAST_INCREMENT=1

CURRENT_BRIGHTNESS="$(echo $(ddcutil getvcp 10) | cut -d'=' -f2 | cut -d',' -f1 | cut -d' ' -f2)"

if [ "$1" = "increase" ]; then

	if [ "$CURRENT_BRIGHTNESS" -lt "100" ]; then
		ddcutil setvcp 10 + $BRIGHTNESS_INCREMENT
		ddcutil setvcp 12 + $CONTRAST_INCREMENT

		if [ "$CURRENT_BRIGHTNESS" -ge $((100 - $BRIGHTNESS_INCREMENT)) ]; then
			notify-send "Brightness: 100"
		else
			notify-send "Brightness: $((CURRENT_BRIGHTNESS + $BRIGHTNESS_INCREMENT))"
		fi

	else
		notify-send "Brightness: 100"
	fi

elif [ $1 = "decrease" ]; then
	if [ "$CURRENT_BRIGHTNESS" -gt "0" ]; then
		ddcutil setvcp 10 - $BRIGHTNESS_INCREMENT
		ddcutil setvcp 12 - $CONTRAST_INCREMENT
		if [ "$CURRENT_BRIGHTNESS" -le $((0 + $BRIGHTNESS_INCREMENT)) ]; then
			notify-send "Brightness: 0"
		else
			notify-send "Brightness: $((CURRENT_BRIGHTNESS - $BRIGHTNESS_INCREMENT))"
		fi
	else
		notify-send "Brightness: 0"
	fi
fi
