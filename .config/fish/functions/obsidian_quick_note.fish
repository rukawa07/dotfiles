function obsidian_quick_note
  if test "$argv" = ""
    nvim /Users/sfurukawa/Obsidian/QuickNote/(date "+%Y%m%d_%H%M%S")\.md
  else
    echo "# $argv" > /Users/sfurukawa/Obsidian/QuickNote/{$argv}\.md
    nvim /Users/sfurukawa/Obsidian/QuickNote/{$argv}\.md
  end
end
