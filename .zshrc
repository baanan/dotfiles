# start oh my posh
eval "$(oh-my-posh init zsh --config ~/.config/omp/takuya.omp.json)"

# aliases
mkcdir () {
	mkdir -p -- "$1" &&
		cd -P -- "$1"
}

alias ls="exa --icons"
alias ll="exa --icons --long --header"
alias la="exa --icons --long --header --all"
alias lt="exa --icons --tree"
alias lstrue="/bin/ls"
