#!/bin/bash

UDEV=1

echo "Container's IP address: `awk 'END{print $1}' /etc/hosts`"
udevadm control --reload
libcamera-hello --list-cameras -n -v
jupyter lab --notebook-dir=/work/notebooks --port=8081 --no-browser --ip=0.0.0.0 --allow-root
sleep infinity
