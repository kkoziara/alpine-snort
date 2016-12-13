#! bin/sh

docker run --name alpine-snort -d --net=host \
           -v $(pwd)/data:/data -v $(pwd)/settings:/settings \
           kkoziara/alpine-snort "$@"
