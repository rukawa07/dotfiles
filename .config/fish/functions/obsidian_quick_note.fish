function obsidian_quick_note
  if test "$argv" = ""
    nvim /Users/sfurukawa/Obsidian/MyVault/QuickNotes/(date "+%Y%m%d_%H%M%S")\.md
  else if test -e /Users/sfurukawa/Obsidian/MyVault/QuickNotes/{$argv}\.md
    nvim /Users/sfurukawa/Obsidian/MyVault/QuickNotes/{$argv}\.md
  else
    echo "# $argv" > /Users/sfurukawa/Obsidian/MyVault/QuickNotes/{$argv}\.md
    nvim /Users/sfurukawa/Obsidian/MyVault/QuickNotes/{$argv}\.md
  end
end
