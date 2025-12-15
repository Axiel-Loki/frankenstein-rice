#!/usr/bin/env bash

# Pega brilho atual e máximo
# CURRENT=$(brightnessctl get)
# MAX=$(brightnessctl max)
# 
# PERCENT=$(( CURRENT * 100 / MAX ))
# 
# echo "BRIL: $PERCENT"

# New Script #

#!/bin/bash

# Lista dispositivos de brilho disponíveis
# brightnessctl -l

# Para Intel (comum)
device="intel_backlight"

# Para laptops
# device="acpi_video0"

# Tenta diferentes dispositivos
if brightnessctl -d $device info > /dev/null 2>&1; then
    current=$(brightnessctl -d $device get)
    max=$(brightnessctl -d $device max)
else
    # Tenta dispositivo genérico
    current=$(brightnessctl get 2>/dev/null || echo 0)
    max=$(brightnessctl max 2>/dev/null || echo 100)
fi

if [ "$max" -eq 0 ]; then
    max=100
fi

percent=$((current * 100 / max))

if [ "$percent" -lt 34 ]; then
    icon="󰃞"
elif [ "$percent" -lt 67 ]; then
    icon="󰃟"
else
    icon="󰃠"
fi

echo "{\"text\":\"$icon\", \"percentage\":$percent, \"tooltip\":\"Brilho: $percent%\"}"