#!/bin/bash

# 1. 终止实例
killall -q polybar

# 2. 关键补丁：等待老进程彻底死掉
# 否则在 i3 重启 ($mod+Shift+r) 时，新进程可能抢不过老进程的残留
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. 启动 (确保名字与 config.ini 一致)
polybar mybar 2>&1 | tee /tmp/polybar.log &
disown

echo "Polybar launched..."
