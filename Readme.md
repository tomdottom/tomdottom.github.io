# TomDotTom

## Setup

    yarn install

## Dev

    ./dev.sh

## Build

    ./build.sh

## Deploy

    TMP_DIR=$(mktemp -d)
    cp -r dist/* $TMP_DIR/
    git co master
    rsync -avu --delete $TMP_DIR ./
    git add --all
    git commit -m 'content(): Update ....'
    git push
