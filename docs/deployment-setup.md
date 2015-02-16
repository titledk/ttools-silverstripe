# Setting up your server for SilverStripe deployment with Terminal Tools

1. Check out your repo on the server, and point server and domain there
2. SSH in (you can do that with `tt`
3. Update submodules: `git submodule init; git submodule sync; git submodule update`
4. `cp devfiles/_ss_environment.php _ss_environment.php`, and edit
5. `exit`, run `./tt`, and choose deploy

That should be it. Sometimes you might need a few extra settings. See below for common usage



## Serverpilot

These settings have shown to work with ServerPilot:

    Domain: "xxx"
    Host: "xxx"
    Sshuser: "serverpilot"
    Repodir: "/srv/users/serverpilot/apps/xxx"
    Composerpath: "/srv/users/serverpilot/apps/xxx/public/composer.phar"
    #see here: https://serverpilot.io/community/articles/how-to-use-the-php-cli.html
    PhpPath: "php5.6-sp"


