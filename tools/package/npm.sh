#!/bin/bash

appName=$1
dir=$2
appSuffix=$3

ls "$dir" || exit 1;
cd "$dir" || exit 1;

echo "$appName $dir version $appSuffix for npm"
