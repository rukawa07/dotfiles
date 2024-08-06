function select_in_history
  history|fzf --layout reverse|string split " "|tail -n +3|string join " "|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
