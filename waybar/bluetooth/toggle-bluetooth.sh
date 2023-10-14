#!/bin/bash

# Check bluetooth status
if bluetoothctl show | grep -q "Powered: yes"; then
  bluetoothctl power off
else
  # bluetooth is off, so turn it on
  bluetoothctl power on
fi
