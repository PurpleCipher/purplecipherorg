#!/bin/bash

appName=$1
dir=$2
dist=$3

VERSION="$MAJOR.$MINOR.$PATCH"
echo "Version: $VERSION"
TAG="ghcr.io/purplecipher/$appName:$VERSION"
LATEST="ghcr.io/purplecipher/${appName}:latest"
BUILD_TIMESTAMP=$( date '+%F_%H:%M:%S' )


cp "$dir/Dockerfile" "$dist/apps/$appName" || exit 0;
cp "tools/extra/nginx.conf" "$dist/apps/$appName/nginx.conf" || exit 1;

ls -la "$dist/apps/$appName" || exit 1;

cd "$dist/apps/$appName" || exit 1;

docker build -t "$TAG" -t "$LATEST" --build-arg VERSION="$VERSION" --build-arg BUILD_TIMESTAMP="$BUILD_TIMESTAMP" . || exit 1;
docker push "$TAG" || exit 1;
docker push "$LATEST" || exit 1;

echo "$appName $dir version $VERSION for docker";

export VERSION="$VERSION"
export APP_NAME="$appName"
export WEBHOOK_URL="https://api.github.com/repos/PurpleCipher/purplecipherorg-infrastructure/dispatches"

cd ../../../tools || exit 1;
node webhook-notifier.js
