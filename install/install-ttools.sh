#! /bin/bash

echo ''
echo "Title Web Solution's"
echo '  ______                    _             __   ______            __    '
echo ' /_  __/__  _________ ___  (_)___  ____ _/ /  /_  __/___  ____  / /____'
echo '  / / / _ \/ ___/ __ `__ \/ / __ \/ __ `/ /    / / / __ \/ __ \/ / ___/'
echo ' / / /  __/ /  / / / / / / / / / / /_/ / /    / / / /_/ / /_/ / (__  ) '
echo '/_/  \___/_/  /_/ /_/ /_/_/_/ /_/\__,_/_/    /_/  \____/\____/_/____/  '
echo ''
echo 'for SilverStripe: Installer'
echo ''


echo "This installer assumes you've already got a server set up."; 
echo "If you don't have a server set up yet, you can just enter expected information (or leave the fields empty)";
echo "- you can always change this in the config later.";




echo "";

echo "Please enter the project name:"
read PROJECTNAME


echo "Please enter the host name of your server:"
read HOST

echo "Please enter your SSH user:"
read SSHUSER

echo "Please enter the path that your repository is checked out to on the server:"
read REPODIR



echo ""
echo "* Now creating project configuration for $PROJECTNAME"




echo "
##############################################################
# Terminal Tools Configuration for \"$PROJECTNAME\"
# Add environments under \"Evnironments\"
# Adjust the menu under \"Menu\" to your needs
##############################################################
Projectname: \"$PROJECTNAME\"
Environments:
  Live:
    #required
    Host: \"$HOST\"
    Sshuser: \"$SSHUSER\"
    Repodir: \"$REPODIR\"
    #additional settings
    Domain: \"$HOST\"
    Sshport: \"\"
    Composerpath: \"\"
    PhpPath: \"\"
  Dev:
    #add dev site info here
Menu:
  Heading1:
    Title: Local
    Item1:
      Title: Local \"deploy\" (git pull etc.)
      Command: \"ttools/githelpers/lib/git-pull.sh ttools/silverstripe/lib/deploy.sh\"
    Item2:
      Title: Wipe cache
      Command: \"ttools/silverstripe/lib/wipe-cache.sh\"
    Item3:
      Title: Overwrite Local Site with Database & Assets from Live Site
      Command: \"ttools/sitesync-core/local/sync-environments.sh Live Local\"
  Heading2:
    Title: Dev Site
    Item1:
      Title: SSH Dev Site
      Command: \"ttools/core/local/ssh.sh Dev\"
    Item2:
      Title: Deploy Dev Site
      Command: \"ttools/githelpers/local/git-pull-remote.sh Dev ttools/silverstripe/lib/deploy.sh\"
    Item3:
      Title: Push Database & Assets to Dev Site
      Command: \"ttools/sitesync-core/local/sync-environments.sh Local Dev\"
    Item4:
      Title: Overwrite Dev Site with Database & Assets from Live Site
      Command: \"ttools/sitesync-core/local/sync-environments.sh Live Dev\"      
  Heading3:
    Title: Live Site
    Item1:
      Title: SSH Live Site
      Command: \"ttools/core/local/ssh.sh Live\"
    Item2:
      Title: Deploy Live Site
      Command: \"ttools/githelpers/local/git-pull-remote.sh Live ttools/silverstripe/lib/deploy.sh\"
Sitesync:
  FrameworkModule: 'ttools/sitesync-silverstripe'

" > ttools/config.yml


echo ""
echo "* Now installing ttools libraries"

#core 
git submodule add git://github.com/titledk/ttools-core.git ttools/core;

#git helpers
git submodule add https://github.com/titledk/ttools-githelpers.git ttools/githelpers

#sitesync core
git submodule add https://github.com/titledk/ttools-sitesync-core.git ttools/sitesync-core

#sitesync silverstripe
git submodule add https://github.com/titledk/ttools-sitesync-silverstripe.git ttools/sitesync-silverstripe
git submodule add https://github.com/silverstripe/sspak.git ttools/thirdparty/sspak


echo ""
echo "* Now installing the ttools binary"


##the ttools binary
echo "#!/bin/sh
./ttools/core/lib/ttools.sh \"\$@\"" > tt;
chmod u+x tt;

echo "";
echo "Installation is done. You can now run Terminal Tools by running \"./tt\"";
echo "Remember to commit the changes to your repository."


echo ""




read -p "Do you want to go ahead installing SilverStripe now? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
  ./ttools/silverstripe/install/install-silverstripe.sh;
else
  exit 0
fi


