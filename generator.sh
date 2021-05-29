#!/bin/sh

mkdir -p dist

for bu_file in *.bu; do
  ign_file="dist/$(basename $bu_file .bu).ign"
  b64_file="dist/$(basename $bu_file .bu).b64"

  docker run -i --rm quay.io/coreos/butane:release --pretty --strict < $bu_file > $ign_file
  base64 -w0 $ign_file > $b64_file
done
