#!/bin/sh

#TODO make most variables into command-line options

SYMLINK="ln -s"
INSTALL="apt-get install"
INSTALL_FLAGS="-y"

# set up home directory
## symlink repos from user data partition
USER_DATA_PARTITION="/lud"
USER_DATA_USER=`whoami` 
USER_REPOSITORIES_ROOT="Repositories"
$SYMLINK $USER_DATA_PARTITION/$USER_DATA_USER/$USER_REPOSITORIES_ROOT ~/$USER_REPOSITORIES_ROOT
# check whether you have git yet or not

# clone install-customize repository
CUSTOMIZE_REPOSITORY="apt-get-customize.git"
CUSTOMIZE_REPOSITORY_ROOT="git@github.com/bluesquall/"
cd ~/$USER_REPOSITORIES_ROOT
git clone $CUSTOMIZE_REPOSITORY_ROOT/$CUSTOMIZE_REPOSITORY $CUSTOMIZE_REPOSITORY
# TODO optionally pause to let the user change the repo
# run the customization script
CUSTOMIZE_SCRIPT="apt-get-customize.sh"
cd $CUSTOMIZE_REPOSITORY
exec $CUSTOMIZE_SCRIPT
