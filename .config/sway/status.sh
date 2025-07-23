date=$(date +'%Y-%m-%d %X')
if media=$(playerctl -f "{{artist}} - {{title}}" metadata); then
	media="${media}  |  "
fi
bat=$(cat /sys/class/power_supply/BAT0/capacity)

#volume=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }')
#if [$volume != $AUDIO_VOLUME]; then
#	playerctl pause
#	export AUDIO_VOLUME=$volume
#fi
echo "$media$date | $bat%"
