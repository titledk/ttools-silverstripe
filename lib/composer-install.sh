#!/bin/bash
#Composer helper

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../.. && pwd )";


cd $BASEDIR;
cd public;


COMPOSER_CMD='';
#this can be called with and witout environment variable
if [ -z "${1}" ]; then
	#here we expect to locally
	#composer is installed including "require-dev" libraries
	COMPOSER_CMD="composer install";
else
	#getting environment variables
	ENV="$1";
	ENVVARS="$BASEDIR/ttools/core/lib/vars-for-env.sh $ENV"
	eval `$ENVVARS`

	#when deploying to a server we leave the "require-dev" libraries out
	COMPOSER_CMD="$ENV_COMPOSERPATH install --no-dev";
fi

echo Running $COMPOSER_CMD
$COMPOSER_CMD


