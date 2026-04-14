# .config/shell/aliases.sh
# @author hermit
# @since 2026
# general aliases for bash/zsh

[ ! $UID -eq 0 ] && command -v nvim >/dev/null &&
  [ -z "$DVTM" ] && [ -z "$TERM_PROGRAM" ] &&
  alias vim="nvim" vimdiff="nvim -d"

alias heartstow='stow -S --adopt -d "${HOME}/data/heart"  -t "$HOME" . && echo "heart is stowed"'
alias heartrest='stow -R --adopt -d "${HOME}/data/heart"  -t "$HOME" . && echo "heart is restowed"'
alias heartunst='stow -D -d "${HOME}/data/heart"  -t "$HOME" . && echo "heart is unstowed"'

alias hosts='sudo wget https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts -O /etc/hosts'

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
