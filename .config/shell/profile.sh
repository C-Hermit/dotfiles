# !/usr/bin/sh
# .config/shell/profile.sh
# @author hermit
# @since 2026
# set universal ENV, use `/bin/sh`(-> `/bin/dash`) for better efficiency

[ "$UID" -eq 0 ] || umask 022 # dir/file:755/644

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:${PATH}"
[ -d "$HOME/.local/sbin" ] && export PATH="$HOME/.local/sbin:${PATH}"

export TERM=alacritty
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export EDITOR="/usr/bin/nvim"
export PAGER="/usr/bin/less"
export DVTM_EDITOR="/usr/bin/vim"
export DVTM_PAGER="/usr/bin/less -R"
export BROWSER="firefox"

export XDG_DOWNLOAD_DIR="$HOME/data/dls"
export XDG_DOCUMENTS_DIR="$HOME/data/doc"
export XDG_MUSIC_DIR="$HOME/data/mus"
export XDG_PICTURES_DIR="$HOME/data/pic"
export XDG_VIDEOS_DIR="$HOME/data/vid"

export XDG_CONFIG_HOME="$HOME/.config"    # analogous to /etc
export XDG_CACHE_HOME="$HOME/.cache"      # analogous to /var/cache
export XDG_DATA_HOME="$HOME/.local/share" # analogous to /usr/share
export XDG_STATE_HOME="$HOME/.local/state"

# Qt 应用（Pot）自动缩放
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# 允许自动缩放
# export GDK_SCALE=1
# 告诉 GTK 应用使用 2 倍缩放
# export GDK_SCALE=2
# 修正字体大小，避免 2 倍缩放后字体过大
# export GDK_DPI_SCALE=0.5

# Fcitx5 - X11 环境通用配置
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
