#!/bin/bash -e

if [ -z "$CMAKE_SOURCE" ]; then
    echo "Source has not been set! Exiting..."
    exit 1
fi

if [ -d "$CMAKE_SOURCE" ]; then
    rm -rf "$CMAKE_SOURCE"
fi

if [ ! -f cmake-$1.tar.gz ]; then
    wget https://cmake.org/files/v${1%\.*}/cmake-${1}.tar.gz
fi

tar -xf cmake-$1.tar.gz
mv cmake-$1 "$CMAKE_SOURCE"
