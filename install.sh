#!/bin/bash
dname=`realpath $0`
dname=`dirname $dname`
pushd ~/
vimrc=$dname/.vimrc
fonts=$dname/.fonts
gitconfig=$dname/.gitconfig

ln -sf $vimrc ~/
ln -sf $fonts ~/
ln -sf $gitconfig ~/


name=edit.inputrc
org=$dname/$name
ini=~/.ini/$name
dst=~/
cp -fp $org $ini
ln -sf $ini $dst

popd

