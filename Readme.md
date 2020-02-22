# TomDotTom

## Setup

    yarn install

## Dev

    ./dev.sh

## Build

    ./build.sh

## Deploy

    ./publish.sh


## General Structure

TODO:

Most content will be a post and accessible via:

    /post/{slug}

Content may belong to a particular category which gets listed on it's own page:

    /blog/index.html
    /articles/index.html

Any of these categories may be in draft form which be listed on:

    /draft/blog/index.html
    /draft/articles/index.html
