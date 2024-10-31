#!/bin/bash


while true; do 
    # Проверяем доступность обновлений
    updates=$(pacman -Qu)

    if [ -n "$updates" ]; then
        # Если есть обновления, отправляем уведомление
        dunstify -u normal "arch" "Доступено обновление"
    else
        echo "обновлений нет"
    fi

    sleep 21600
done
