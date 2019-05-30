if [ -z $1 ]; then
  echo 'Please provide module name'
else
  if [ -d src/assets/scripts/cc_modules/$1 ]; then
    rm -rf src/assets/scripts/cc_modules/$1
  fi
  npm i --save --prefix src/assets/scripts/ git+ssh://git@code.vipkid.com.cn:3590/edu/cc-game/infra/$1.git
  mkdir -p src/assets/scripts/cc_modules
  mv src/assets/scripts/node_modules/* src/assets/scripts/cc_modules
  echo Removing src/assets/scripts/node_modules
  if [ -z "$(ls -A src/assets/scripts/node_modules)" ]; then
    rm -rf src/assets/scripts/node_modules
    echo Done!
  else
    echo src/assets/scripts/node_modules is not empty!
  fi
fi