#!/bin/bash

# Copyright 2016 tsuru authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

cd "$parent_path"

if [ ! -z $1 ]; then
    platforms=$1
else
    platforms=$(ls -d */ | cut -f1 -d'/' | grep -v common)
fi

for plat in $platforms; do
    echo "Testing $plat platform..."
    sed "s/{PLATFORM}/$plat/g" Dockerfile.template > ./$plat/Dockerfile
    cp -r common ./$plat/common
    docker build -t platform-$plat ../$plat && docker build -t tests-$plat --no-cache ./$plat
    rm ./$plat/Dockerfile && rm -rf ./$plat/common
done
