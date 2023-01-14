function make_github_remote_repo
  set cdn (basename (pwd))
  # パラメータチェック
  if test "$argv" = ""
    # パラメータが入力されていない場合
# カレントディレクトリ名をリポジトリ名にするか確認
    read --prompt "echo 'Do you use the current directory name ('$cdn') as the repository name?[Y/n]: '" answer;
    if test $answer = "Y"
      set name $cdn
    else
# stdinで入力
      set name ""
      while test $name = ""
        read --prompt "echo 'Type repository name: '" name;
      end
    end
  else
    set name $argv 
  end
  echo $name "repository will be created..."
  read --prompt "echo 'Type repository description: '" description;
  gh repo create {$name} --description {$description} --private;
  git remote add origin https://github.com/sfurukawa7/{$name}.git; 
  git switch -c develop;
  git push -u origin develop;
end
