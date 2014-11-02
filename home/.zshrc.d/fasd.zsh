if hash fasd 2>/dev/null; then
  eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
  alias v="f -e vim"
fi
