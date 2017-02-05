#!/bin/bash

battery_info=`ioreg -rc AppleSmartBattery`
current_charge=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
total_charge=$(echo $battery_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
mah_fraction=$(echo "$current_charge/$total_charge mAh")
percentage=`pmset -g batt | grep -o "[0-9]\{1,3\}%"`
remaining=`pmset -g batt | grep -o '[0-9]\{1,2\}:[0-9]\{1,2\}'`

echo $percentage' '$remaining' '$mah_fraction
