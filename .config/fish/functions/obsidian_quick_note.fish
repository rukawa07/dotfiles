function obsidian_quick_note
  if test "$argv" = ""
    nvim ~/Obsidian/MyVault/QuickNotes/(date "+%Y%m%d_%H%M%S")\.md
  else if test -e ~/Obsidian/MyVault/QuickNotes/{$argv}\.md
    nvim ~/Obsidian/MyVault/QuickNotes/{$argv}\.md
  else
    nvim ~/Obsidian/MyVault/QuickNotes/{$argv}\.md
  end
end
