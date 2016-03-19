# Terminal Tools for SilverStripe

Terminal helpers for working with SilverStripe, including, but not limited to:

* 1-line SilverStripe project setup
* ssh-based deployment to various environments
* asset & database sync between all environments (also local)

## Installation (& kicking off a new SilverStripe project)

1. If you're creating a new project, create a new git repository, and clone it locally
2. Run the following command from your repository root:

```sh
git submodule add https://github.com/titledk/ttools-silverstripe.git ttools/silverstripe; ./ttools/silverstripe/install/install-ttools.sh;
```

**NOTE:** If you're adding this to an existing project, you'll need to have all SilverStripe files inside of a `public` directory.

## Learn more - Presentation from StripeCon 2015

![Check out the video presentation](https://i.vimeocdn.com/video/540923620.png)


* [Watch the video](https://vimeo.com/143360071)
* [Download the slides](http://www.anselm.dk/static/talks/stripecon-2015/ttools.pdf)


## Details

The installer installs the following modules for you:

* https://github.com/titledk/ttools-core
* https://github.com/titledk/ttools-githelpers
* https://github.com/titledk/ttools-sitesync-core
* https://github.com/titledk/ttools-sitesync-silverstripe
* https://github.com/silverstripe/sspak

## Updating

We keep on developing on Terminal Tools.  
In order to update to the latest and greatest version, run `./tt` and press `U` (for upgrade).  
Alternatively, and on older versions, run `./ttools/core/local/upgrade.sh`.

In case you upgrade from older versions it _could_ be that the `config.yml` structure has changed
slightly. Make sure to check out `install/install-ttools.sh` for the up-to-date structure.


## Plans


### Review dependency management

First thing should be to make it easy to keep things updated.
That could still be handled via git submodules, but could
also be done via composer, given that SilverStripe requires
composer anyway.

