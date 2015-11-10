#! /bin/bash

echo ''
echo "Title Web Solution's"
echo '  ______                    _             __   ______            __    '
echo ' /_  __/__  _________ ___  (_)___  ____ _/ /  /_  __/___  ____  / /____'
echo '  / / / _ \/ ___/ __ `__ \/ / __ \/ __ `/ /    / / / __ \/ __ \/ / ___/'
echo ' / / /  __/ /  / / / / / / / / / / /_/ / /    / / / /_/ / /_/ / (__  ) '
echo '/_/  \___/_/  /_/ /_/ /_/_/_/ /_/\__,_/_/    /_/  \____/\____/_/____/  '
echo ''
echo 'for SilverStripe: Project Kickoff'
echo ''

REPODIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../.. && pwd )";



VARS="$REPODIR/ttools/core/lib/vars.sh"

#show variables:
#$VARS;

#evaluate variables:
eval `$VARS`



PROJECT_URLSAFE="${Projectname//./}"
PROJECT_URLSAFE="${PROJECT_URLSAFE//-/}"
PROJECT_URLSAFE="${PROJECT_URLSAFE// /}"


echo "* Updating Composer (you will be promted for your sudo password";
sudo composer self-update;


echo "* Creating Project";
composer create-project silverstripe/installer ./public;


echo "* Creating .gitignore";
echo "
/public/silverstripe-cache/
/_ss_environment.php
.DS_Store
public/cms/
public/framework/
public/themes/simple
public/themes/tutorial
public/reports/
public/siteconfig/
logs
rotatingbackups
temp
.idea
**/bower_components
" > .gitignore;


LOCALHOST="http://$PROJECT_URLSAFE:8888" #MAMP default
PUBLICDIR="$REPODIR/public"


echo "* Creating _ss_environment.php";
echo "<?php
define('SS_DATABASE_SERVER', 'localhost');
define('SS_DATABASE_USERNAME', 'root');
define('SS_DATABASE_PASSWORD', 'root');
define('SS_DATABASE_NAME', '$PROJECT_URLSAFE');
define('SS_DATABASE_CLASS', 'MySQLPDODatabase');

define('SS_ENVIRONMENT_TYPE', 'live');

define('SS_DEFAULT_ADMIN_USERNAME', 'noreply@title.dk');
define('SS_DEFAULT_ADMIN_PASSWORD', 'xxxx');

//error log - the first line seems to be the proper one
//you might need to create silverstripe.log though, and give it the proper permissions
define('SS_ERROR_LOG', '../logs/silverstripe.log');
//define('SS_ERROR_LOG', __DIR__ . '/logs/silverstripe.log');


global \$_FILE_TO_URL_MAPPING;
\$_FILE_TO_URL_MAPPING['$PUBLICDIR'] = '$LOCALHOST';



//FOR TEST SITES:

//Protect the site with basic auth
//define('SS_USE_BASIC_AUTH', true);

//Emailing
//define('SS_SEND_ALL_EMAILS_TO', '');
//define('SS_SEND_ALL_EMAILS_FROM', '');


//find more configuration options here:
//http://doc.silverstripe.org/framework/en/topics/environment-management
//https://gist.github.com/ryanwachtl/5793212


" > _ss_environment.php;

echo "* Copying _ss_environment.php to devfiles"
mkdir devfiles
cp _ss_environment.php devfiles/_ss_environment.php


echo "Creating the docs directory"
mkdir docs

echo "Creating empty logs directory"
mkdir logs

echo "Creating instructions"

echo "# Setup instructions

_This project has been set up using [Terminal Tools for SilverStripe](https://github.com/titledk/ttools-silverstripe)._

Follow the instructions below to get up and running with development (or readying your server for deployment):

1. Clone this repo locally
2. Set up an \`_ss_environment.php\` file in your root (you can copy it from \`devfiles\`) and edit the database settings
3. Update your submodules: \`git submodule update --init\`
4. Run \`composer install\` from within \`public\` (if you don't have composer installed, follow [these instructions](http://doc.silverstripe.org/en/getting_started/composer#installing-composer))
5. Point a web root to \`public\`, and enter it

You should be good to go!


" > docs/setup-instructions.md;




read -p "Do you want to delete common not needed files? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
	echo "* Deleting files"
	rm public/index.php
	rm public/install-frameworkmissing.html
	rm public/install.php
	rm public/web.config
	rm public/README.md
	rm public/favicon.ico
	
	#also removing the simple theme (we usually don't want it)
	cd public;
	composer remove silverstripe-themes/simple;
	cd ..;
fi






echo "* Done."

echo ""
echo "All SilverStripe libraries have been installed."
echo "You can now go ahead, and set MAMP up to point"
echo "$LOCALHOST$ to"
echo "$PUBLICDIR"



echo ""

read -p "Do you want to add the ZURB Foundation 5 Theme? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
  ./ttools/silverstripe/install/install-zurb-foundation5.sh;
else
  exit 0
fi
