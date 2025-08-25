#!/bin/bash

# Get GPU usage and temperature from nvidia-smi
# The output is like "35, 55" (usage, temp)
STATS=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits)

# If nvidia-smi fails, show an error
if [ -z "$STATS" ]; then
  echo '{"text": "N/A", "tooltip": "nvidia-smi failed"}'
  exit 1
fi

GPU_USAGE=$(echo "$STATS" | awk -F', ' '{print $1}')
GPU_TEMP=$(echo "$STATS" | awk -F', ' '{print $2}')

# Format for Waybar
echo "{\"text\": \"GPU: ${GPU_USAGE}%\", \"tooltip\": \"NVIDIA GPU\nTemp: ${GPU_TEMP}°C\"}"
