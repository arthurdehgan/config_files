#!/bin/sh

set -e

echo "Installing opencode CLI..."
curl -fsSL https://opencode.ai/install | bash

CC=$HOME'/.config/opencode'
DEST=$CC

echo "Installing opencode config..."

mkdir -p $DEST
mkdir -p $DEST/plugins/caveman

cp opencode.jsonc $DEST/
cp AGENTS.md $DEST/
cp -r agents $DEST/
cp -r commands $DEST/
cp -r skills $DEST/
cp -r plugins/caveman/plugin.js $DEST/plugins/caveman/
cp -r plugins/caveman/caveman-config.cjs $DEST/plugins/caveman/
cp -r plugins/caveman/caveman-parse.cjs $DEST/plugins/caveman/
cp plugins/caveman/package.json $DEST/plugins/caveman/

echo "Installing plugin dependencies..."
cd "$DEST/plugins/caveman"
npm install

echo "All done !"