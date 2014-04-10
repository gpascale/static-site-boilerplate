if [[ $# -eq 0 ]] ; then
    echo 'A name for your project is required'
    exit 1
fi

PROJECT_NAME=$1

#!/bin/sh
echo "Creating necessary folders..."
mkdir ./src
mkdir ./src/js
mkdir ./src/less
mkdir ./src/templates
mkdir ./ext
mkdir ./assets

echo "Copying code, markup and CSS boilerplate..."
repl="s/##PROJECT_NAME##/${PROJECT_NAME}/g"
sed -e $repl ./templates/package.json > ./package.json
sed -e $repl ./templates/Gruntfile.js > ./Gruntfile.js
sed -e $repl ./templates/.gitignore > ./.gitignore
sed -e $repl ./templates/index.html > ./src/index.html
cp ./templates/HelloWorld.js "./src/js/$1.js"
cp ./templates/HelloWorld.less "./src/less/$1.less"
cp ./templates/extJs/*.js ./ext/js/
cp ./templates/CNAME ./src/CNAME
cp ./templates/app.js ./app.js

echo "Setting up dependencies from NPM..."
npm install

echo "Removing stuff you don't want..."
rm -rf .git
rm -rf templates
echo "Welcome to $1. This is an empty README" > README.md
rm setup.sh

echo "Initializing new git project..."
git init
git add .
git commit -m "Initial Commit"