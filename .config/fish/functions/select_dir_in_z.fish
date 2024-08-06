function select_dir_in_z
  if type -q z
    z -l|fzf --layout reverse|string replace -r '[0-9]+\s*' ''|read foo

    if test -d $foo
      builtin cd $foo
      commandline -r ''
      commandline -f repaint
    end
  end
end
