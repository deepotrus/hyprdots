#!/bin/bash

# Check Bluetooth Status
if bluetoothctl show | grep -q "Powered: yes"; then
  BLUETOOTH_STATUS="󰂯"
  BLUETOOTH_NAME=$(bluetoothctl info | grep "Alias" | cut -d ' ' -f 2-)
  BLUETOOTH_DEV=$(bluetoothctl info | grep "Device" | cut -d ' ' -f 2-)
else
  BLUETOOTH_STATUS="󰂲"
  BLUETOOTH_NAME="None"
  BLUETOOTH_DEV="None"
fi

echo '{"text": "Bluetooth: '$BLUETOOTH_STATUS'","tooltip": "Device: '$BLUETOOTH_DEV'\nName: '$BLUETOOTH_NAME'"}'
