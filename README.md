# alpine-snort
Docker image containing snort with pulled pork based on alpine linux image and jasonish/docker-snort.

## Running
To run the image type: `./run.sh snort -c /data/etc/snort/snort.config -i <eth>`. It will by default mount `data` and `settings` folders from current directory. In `settings` directory you can edit `home_net.conf` file to set your network.

## Update

    docker exec -t alpine-snort /tools/update-rules
    docker restart alpine-snort
