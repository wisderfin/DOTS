# Запуск hiddify(vpn)

#!/bin/bash
xhost +local:
export DISPLAY=:0
sudo -E /usr/bin/hiddify
