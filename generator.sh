#!/bin/sh

mkdir -p dist

for fcc_file in *.fcc; do
  ign_file="dist/$(basename $fcc_file .fcc).ign"
  b64_file="dist/$(basename $fcc_file .fcc).b64"

  docker run -i --rm quay.io/coreos/fcct:release --pretty --strict < $fcc_file > $ign_file
  base64 -w0 $ign_file > $b64_file
done
