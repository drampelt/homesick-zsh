# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Defer initialization of nvm until nvm, node or a node-dependent command is run.
# Ensure this block is only run once if .zshrc gets sourced multiple times by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack' 'coffee' 'gr')
  function __init_nvm() {
    echo "Initializing NVM"
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
    source <(npm completion) # NPM completions
    echo "NVM initialized"
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

