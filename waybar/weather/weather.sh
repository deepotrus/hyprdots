#!/bin/bash
city="Carmagnola"
# Check Weather Status
weather=$(curl -s wttr.in/$city | sed -n 's/.*\x1B\[0m\(.*\)/\1/p' | head -n 1 | sed 's/^[[:space:]]*//')
temp=$(curl -s wttr.in/$city | sed -n '4p' | cut -c 54- | sed -r "s/\x1B\[[0-9;]*[A-Za-z]//g")

case "$weather" in
  "Unavailable")
    echo "Service Unavailable."
    WEATHER_STATUS="󱓤"
    ;;
  "Sunny")
    echo "It's a sunny day."
    WEATHER_STATUS=""
    ;;
  "Cloudy")
    echo "It's a cloudy day."
    WEATHER_STATUS=""
    ;;
  "Rainy")
    echo "It's a rainy day."
    WEATHER_STATUS="󰖗"
    ;;
  "Partly cloudy")
    echo "It's partly cloudy."
    WEATHER_STATUS="󰖕"
    ;;
esac

echo '{"text": "Weather: '$WEATHER_STATUS'","tooltip": "City: '$city'\nWeather: '$weather'\nTemp: '$temp'"}'
