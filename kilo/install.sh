#!/bin/sh

set -e

DEST=$HOME'/.config/kilo'

echo "Installing Kilo config..."

mkdir -p $DEST
mkdir -p $DEST/instructions

cp kilo.jsonc $DEST/
cp -r instructions $DEST/

echo "All done !"