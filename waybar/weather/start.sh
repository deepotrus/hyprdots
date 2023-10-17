#!/bin/bash

# -e runs the script in the new opened terminal
kitty -e /bin/bash -c '~/.config/waybar/weather/ask-weather.sh; read -p "Press any key to exit > " -n1 junk'

