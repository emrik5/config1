#!/bin/bash
#### Write bash for 1 minute without suffering challenge (IMPOSSIBLE)
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
bat=$(cat /sys/class/power_supply/BAT0/capacity)

#volume=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }')
#if [$volume != $AUDIO_VOLUME]; then
#	playerctl pause
#	export AUDIO_VOLUME=$volume
#fi

## Print final output
# The pipe character between media and date is included in the media string,
# as there isn't always media information available.
echo "$media$date | $bat%"
