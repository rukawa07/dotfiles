# ログイン時に表示するテキスト
set fish_greeting 

set -gx TERM xterm-256color

# theme (bobthefish)
set -g theme_color_scheme terminal
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user no

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias ts "tmux new -s"
alias ta "tmux a -t"
alias td "tmux kill-session -t"
alias tl "tmux ls"
alias g git
alias code "open . -a Visual\ Studio\ Code"
alias buvss "cp ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/keybindings.json ~/.config/Code/User"
alias config "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
command -qv nvim && alias vim nvim

# aliases for my func
alias sug "setup_git"
alias ira "init_react_app"
alias obs "obsidian_select"
alias qnote "obsidian_quick_note"
 
# set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# exa
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end
 
# Flutter
set -gx PATH /Users/sfurukawa/flutter/bin $PATH

# PostgreSQL
set -gx PGDATA /usr/local/var/postgres

# homebrewのauto-updateを停止 
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH
source (pyenv init - | psub)

# mdpdf
set -gx MDPDF_STYLES /Users/sfurukawa/.config/mdpdf/github-markdown-light.css

# XDG Base Directory
set -gx XDG_CONFIG_HOME ~/.config

