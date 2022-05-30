# start oh my posh
eval "$(oh-my-posh init zsh --config ~/.config/omp/takuya.omp.json)"

# aliases
mkcdir () {
	mkdir -p -- "$1" &&
		cd -P -- "$1"
}

alias ls="exa --icons --group-directories-first"
alias ll="ls --long --header"
alias la="ls --long --header --all"
alias lt="ls --tree"
alias lstrue="/bin/ls"
