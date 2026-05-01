#!/bin/bash

# 获取当前模式
CURRENT=$(powerprofilesctl get)

# 定义循环逻辑
case "$CURRENT" in
"power-saver")
  powerprofilesctl set balanced
  ;;
"balanced")
  powerprofilesctl set performance
  ;;
"performance")
  powerprofilesctl set power-saver
  ;;
*)
  powerprofilesctl set balanced
  ;;
esac

# 触发 Polybar 刷新（如果你开启了 IPC）
polybar-msg action "#power-profile.module_refresh" 2>/dev/null || true
