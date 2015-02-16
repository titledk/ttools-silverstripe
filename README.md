# Terminal Tools for SilverStripe

Terminal helpers for working with SilverStripe, including, but not limited to:

* 1-line SilverStripe project setup
* ssh-based deployment to various environments
* asset & database sync between all environments (also local)


**UNDER DEVELOPMENT**

## Installation (& kicking off a new SilverStripe project)

1. If you're creating a new project, create a new git repository, and clone it locally
2. Run the following command from your repository root:

		git submodule add https://github.com/titledk/ttools-silverstripe.git ttools/silverstripe; ./ttools/silverstripe/install/install-ttools.sh;


**NOTE:** If you're adding this to an existing project, you'll need to have all SilverStripe files inside of a `public` directory.





## Plans


### Review dependency management

First thing should be to make it easy to keep things updated.
That could still be handled via git submodules, but could
also be done via composer, given that SilverStripe requires
composer anyway.

