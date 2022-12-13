#!/bin/sh
# remove slash from last echo ${@%/}
for entry in */; do
    if [ -e $entry/nest-cli.json ]; then
        cp -r .prod.env $entry.env
        cd $entry
        docker build -t ${entry@%/}:latest -f Dockerfile.prod .
        docker push redhaanggara/${entry@%/}:latest
        cd ..
    fi
done
