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
