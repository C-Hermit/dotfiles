#!/bin/bash

# 获取当前模式
MODE=$(powerprofilesctl get)

# 根据模式设置图标和颜色
case "$MODE" in
"power-saver")
  # 使用 󰌪 (nf-md-leaf)
  echo "%{F#A3BE8C}󰌪 Saver%{F-}"
  ;;
"balanced")
  # 使用 󰗑 (nf-md-power_settings) 或 󱎔
  echo "%{F#EBCB8B}󰗑 Bal%{F-}"
  ;;
"performance")
  # 使用 󰓅 (nf-md-speedometer)
  echo "%{F#BF616A}󰓅 Perf%{F-}"
  ;;
*)
  echo "$MODE"
  ;;
esac
