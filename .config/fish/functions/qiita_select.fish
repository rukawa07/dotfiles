function qiita_select
  set foo (find ~/Documents/qnotes/public -name '*.md' | fzf-tmux -p 75% --layout reverse --preview 'bat --color=always {}')
  if test "$foo" != ""
    nvim "$foo"
  else
    return 1
  end
end
