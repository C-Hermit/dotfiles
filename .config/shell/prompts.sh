# !/usr/bin/sh
# .config/shell/profile.sh
# @author hermit
# @since 2026
# set universal prompts

# 检查是否安装了 starship
if command -v starship &>/dev/null; then
  if [ -n "$ZSH_VERSION" ]; then
    eval "$(starship init zsh)"
  elif [ -n "$BASH_VERSION" ]; then
    eval "$(starship init bash)"
  else
    # 兜底方案，使用 $SHELL（适用于 fish 等情况，前提是默认 SHELL 匹配）
    eval "$(starship init $(basename "$SHELL"))"
  fi
fi
