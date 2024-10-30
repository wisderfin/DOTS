# Очистка памяти от мусора

#!/bin/bash

LOG_FILE="$HOME/cleanup.log"
INITIAL_FREE_SPACE=$(df -BG --output=avail / | tail -n 1 | tr -d 'G' | cut -c3-)

run_silently() {
    yes | "$@" > /dev/null 2>&1
}

log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

echo "Free space before cleanup: ${INITIAL_FREE_SPACE}G"
log_action "Started cleanup process"

# Удаление кэша, игнорируя .cache/chromium
echo "Clearing application cache..."
find ~/.cache ! -path ~/.cache/chromium* -type f -exec rm -f {} + -exec log_action "Removed cache file: {}" \;
log_action "Application cache cleared"

# Очистка кэша pacman
echo "Clearing pacman cache..."
sudo pacman -Sc --noconfirm > /dev/null 2>&1
log_action "Pacman cache cleared"

# Удаление временных файлов
echo "Clearing temporary files..."
sudo rm -rf ~/../../tmp/* > /dev/null 2>&1
sudo rm -rf ~/../../var/tmp/* > /dev/null 2>&1
log_action "Temporary files cleared"

# Удаление логов
echo "Clearing system logs..."
sudo rm -rf ~/../../var/log/* > /dev/null 2>&1
log_action "System logs cleared"

# Очистка корзины
echo "Clearing trash..."
sudo rm -rf ~/.local/share/Trash/* > /dev/null 2>&1
log_action "System trash cleared"

# Очистка журнала systemd
echo "Clearing journalctl logs..."
sudo journalctl --vacuum-time=2weeks > /dev/null 2>&1
log_action "Journalctl logs cleared"

# Удаление неиспользуемых зависимостей
echo "Removing unused dependencies..."
sudo pacman -Rns $(pacman -Qdtq) --noconfirm > /dev/null 2>&1
log_action "Unused dependencies removed"

# Вычисление свободного пространства после очистки
FINAL_FREE_SPACE=$(df -BG --output=avail / | tail -n 1 | tr -d 'G' | cut -c3-)
FREED_SPACE=$((FINAL_FREE_SPACE - INITIAL_FREE_SPACE))

# Вывод информации о свободном пространстве после очистки
echo "Free space after cleanup: ${FINAL_FREE_SPACE}G"
echo "Total space freed: ${FREED_SPACE}G"
log_action "Cleanup process completed"

echo "Cleanup completed. Log saved to $LOG_FILE."
