# 环境变量
set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end
# 终端美化
starship init fish|source
