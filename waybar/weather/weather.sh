#!/bin/bash
city="Carmagnola"
# Check Weather Status
weather=$(curl -s wttr.in/$city | sed -n '4s/\x1B\[[0-9;]*m//g; 3p' | sed 's/^[ \t]*//')
temp=$(curl -s wttr.in/$city | sed -n '4p' | grep -oE '[+-]?[0-9]+' | tail -n 3 | head -n 1)

case "$weather" in
  "Unavailable")
    echo "Service Unavailable."
    WEATHER_STATUS="󱓤"
    ;;
  "Sunny")
    echo "It's a sunny day."
    WEATHER_STATUS=""
    ;;
  "Clear")
    echo "It's clear."
    WEATHER_STATUS="󰖔"
    ;;
  "Cloudy")
    echo "It's a cloudy day."
    WEATHER_STATUS=""
    ;;
  "Rainy" | "Light rain")
    echo "It's a rainy day."
    WEATHER_STATUS="󰖗"
    ;;
  "Partly cloudy")
    echo "It's partly cloudy."
    WEATHER_STATUS="󰖕"
    ;;
  "Mist" | "Fog")
    echo "It's misty"
    WEATHER_STATUS="󰖑"
    ;;
esac

echo '{"text": "Weather: '$WEATHER_STATUS'","tooltip": "City: '$city'\nWeather: '$weather'\nTemp: '$temp' °C"}'
