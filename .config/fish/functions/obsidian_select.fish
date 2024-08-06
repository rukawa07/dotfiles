function obsidian_select
  set foo (find ~/Obsidian/ -name '*.md' | fzf-tmux -p --layout reverse)
  if test "$foo" != ""
    nvim "$foo"
  else
    return 1
  end
end
