sudo launchctl disable system/com.apple.airportd
defaults write -g CGDisableCoalescingScrollEvents -bool true
defaults write -g NSScrollAnimationEnabled -bool true 
sudo launchctl disable system/com.apple.mediaanalysisd
sudo pkill -f mediaanalysisd
sudo launchctl disable system/com.apple.managedappdistribution.xpc
sudo launchctl bootout system/com.apple.managedappdistribution.xpc
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
sudo mdutil -a -i off
sudo launchctl disable system/com.apple.ContextStoreAgent
launchctl disable user/$(id -u)/com.apple.ContextStoreAgent
sudo launchctl disable system/com.apple.mediaanalysisd
sudo pkill -f mediaanalysisd
sudo ifconfig en0 mtu 3000






