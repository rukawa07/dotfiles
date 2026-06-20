function obsidian_fleeting
  set -l timestamp (date "+%Y-%m-%dT%H:%M:%S")
  set -l filename
  
  if test "$argv" = ""
    set filename ~/Obsidian/MyVault/Fleeting/(date "+%Y%m%d_%H%M%S")\.md
  else
    set filename ~/Obsidian/MyVault/Fleeting/{$argv}\.md
  end
  
  # frontmatterを含むテンプレートを書き込む
  echo "---" > $filename
  echo "type: fleeting" >> $filename
  echo "created: $timestamp" >> $filename
  echo "author: User" >> $filename
  echo "---" >> $filename
  echo "" >> $filename
  
  nvim +6 -c 'startinsert' $filename
end
