#!/bin/bash

UDEV=1

echo "Container's IP address: `awk 'END{print $1}' /etc/hosts`"
printf "Host IP is: $(hostname -I|cut -d " " -f1)\n"
udevadm control --reload
cp -f /usr/src/app/*.ipynb /data
cp -f /usr/src/app/*.py /data
ln -s /data /work/notebooks/data

libcamera-hello --list-cameras -n -v
libcamera-still -n -o /data/start.jpg
jupyter lab --LabApp.token='' --notebook-dir=/work/notebooks --port=8081 --no-browser --ip=0.0.0.0 --allow-root
sleep infinity
