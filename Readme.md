# TomDotTom

## Setup

    yarn install

## Dev

    ./dev.sh

## Build

    ./build.sh

## Deploy

    TMP_DIR=$(mktemp -d)
    cp -r dist/ $TMP_DIR/
    cp rsync-exclude.txt $TMP_DIR/
    git co master
    rsync -avu --delete --exclude-from="$TMP_DIR/rsync-exclude.txt" "$TMP_DIR" "./"
    git add --all
    git commit -m 'content(): Update ....'
    git push