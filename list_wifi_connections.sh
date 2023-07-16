#!/bin/bash

connections=$(nmcli -f NAME connection show | awk 'NR>1')

while IFS= read -r conn; do
    conn=$(echo "$conn" | awk '{$1=$1;print}')
    password=$(nmcli connection show "$conn" -s | grep psk: | awk -F ": " '{print $2}')
    #echo "Connection: $conn"
    #echo "Password: $password"
    #echo "------------------------------"
    echo $conn ":" $password >> wifiP.txt
done <<< "$connections"
 

