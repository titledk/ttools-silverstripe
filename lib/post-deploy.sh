#!/bin/bash
# SilverStripe post deploy script
# Does all the things needed after a git pull on the server
# Add to config.yml like this:
# Command: "ttools/githelpers/local/git-pull-remote.sh Live ttools/silverstripe/lib/post-deploy.sh;"

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../.. && pwd )";

#environment specific variables
ENV=$1;
if [ -z "${1}" ]; then
	ENV=LOCAL;
fi
ENVVARS="$BASEDIR/ttools/core/lib/vars-for-env.sh $ENV"
eval `$ENVVARS`


cd $BASEDIR;

echo "";
echo "Running SilverStripe post deploy script...";

#wipe cache
ttools/silverstripe/lib/wipe-cache.sh;

#composer install - can be supplied with an environement variable
ttools/silverstripe/lib/composer-install.sh $1;

#rebuilding the database
#this has not always worked for me, see https://github.com/silverstripe/silverstripe-framework/issues/2822
#but I'm hoping that wiping the cache should fix the issue
#echo "php path is $ENV_PHPPATH";

$ENV_PHPPATH public/framework/cli-script.php /dev/build

echo "";
echo "Deployment done. Status:"
echo "";
cd $BASEDIR;
git status;
echo "";


