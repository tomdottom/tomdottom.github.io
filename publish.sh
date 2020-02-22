#!/bin/bash -e

TMP_DIR=$(mktemp -d)

function build() {
    echo "Building"
    if [[ ! -d "./node_modules" ]]
    then
        yarn install --pure-lockfile
    fi

    yarn run eleventy build --output "$TMP_DIR/dist/"
    cp rsync-exclude.txt "$TMP_DIR/"
}

function stash() {
    echo "Stashing"
    set +e
    git stash --all | grep -q "No local changes to save"
    set -e
    STASH=$?
    echo "$STASH"
}

function publish() {
    echo "Publishing"
    git co master
    rsync -avc --delete --exclude-from="$TMP_DIR/rsync-exclude.txt" "$TMP_DIR/dist/" "./"
    git add --all
    git commit -m "content(): Update on $(date --iso-8601='date')"
    git push
}

function finish() {
    echo "Finishing "
    git clean -xfd
    git co src
    echo "$STASH"
    if [[ $STASH -eq 0 ]]
    then
        git stash pop
    fi
}
trap finish EXIT


function main() {
    echo "Main"
    build
    stash
    publish
}

main
