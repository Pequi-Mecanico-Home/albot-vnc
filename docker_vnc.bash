#!/bin/bash

docker run \
        -p 6080:80 \
        --rm \
        --privileged \
        --cpu-shares=1024  \
        albot-vnc:1.0
