#!/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../.. && pwd )";
cd $BASEDIR;

if [ -z "${1}" ]; then
	#if no environment variable has been supplied: local deploy
	ttools/githelpers/lib/git-pull.sh ttools/silverstripe/lib/post-deploy.sh
else
	#if environment variable has been supplied
	ttools/githelpers/local/git-pull-remote.sh $1 ttools/silverstripe/lib/post-deploy.sh
fi