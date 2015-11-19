#!/bin/bash

docker build -t blog . && \
docker run -it -p 4000:4000 -v `pwd`:/blog blog

