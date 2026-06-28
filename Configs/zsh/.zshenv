# XDG_CONFIG_HOME path 
if [[ -z "$XDG_CONFIG_HOME" ]] then 
  export XDG_CONFIG_HOME="$HOME/.config"
fi

export PATH="$HOME/.local/bin:$PATH"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export EDITOR="nvim"
export VISUAL="nvim"
# Vite+ bin (https://viteplus.dev)
. "$HOME/.vite-plus/env"
