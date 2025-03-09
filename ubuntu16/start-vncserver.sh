#!/bin/bash

echo -e "${VNC_PASSWORD}\n${VNC_PASSWORD}\nn" | vncpasswd
echo "starting VNC server ..."
vncserver :1 && tail -f /home/dockeruser/.vnc/*.log