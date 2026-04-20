# .config/shell/function.sh
# @author hermit
# @since 2026
# general function for bash/zsh

# 定义代理端口（根据你的 Clash 端口修改）
proxy_port="127.0.0.1:7890"

# 开启代理函数
proxy_on() {
  export http_proxy="http://${proxy_port}"
  export https_proxy="http://${proxy_port}"
  export ftp_proxy="http://${proxy_port}"
  export rsync_proxy="http://${proxy_port}"
  export all_proxy="socks5://${proxy_port}"
  export ALL_PROXY="socks5://${proxy_port}"
  echo -e "\033[32m代理已开启: ${proxy_port}\033[0m"
}

# 关闭代理函数
proxy_off() {
  unset http_proxy https_proxy ftp_proxy rsync_proxy all_proxy ALL_PROXY
  echo -e "\033[31m代理已关闭\033[0m"
}

function i3_save_session() {
  echo "🧹 正在清理旧存档..."
  # 清理旧的布局和程序文件，防止残留干扰
  rm -f ~/.i3/i3-resurrect/workspace_*_layout.json
  rm -f ~/.i3/i3-resurrect/workspace_*_programs.json

  echo "📂 正在捕获当前 i3 状态..."

  # 使用 ( $(...) ) 将输出强制拆分为数组，这在 Zsh 中最稳
  # jq -r 确保输出的是原始数字，没有引号
  local ws_array=($(i3-msg -t get_workspaces | jq -r '.[] | .num'))

  # 检查是否有获取到工作区
  if [ ${#ws_array[@]} -eq 0 ]; then
    echo "⚠️ 未发现活动工作区"
    return 1
  fi

  # 遍历数组
  for ws in "${ws_array[@]}"; do
    # 这里的空格和分号要严格
    echo "   -> 存档工作区: $ws"
    i3-resurrect save -n -w "$ws"
  done

  echo "💾 存档程序进程清单..."
  i3-resurrect save --programs-only

  echo "✅ 状态已持久化"
}
i3_restore_session() {
  echo "🔄 正在恢复程序和布局..."
  # 1. 恢复程序
  i3-resurrect restore --programs-only

  # 2. 遍历恢复布局
  for f in ~/.i3/i3-resurrect/workspace_*_layout.json; do
    [ -e "$f" ] || continue
    ws=$(basename "$f" | sed 's/workspace_\([0-9]\+\)_layout.json/\1/')
    echo "   -> 恢复工作区: $ws"
    i3-resurrect restore -n -w "$ws"
  done
  i3-msg workspace 1
}
