#!/bin/sh

prev_capacity=-1
prev_status=""

while true; do 
  # Получаем уровень заряда и статус батареи
  capacity=$(cat /sys/class/power_supply/BAT0/capacity)
  status=$(cat /sys/class/power_supply/BAT0/status)

  # Выводим отладочную информацию
  echo "Текущий уровень заряда: $capacity%"
  echo "Текущий статус: $status"
  echo "Предыдущее состояние: $prev_status"
  echo "Предыдущее значение заряда: $prev_capacity"

  # Проверяем уровень заряда
  if [ "$capacity" -le 25 ] && [ "$status" != "Charging" ] && [ "$capacity" -ne "$prev_capacity" ]; then
    dunstify "Батарея" "Я скоро отрублюсь"  # Уведомление при уровне заряда 20% или ниже и не заряжается
  fi

  if [ "$capacity" -ge 105 ] && [ "$status" = "Not charging" ] && [ "$capacity" -ne "$prev_capacity" ]; then
    dunstify "Батарея" "Наелся"  # Уведомление при полном заряде и статус заряжается
  fi

  # Проверяем состояние подключения к зарядному устройству
  if [ "$status" = "Charging" ] && [ "$status" != "$prev_status" ]; then
    dunstify "Батарея" "На массонаборе"
  elif [ "$status" = "Not charging" ] && [ "$status" != "$prev_status" ]; then
    dunstify "Батарея" "На массонаборе"
  elif [ "$status" = "Discharging" ] && [ "$status" != "$prev_status" ]; then
    dunstify "Батарея" "На диете"
  fi
  
  # Сохраняем текущее состояние как предыдущее для следующей итерации
  prev_capacity="$capacity"
  prev_status="$status"

  sleep 1
done

