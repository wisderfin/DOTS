# Смена и установка обоев
while true; do
    swaybg -m fill -i "$(find /home/wisderfin/.config/hypr/background/ -type f | shuf -n 1)" &
    sleep 5
    pkill swaybg
done