#!/bin/bash

echo "Wiping silverstripe-cache dir"
echo "Note this only works if your user has the correct permissions"

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../.. && pwd )";
MODULEDIR="$BASEDIR/ttools/silverstripe";
SILVERSTRIPE_PATH="$BASEDIR";

cd $SILVERSTRIPE_PATH;

rm -rf public/silverstripe-cache/
mkdir public/silverstripe-cache
chmod 777 public/silverstripe-cache/

echo "Done."


