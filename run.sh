#! bin/sh

docker run --name alpine-snort -d --net=host \
           -v $(pwd)/data:/data \
           kkoziara/alpine-snort "$@"
