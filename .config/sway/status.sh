date=$(date +'%Y-%m-%d %X')
media=$(playerctl -f "{{artist}} - {{title}}" metadata)
bat=$(cat /sys/class/power_supply/BAT0/capacity)
echo "$media  |  $date | $bat%"
