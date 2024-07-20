#!/bin/sh

wallpaper=$(sxiv -t -o ~/pix | xargs echo)

wal -c
wal -i $wallpaper
swww img $wallpaper --transition-step 30 --transition-fps 30

. ~/.local/bin/yaml_toml.sh

wal-telegram -g
