function init_react_app
  echo "Type application name: " && read name;
  npx create-react-app {$name} --template typescript

  cd {$name}
  gsed -i 25,30d package.json
  npm i -D prettier eslint-config-prettier eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-import eslint-plugin-unused-imports @typescript-eslint/eslint-plugin @typescript-eslint/parser
  curl -O https://raw.githubusercontent.com/sfurukawa7/my-first-app/develop/.prettierrc
  curl -O https://raw.githubusercontent.com/sfurukawa7/my-first-app/develop/.eslintrc.js
  echo node_modules/ > .gitignore
  echo "Will you make git repo? <y/n>:" && read make_git_repo
  switch $make_git_repo
    case y Y yes Yes
      echo "Making git repo: $name ..."
      setup_git $name
    case '*'
      echo "Successfully end init React App!"
  end
end
