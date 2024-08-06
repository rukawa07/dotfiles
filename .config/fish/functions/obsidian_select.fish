function obsidian_select
  set foo (find ~/Obsidian/ -name '*.md' | fzf-tmux -p 75% --layout reverse --preview 'bat --color=always {}')
  if test "$foo" != ""
    nvim "$foo"
  else
    return 1
  end
end
