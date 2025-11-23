#!/bin/bash
#### Write bash for 1 minute without suffering challenge (IMPOSSIBLE)

# Get and format volume% and mute status
get_volume () {
    echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | \
        awk 'BEGIN {RS=""}{ if ($3=="[MUTED]"){$3=" (mute)"} }{ print $2*100"%" $3}')
} 
# Set path to msg-pipe
pipe="/tmp/sway-bar-status.fifo"
# Connect fifo-ends to fd 3 
exec 3<> "$pipe"
# Read pipe for 1 second, put data into array
if read -t 1 -u 3 -a buffer; then
    # Create output based on messages
    for msg in ${buffer[@]}; do
        message="| $message"
        case "$msg" in
            "vol") message="Vol: $(get_volume) $message"
            ;;
            *)
            ;;
        esac
    done
fi

## Get date
date=$(date +'%Y-%m-%d %X')
## Get playing media information
## TODO Add removal of "Remastered" from song titles
# Set media to title of media, or don't run if there is no title
if media=$(playerctl -f "{{title}}" metadata); then
    # Get artist
    artist=$(playerctl -f '{{artist}}' metadata)
    # If there is an artist (i.e. $artist isn't blank), append " - "
    [ -n "${artist//[[:blank:]]/}" ] && artist="$artist - "
    # Combine artist with title. 
    # First regex removes strings in angle brackets from title
    # Second regex removes stray hyphens
    media="$artist$(echo $media | sed 's/\[[^]]*]//g' | sed -r 's/^\s*-\s*|\s+\$//g') | "
fi

# Get battery charge percent. 
# Will fail if this computer uses another name than "BAT0" for the battery
# (so change the path below if that is the case...)
battery_dir="/sys/class/power_supply/BAT0"
bat_percent=$(< ${battery_dir}/capacity)
case "$(< ${battery_dir}/status)" in
    "Charging")
        charging="+"
        ;;
    "Discharging")
        charging="-"
        ;;
    *)
        ;;
esac

# Notify if battery is low
if ((bat_percent < 10)); then
    swaynag -y overlay -t warning -m "W: Low Battery Level"
fi

## Print final output
# The pipe character between media and date is included in the media string,
# as there isn't always media information available.
# The same applies to message
echo "$message$media$date | $bat_percent%$charging"
