#!/bin/bash -e

if [ -z "$CMAKE_SOURCE" ]; then
    echo "Source has not been set! Exiting..."
    exit 1
fi

if [ ! -d "$CMAKE_SOURCE" ]; then
    echo "Source is not present! Exiting..."
    exit 1
fi

BUILD_DIR="$CMAKE_BUILD-$1"
OUT_DIR="$CMAKE_OUT-$1"

# Setup compiler
[[ "$1" = "linux-"* ]] && export CC="gcc"
[[ "$1" = "linux-"* ]] && export CXX="g++"

[[ "$1" = *"-x86" ]] && export CC="${CC} -m32"
[[ "$1" = *"-x86" ]] && export CXX="${CXX} -m32"

rm -rf "$BUILD_DIR"
rm -rf "$OUT_DIR"

mkdir -p $BUILD_DIR
cd "$BUILD_DIR"

"$CMAKE_SOURCE/bootstrap" --prefix="/usr/local"
make -j2
make DESTDIR="$OUT_DIR" install
