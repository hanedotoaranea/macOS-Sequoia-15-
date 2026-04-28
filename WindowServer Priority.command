sudo tee /usr/local/bin/renice_windowserver.sh > /dev/null << 'EOF'
#!/bin/bash
PID=$(pgrep WindowServer)
if [ -n "$PID" ]; then
    renice -20 -p "$PID"
fi
EOF
sudo chmod +x /usr/local/bin/renice_windowserver.sh

sudo tee /Library/LaunchDaemons/com.local.windowserver.renice.plist > /dev/null << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.local.windowserver.renice</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/renice_windowserver.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>LaunchOnlyOnce</key>
    <true/>
</dict>
</plist>
EOF
sudo chmod 644 /Library/LaunchDaemons/com.local.windowserver.renice.plist
sudo chown root:wheel /Library/LaunchDaemons/com.local.windowserver.renice.plist
sudo launchctl load -w /Library/LaunchDaemons/com.local.windowserver.renice.plist
