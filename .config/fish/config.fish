# ログイン時に表示するテキスト
set fish_greeting 

# theme 
starship init fish | source
# set -g theme_color_scheme terminal
# set -g fish_prompt_pwd_dir_length 1
# set -g theme_display_user no
# set -g theme_display_hostname no
# set -g theme_display_git_default_branch yes

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
alias rr "cd (git rev-parse --show-toplevel)"
alias cg "chatgpt-cli -ml"
alias cfg "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias vsc "code ."
alias wq "code ~/Documents/qnotes"
alias history "history --show-time='%Y-%m-%d %H:%M:%S '"
alias cdq "cd ~/Documents/qnotes"
command -qv nvim && alias vim nvim

# aliases for my func
alias sug "setup_git"
alias ira "init_react_app"
alias qs "qiita_select"
alias obs "obsidian_select"
alias qnote "obsidian_quick_note"
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

