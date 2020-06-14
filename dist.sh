#!/bin/bash -e

# Ensure the machines are up
vagrant up

# Build the libraries
vagrant ssh x86 -c "/vagrant/build.sh linux-x86"
vagrant ssh x64 -c "/vagrant/build.sh linux-x64"

rm -rf dist
mkdir -p dist

tar -cf dist/cmake-linux-x86.tar -C out/cmake-linux-x86/usr/local bin doc share && gzip dist/cmake-linux-x86.tar
tar -cf dist/cmake-linux-x64.tar -C out/cmake-linux-x64/usr/local bin doc share && gzip dist/cmake-linux-x64.tar
