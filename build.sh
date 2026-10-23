#!/bin/sh
# theme/ の中身から newyork-2010-gray.xpi を作り直す
set -eu
cd "$(dirname "$0")"
rm -f newyork-2010-gray.xpi
(cd theme && zip -q -X ../newyork-2010-gray.xpi manifest.json newyork2010header.jpg)
echo "built: newyork-2010-gray.xpi"
