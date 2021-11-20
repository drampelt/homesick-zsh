export FZF_DEFAULT_COMMAND="fd ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d ."

# export FZF_DEFAULT_COMMAND='git ls-tree -r --name-only HEAD 2>/dev/null || fd' # --type -f if you want only files
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# From https://github.com/silvanocerza/dotfiles/blob/d3cf4ed770f18ba81a9059f7dd93dc3a97381239/zsh/zshrc#L44-L55
# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
export FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\/.*;\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
