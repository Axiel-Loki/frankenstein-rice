#!/usr/bin/env bash

# Pega brilho atual e máximo
CURRENT=$(brightnessctl get)
MAX=$(brightnessctl max)

PERCENT=$(( CURRENT * 100 / MAX ))

echo "BRIL: $PERCENT"