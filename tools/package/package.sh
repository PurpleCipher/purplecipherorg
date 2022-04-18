#!/bin/bash

appName=$1
dir=$2
packageRegistry=$3
appSuffix=$APP_SUFFIX



if [ "$packageRegistry" == "npm" ]; then
  "$PWD"/tools/package/npm.sh "$appName" "$dir" "$appSuffix"
fi

if [ "$packageRegistry" == "docker" ]; then
  echo "$CR_PAT" | docker login ghcr.io -u "$GIT_USERNAME" --password-stdin || exit 1;
  "$PWD"/tools/package/docker.sh "$appName" "$PWD/$dir" "$PWD/dist"
fi
