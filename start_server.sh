#!/bin/bash

set -ex

#docker run --rm -it -p 5000:500 -v $(pwd):/app word2vec

mkdir -p ~/tmp/
tmpdir=$(mktemp -d ~/tmp/)

# Step 1, clone letsencrypt as a wrapping directory
git clone https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt.git "$tmpdir/docker-wrapper"

# Step 2, add this repo to above
mkdir -p "$tmpdir/docker-wrapper/src"
git clone https://github.com/JonathanGrant/WordEmbeddingsServer "$tmpdir/docker-wrapper/src"

# Step 3, copy .env file to wrapper
cp "tmpdir/docker-wrapper/src/.env" "tmpdir/docker-wrapper/.env"

# Step 4, launch wrapping docker container
make dc-start

