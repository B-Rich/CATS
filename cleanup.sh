#!/usr/bin/env bash
CATS_GIT_STORAGE='/srv/cats-git'
HTTP_USER=apache
cd "$CATS_GIT_STORAGE/contests"
for dir in `ls ./`
do
    echo "Cleaning repos $dir"
    cdir="clone_$dir"
    git clone $dir $cdir
    (cd $cdir && git gc --aggressive --prune && git config receive.denyCurrentBranch ignore)
    rm -r $dir
    mv $cdir $dir
    chown -R $HTTP_USER:$HTTP_USER $dir
done

cd "$CATS_GIT_STORAGE/problems"
for dir in `ls ./`
do
    echo "Cleaning repos $dir"
    cdir="clone_$dir"
    git clone $dir $cdir
    (cd $cdir && git gc --aggressive --prune)
    rm -r $dir
    mv $cdir $dir
    chown -R $HTTP_USER:$HTTP_USER $dir
done
