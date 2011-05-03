#!/usr/bin/env bash
CATS_GIT_STORAGE='/srv/cats-git'
cd "$CATS_GIT_STORAGE/contests"
for dir in `ls ./`
do
    echo "Cleaning repos $dir"
    cdir="clone_$dir"
    git clone $dir $cdir
    (cd $dir && git gc --aggressive --prune)
    rm -r $dir
    mv $cdir $dir
done
