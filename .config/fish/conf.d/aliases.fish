#!/usr/bin/fish
#@author hermit
#since 2025
#aliases for fish

command -v nvim >/dev/null && [ -z "$DVTM" ] && alias vim="nvim" && alias vimdiff="nvim -d"

if status is-interactive

	# stow alias
	alias heartstow='cd ~/doc/heart && stow -t ~ . --adopt && cd - && echo "heart is stow" '
	alias heartunstow='cd ~/doc/heart && stow -D -t ~ . && cd - && echo "heart is unstow" '
	alias heartrestow='cd ~/doc/heart && stow -R -t ~ . && cd -  && echo "heart is restow" '

end
