# --- Отключение airportd (Wi-Fi демон) ---
sudo launchctl disable system/com.apple.airportd

# --- Настройки прокрутки ---
defaults write -g CGDisableCoalescingScrollEvents -bool true
defaults write -g NSScrollAnimationEnabled -bool true
defaults write -g com.apple.scrollwheel.scaling -float 1.0

# --- Отключение mediaanalysisd (системный + пользовательский домен) ---
sudo launchctl disable system/com.apple.mediaanalysisd
launchctl disable gui/$(id -u)/com.apple.mediaanalysisd
sudo pkill -f mediaanalysisd

# --- Отключение managedappdistribution.xpc (без bootout, чтобы не ловить ошибку) ---
sudo launchctl disable system/com.apple.managedappdistribution.xpc

# --- Отключение индексации Spotlight (рабочий способ вместо unload) ---
sudo mdutil -a -i off

# --- Отключение ContextStoreAgent (системный + пользовательский домен) ---
sudo launchctl disable system/com.apple.ContextStoreAgent
launchctl disable gui/$(id -u)/com.apple.ContextStoreAgent

# --- MTU 9000 (Jumbo Frames) — только если вся сеть поддерживает ---
sudo ifconfig en0 mtu 9000

mdutil -s /                          # должно быть "Indexing disabled"
launchctl print-disabled system | grep -E "airportd|mediaanalysisd|ContextStore|managedapp"  # покажет disabled
ifconfig en0 | grep mtu              # покажет mtu 9000 (если применилось)
