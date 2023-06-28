# ログイン時に表示するテキスト
set fish_greeting 

# set -gx TERM xterm-256color
# theme (bobthefish)
set -g theme_color_scheme terminal
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user no
set -g theme_display_hostname no
set -g theme_display_git_default_branch yes

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias ts "tmux new -s"
alias ta "tmux a -t"
alias td "tmux detach"
alias tk "tmux kill-session -t"
alias tl "tmux ls"
alias g git
alias rr "cd $(git rev-parse --show-toplevel)"
# alias code "open . -a Visual\ Studio\ Code"
alias buvss "cp ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/keybindings.json ~/.config/Code/User"
alias config "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
command -qv nvim && alias vim nvim

# aliases for my func
alias sug "setup_git"
alias ira "init_react_app"
alias obs "obsidian_select"
alias qnote "obsidian_quick_note"
alias mkcmp "make_react_component"
alias mkghrr "make_github_remote_repo"

# exa
if type -q exa
  alias ll "exa -l -g --icons --group-directories-first"
  alias lla "ll -a"
end

# PostgreSQL
set -gx PGDATA /usr/local/var/postgres

# homebrewのauto-updateを停止 
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# mdpdf
set -gx MDPDF_STYLES /Users/sfurukawa/.config/mdpdf/github-markdown-light.css

# XDG Base Directory
set -gx XDG_CONFIG_HOME ~/.config



# ---------- PATH ----------

fish_add_path bin 
fish_add_path ~/bin 
fish_add_path ~/.local/bin 
fish_add_path /usr/local/bin
 
# Flutter
fish_add_path /Users/sfurukawa/flutter/bin 

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin 
source (pyenv init - | psub)

# Android Studio
set -gx ANDROID_HOME /Users/sfurukawa/.AndroidStudio
set -gx ANDROID_SDK_ROOT /Users/sfurukawa/.AndroidStudio
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin 
fish_add_path $ANDROID_HOME/emulator 

# JAVA
set -gx JAVA_HOME $(/usr/libexec/java_home -v 17)

# react-native
set -gx REACT_EDITOR code

# volta
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path "$VOLTA_HOME/bin" 

# rbenv
status --is-interactive; and rbenv init - fish | source
