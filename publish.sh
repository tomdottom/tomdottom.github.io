#!/bin/bash -e

TMP_DIR=$(mktemp -d)

function start() {
    git stash --include-untracked
}

function finish() {
    git clean -xfd
    git co src
    git stash pop
}
trap finish EXIT

function publish() {
    cp -r dist/ $TMP_DIR/
    cp rsync-exclude.txt $TMP_DIR/
    git co master
    rsync -avu --delete --exclude-from="$TMP_DIR/rsync-exclude.txt" "$TMP_DIR/dist/" "./"
    git add --all
    git commit -m "content(): Update on $(date --iso-8601='date')"
    git push
}

start
publish
