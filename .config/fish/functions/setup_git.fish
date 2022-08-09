function setup_git
  git init && git add . && git status && git commit -m "First commit"

  if test "$argv" = ""
    echo "Type repository name: " && read name;
  else
    set name $argv 
  end
  echo $neko
  echo "Type repository description: " && read description;
  gh repo create {$name} --description {$description} --private;
  git remote add origin https://github.com/sfurukawa7/{$name}.git; 
  git checkout -b develop;
  git push -u origin develop;
end
