#!/usr/bin/env bash
set -e

echo "Get source Start"
hg clone http://hg.openjdk.java.net/jdk8u/jdk8u/ openjdk8
bash openjdk8/get_source.sh
echo "Get source End"

echo "Build Start"
mkdir -p openjdk8/build
bash build.sh
echo "Build End"

