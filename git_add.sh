#!/bin/sh

# Добавляем каждый нужный файл или директорию поочерёдно
git add git_add.sh                              # Этот скрипт
git add Code/User/settings.json                 # Конфиг VSCode
git add Code/User/keybindings.json              # Горячие клавиши VSCode
git add Code/User/vscode.css                    # Стили для VSCode
git add Code/User/vscode.js                     # Скрипты VSCode

git add hypr/                                   # Конфиги и скрипты Hyprland
git add kitty/                                  # Конфиг терминала Kitty
git add mako/                                   # Конфиг менеджера уведомлений Mako
git add neofetch/                               # Конфиг neofetch
git add nvum/                                   # Конфиг NeoVIM

git add rofi/                                   # Конфиг менеджера приложений Rofi
git add swaylock/                               # Конфиг менеджера экрана блокировки Swaylock


git add Code/User/Readme.md
git add Code/User/image.png
# Проверка статуса для подтверждения
git status
