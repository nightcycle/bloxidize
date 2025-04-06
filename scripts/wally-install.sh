#!/usr/bin/env bash
set -e
ROJO_PROJECT="$1"
# if ROJO_PROJECT isn't provided, exit
if [ -z "$ROJO_PROJECT" ]; then
  echo "Need to supply project file"
  exit 1
fi
wally install
if [ ! -d "Packages" ]; then
  mkdir Packages
fi
if [ ! -d "stage-src" ]; then
  mkdir "stage-src"
fi
rojo sourcemap "$ROJO_PROJECT" --output sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages

