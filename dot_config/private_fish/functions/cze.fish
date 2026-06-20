function cze --description 'chezmoi管理ファイルをfzfで選んで編集'
    set foo (chezmoi managed --path-style absolute | fzf-tmux -p 75% --layout reverse --preview 'bat --color=always {}')
    if test "$foo" != ""
        chezmoi edit "$foo"
    else
        return 1
    end
end
