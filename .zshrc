export PATH=$HOME/bin:/usr/local/bin:$HOME/.opam/default/bin:$HOME/.local/bin:/usr/local/go/bin:$HOME/go/bin:$PATH

alias nvimd="$HOME/projects/neovim/build/bin/nvim"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export CDPATH="$HOME/projects:..:$CDPATH"

# keybinds
function tmux-sessionizer {
    $($HOME/.local/bin/tmux-sessionizer.sh)
}

zle -N tmux-sessionizer

bindkey '^o' tmux-sessionizer
