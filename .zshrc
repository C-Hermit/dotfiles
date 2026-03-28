# zshrc
# @author hermit
# @since 2026

autoload -U compinit # enable programmable completion
zstyle ':completion:*' menu select # arrow-key driven
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-Z}' # case insensitive
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # dircolors
zstyle ':completion:*:processes' command 'NOCOLORS=1 ps -U $(whoami)|sed "/ps/d"' # all processe owned by $USER,instead of current session
zstyle ':completion:*:processes' sort false # remain correct PID order
zstyle ':completion:*:processes-names' command 'NOCOLORS=1 ps xho command|sed "s/://g"' #more process name with 'killall'
zstyle ':completion:*' cache_path "$XDG_CACHE_HOME"/zsh/zcompdump
zstyle ':completion:*' list-prompt '' # no "do you wish to see all..."
zstyle ':completion:*' select-prompt '' # no "do you wish to see all..."
zmodload zsh/complist 
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump #move cache out of home
_comp_option+=(globdots) #glob hidden files

autoload -U colors && colors
[ -f "$HOME/.config/dircolors" ] && source <(dircolors "$HOME/.config/dircolors")

SHELL_CONFIG="$HOME/.config/shell"
[ -f "$SHELL_CONFIG/aliases.sh" ] && . "$SHELL_CONFIG/aliases.sh"
[ -f "$SHELL_CONFIG/teleport.sh" ] && . "$SHELL_CONFIG/teleport.sh"
[ -f "$SHELL_CONFIG/functions.sh" ] && . "$SHELL_CONFIG/functions.sh"
[ -f "$SHELL_CONFIG/prompts.sh" ] && . "$SHELL_CONFIG/prompts.sh"

ZSH_CONFIG="$HOME/.config/zsh"
[ -f "$ZSH_CONFIG/aliases.zsh" ] && . "$ZSH_CONFIG/aliases.zsh"
[ -f "$ZSH_CONFIG/functions.zsh" ] && . "$ZSH_CONFIG/functions.zsh"
[ -d "$ZSH_CONFIG/completions" ]&& \
	for completion in $ZSH_CONFIG/completion/*; do . "$completion";done

HISTSIZE=2000
SAVEHIST=40000
setopt INC_APPEND_HISTORY #SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# eval "$(starship init zsh)"
