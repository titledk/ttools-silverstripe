<?php

/**
 * Include this file if you wish to tie into the SilverStripe framework to test your code in a separate workbench area
 * without having to build a page controller, data object and then go through the full request cycle. This is good for
 * rapid prototyping before rolling out any sort of final code. NOTE: This *is* suitable for use in the command line as
 * well.
 *
 * It's recommmended to create a workbench.php file inside of the ttools directory and to not include it in version control
 * Include like this:
 * // Initialize framework.
 * require_once(__DIR__ . "/silverstripe/lib/workbench-include.php");
 *
 * run like this:
 * php ttools/workbench.php
 *
 * From https://gist.github.com/patricknelson/891ce9a8f5fc79894f9b
 * See also https://github.com/patricknelson/silverstripe-migrations/issues/3#issuecomment-103344167
 *
 * @author	Patrick Nelson, pat@catchyour.com
 * @since	2015-01-06
 */

// General initialization.
global $databaseConfig;
chdir(__DIR__ . "/../../../public/framework");
require_once("core/Core.php");
require_once("model/DB.php");
DB::connect($databaseConfig);
DataModel::set_inst(new DataModel());

// For command line.
if (php_sapi_name() == "cli") {
	$_SERVER['SCRIPT_FILENAME'] = __FILE__;
	$_SERVER['REQUEST_URI'] = BASE_URL;
}