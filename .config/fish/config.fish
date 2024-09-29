# ログイン時に表示するテキスト
set fish_greeting 

# theme 
starship init fish | source

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
alias bat "bat --theme=Nord"
alias g git
alias t tig
alias rr "cd (git rev-parse --show-toplevel)"
alias cfg "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias vsc "code ."
alias wq "code ~/Documents/qnotes"
alias history "history --show-time='%Y-%m-%dT%H:%M:%S '"
command -qv nvim && alias vim nvim

# aliases for my func
alias sug "setup_git"
alias ira "init_react_app"
alias qs "qiita_select"
alias obs "obsidian_select"
alias note "obsidian_quick_note"
alias mkcmp "make_react_component"
alias mkghrr "make_github_remote_repo"
alias color "sh $HOME/.config/fish/functions/show_256_terminal_colors.sh"

# eza
if type -q eza
  alias ll "eza -l -g --icons --group-directories-first"
  alias lla "ll -a"
end

# IDEのように括弧やクォートのペアを補完
set -U pisces_pairs $pisces_pairs '<,>' '[,]' '{,}' '(,)' '`,`' '","' "','" 

# homebrew
set -gx HOMEBREW_NO_AUTO_UPDATE 1
eval "$(/opt/homebrew/bin/brew shellenv)"

# mdpdf
set -gx MDPDF_STYLES /Users/sfurukawa/.config/mdpdf/github-markdown-light.css

# XDG Base Directory
set -gx XDG_CONFIG_HOME ~/.config

# fzf
if type -q fzf
  set -gx FZF_DEFAULT_OPTS '--color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'
  fzf --fish | source
end

# ---------- PATH ----------

fish_add_path bin 
fish_add_path ~/bin 
fish_add_path ~/.local/bin 
fish_add_path /usr/local/bin

# Android Studio
set -gx ANDROID_SDK /Users/sfurukawa/Library/Android/sdk
fish_add_path $ANDROID_SDK/platform-tools
fish_add_path $ANDROID_SDK/emulator

# volta
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path "$VOLTA_HOME/bin" 

# tmux sessionにアタッチ（VSCode taskでも実行されるので一旦オフ）
# attach_tmux_session

