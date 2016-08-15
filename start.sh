#!/bin/bash

if [ -z "$PORT" ]; then
    echo "Please set a port, so I know how to look up my configuration file!"
    exit 1
fi

nghttpx --conf=/opt/nghttpx-$PORT-base.conf 
