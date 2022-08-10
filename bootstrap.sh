#!/bin/bash

GIT_REPO_URL=$1
GIT_TAG=$( echo $2 | sed 's/\-[0-9]\+$//g')

if [ ! -d upstream ]; then
    git clone ${GIT_REPO_URL} upstream
fi

echo "Checkout tag: ${GIT_TAG}"
git -C upstream checkout tags/${GIT_TAG}
git -C upstream submodule update --init --recursive
