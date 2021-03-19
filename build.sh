#!/bin/bash -e

SCRIPTS_DIR="$(dirname "$(readlink -f "$0")")"
WORKING_DIR="$(pwd)"

if [ "$SCRIPTS_DIR" = "$WORKING_DIR" ]; then
    echo "error: Can't build inside the scripts dir"
    exit 1
fi

if [ -z "$1" ]; then
    echo "error: No target given"
    echo "usage: $0 <target>"
    exit 1
fi

if [[ "$1" != "linux-"* ]]; then
    echo "error: Unknown host type in target '$1'"
    exit 1
fi

if [[ "$1" != *"-x86" ]] && [[ "$1" != *"-x64" ]]; then
    echo "error: Unknown architecture in target '$1'"
    exit 1
fi

export CMAKE_SOURCE="$WORKING_DIR/cmake"
export CMAKE_BUILD="$WORKING_DIR/cmake-build"
export CMAKE_OUT="$SCRIPTS_DIR/out/cmake"

# Build cmake
$SCRIPTS_DIR/cmake-sources.sh 3.19.7
$SCRIPTS_DIR/cmake-arch.sh "$1"
