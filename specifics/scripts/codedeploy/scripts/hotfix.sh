#!/bin/bash

###############################################################################################
# Magento Deployment Script
# author : Jaouad EL HAMMOUMI
# update : 10/07/2018
#
# description : this script perform hotfix deployment, it not create new release folder but deploy into the current release
###############################################################################################

echo "******************************************** DEPLOY HOTFIX START ********************************************"

echo 'Initializing environment params ...'
CURRENTDIR=$(dirname "$0")
source $CURRENTDIR/env.sh

cd $CURRENTRELEASEDIR

###############################################################################################
# extract magento code base files into code deploy release folder
###############################################################################################

echo "Extracting package release.tar.gz ..."
tar -h -xf release.tar.gz

echo "removing release.tar.gz ..."
rm release.tar.gz

echo "-------------------------------------------------------"
echo "clean magento cache ..."
echo "-------------------------------------------------------"
php bin/magento cache:clean

########################################################################################################################
# perform database independency operations
########################################################################################################################
echo "-------------------------------------------------------"
echo "compiling code ..."
echo "-------------------------------------------------------"
php bin/magento setup:di:compile

########################################################################################################################
# Run upgrade scripts
########################################################################################################################
echo "-------------------------------------------------------"
echo "Triggering Magento setup upgrade"
echo "-------------------------------------------------------"
php bin/magento setup:upgrade --keep-generated || { echo "Error while triggering the update scripts using magento-cli" ; exit 1; }

echo "******************************************** DEPLOY HOTFIX END ********************************************"
