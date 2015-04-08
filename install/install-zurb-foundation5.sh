#! /bin/sh

#add the theme - ready for being comitted

cd public/themes

git clone git://github.com/ryanwachtl/silverstripe-foundation-theme.git foundation

cd foundation

rm -rf .git


#add the foundation forms module
cd ..

composer require rywa/silverstripe-foundation-forms

