#!/bin/bash

git_update () {
   cd $1
   git add -f .
   git reset --hard
   git checkout $2
   git reset --hard origin/$2
   git pull
   cd ..
}

git_update ygopro-database build
git_update ygopro-images-raw master

for filename in locales/*.yml; do
    locale=$(basename "$filename" .yml)
    git_update ygopro-images ${locale}
    ruby generator.rb ${locale}
    cd ygopro-images
    git commit -am 'Update card images'
    #git push
    cd ..
done
