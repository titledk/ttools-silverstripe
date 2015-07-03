#!/bin/bash
# SilverStripe deploy script
# Does all the things needed after a git pull on the server
# Add to config.yml like this:
# Command: "ttools/githelpers/local/git-pull-remote.sh Live ttools/silverstripe/lib/deploy.sh;"

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../.. && pwd )";


cd $BASEDIR;

echo "";
echo "Running SilverStripe deploy script...";
echo "";

#wipe cache
ttools/silverstripe/lib/wipe-cache.sh;

#composer install - can be supplied with an environement variable
ttools/githelpers/lib/composer-install.sh $1;

#TODO this should also include a db rebuild

echo "";
echo "Deployment done. Status:"
echo "";
cd $BASEDIR;
git status;
echo "";


