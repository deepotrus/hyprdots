#!/bin/bash

# Prompt for the city
read -p "Enter the city: " city

# run in silent mode with -s to avoid download process, use the city AND Map color to terminal first 16 colors (for pywal)
curl -s "wttr.in/$city" | sed -e 's/\x1b\[38;5;226m/\x1b\[38;5;3m/g' -e 's/\x1b\[38;5;190m/\x1b\[38;5;6m/g' -e 's/\x1b\[38;5;082m/\x1b\[38;5;1m/g' -e 's/\x1b\[38;5;250m/\x1b\[38;5;7m/g' -e 's/\x1b\[38;5;154m/\x1b\[38;5;5m/g' -e 's/\x1b\[38;5;118m/\x1b\[38;5;4m/g' -e 's/\x1b\[38;5;220m/\x1b\[38;5;11m/g' -e 's/\x1b\[38;5;046m/\x1b\[38;5;11m/g'
