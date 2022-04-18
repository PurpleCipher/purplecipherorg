#!/bin/bash

appName=$1
dir=$2
dist=$3

VERSION="$MAJOR.$MINOR.$PATCH"
echo "Version: $VERSION"
TAG="ghcr.io/PurpleCipher/$REPO-$appName:$VERSION"
LATEST="ghcr.io/PurpleCipher/${REPO}-${appName}:latest"
BUILD_TIMESTAMP=$( date '+%F_%H:%M:%S' )


cp "$dir/Dockerfile" "$dist/apps/$appName" || exit 1;
cp "tools/extra/nginx.conf" "$dist/apps/$appName/nginx.conf" || exit 1;

ls -la "$dist/apps/$appName" || exit 1;

cd "$dist/apps/$appName" || exit 1;

docker build -t "$TAG" -t "$LATEST" --build-arg VERSION="$VERSION" --build-arg BUILD_TIMESTAMP="$BUILD_TIMESTAMP" . || exit 1;
docker push "$TAG" || exit 1;
docker push "$LATEST" || exit 1;

echo "$appName $dir version $VERSION for docker";
