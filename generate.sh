#!/bin/bash

git_pull () {
   cd $1
   git clean -f -d
   git reset --hard
   git checkout $2
   git reset --hard origin/$2
   git pull
   cd ..
}

git_push () {
    cd $1
    git add .
    git commit -am 'Update card images by https://github.com/mycard/ygopro-images-generator'
    git push
    cd ..
}

git_pull ygopro-database build
git_pull ygopro-images-raw master

for locale in locales/*.yml; do
    locale=$(basename "${locale}" .yml)
    git_pull ygopro-images ${locale}
    rm -rf ygopro-images-${locale} mse-set
    ./generate.rb ${locale}
    if [ ! -f mse-sets/data0-${locale}.mse-set ]; then # skip if no cards updated.
        continue
    fi
    for set in mse-sets/data*-${locale}.mse-set; do
        echo ${set}
        wine32 magicseteditor/mse.com --export "${set}" "ygopro-images-${locale}/{card.gamecode}.png"
    done
    for image in ygopro-images-${locale}/*.png; do
        id=$(basename "${image}" .png)
        convert "${image}" -colorspace RGB -resize 177x254 -colorspace sRGB "ygopro-images/${id}.jpg"
        convert "${image}" -colorspace RGB -resize 44x64 -colorspace sRGB "ygopro-images/thumbnail/${id}.jpg"
    done
    git_push ygopro-images
done

