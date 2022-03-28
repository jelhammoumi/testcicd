#!/bin/bash

###############################################################################################
# Magento Deployment Script
# author : Jaouad EL HAMMOUMI
# update : 10/07/2018
#
# description : this script perform actions after codedeploy agent install the source code
###############################################################################################

echo 'Initializing environment params ...'
CURRENTDIR=$(dirname "$0")
source $CURRENTDIR/env.sh

ALREADY_DEPLOYED=false
if [ -f "${DEPLOY_FLAG_FILEPATH}" ]; then
	ALREADY_DEPLOYED=true
fi
###############################################################################################
# extract magento code base files into code deploy release folder
###############################################################################################

cd $CODEDEPLOYDESTDIR

echo "Extracting magento code base (with follow symlink) magento-code-base.tar.gz ..."
tar -h -xf magento-code-base.tar.gz

########################################################################################################################
# create media symbolic links to shared media folder
########################################################################################################################
ln -sfn "${SHAREDBASEDIR}/magento/pub/media" "pub/media" || { echo "Error while craeting symbolic link to shared media folder" ; exit 1; }
if [ ! $ENV = qualif ];then
	ln -sfn "${SHAREDBASEDIR}/magento/pub/static" "pub/static" || { echo "Error while craeting symbolic link to shared static folder" ; exit 1; }
	ln -sfn "${SHAREDBASEDIR}magento/var" "var" || { echo "Error while craeting symbolic link to shared var folder" ; exit 1; }
	ln -sfn ${SHAREDBASEDIR}/magento/sitemap.xml sitemap.xml || { echo "Error while craeting symbolic link to shared static folder" ; exit 1; }
fi

echo "removing magento-code-base.tar.gz ..."
rm magento-code-base.tar.gz

###############################################################################################
# extract magento code base files into code deploy release folder
###############################################################################################

echo "Extracting package release.tar.gz ..."
tar -h -xf release.tar.gz

echo "removing release.tar.gz ..."
rm release.tar.gz

########################################################################################################################
# perform database independency operations
########################################################################################################################
echo "-------------------------------------------------------"
echo "compiling code ..."
echo "-------------------------------------------------------"
php bin/magento setup:di:compile

echo "-------------------------------------------------------"
echo "generating statics assets ..."
echo "-------------------------------------------------------"

if $ALREADY_DEPLOYED; then
  echo "statics assets already generated, skip"
else
  #remove unecessary themes
  rm -rf pub/static/frontend/ep
  rm -rf pub/static/adminhtml/Magento/Ep
  php bin/magento --ansi setup:static-content:deploy -f fr_FR --theme ep/shop --area frontend
  php bin/magento --ansi setup:static-content:deploy -f fr_FR en_US --area adminhtml
fi

########################################################################################################################
# Run upgrade scripts
########################################################################################################################
echo "-------------------------------------------------------"
echo "Triggering Magento setup upgrade"
echo "-------------------------------------------------------"
php bin/magento setup:upgrade --keep-generated || { echo "Error while triggering the update scripts using magento-cli" ; exit 1; }

########################################################################################################################
# update symlink
########################################################################################################################

echo "-------------------------------------------------------"
echo "Updating release symlink"
echo "-------------------------------------------------------"
cd ..
php $CURRENTRELEASEDIR/bin/magento maintenance:enable

echo "Settings current ${CODEDEPLOYDESTDIR} to release folder ${CURRENTRELEASEDIR}"

if [ -d "${RELEASEDESTBASEDIR}/${RELEASENAME}" ]; then
	echo "removing release folder ${RELEASEDESTBASEDIR}/${RELEASENAME} ..."
	rm -rf "${RELEASEDESTBASEDIR}/${RELEASENAME}" || { echo "Error while removing release folder ${RELEASEDESTBASEDIR}/${RELEASENAME}" ; exit 1; }
fi

mv ${CODEDEPLOYDESTDIR} ${RELEASEDESTBASEDIR}/${RELEASENAME}
ln -sfn "${RELEASENAME}" "${CURRENTRELEASEDIR}" || { echo "Error while symlinking 'current' to release folder" ; exit 1; }

php $CURRENTRELEASEDIR/bin/magento maintenance:disable

if $ALREADY_DEPLOYED; then
    echo "cache and index already processed, skip"
else
    echo "-------------------------------------------------------"
    echo "clean magento cache ..."
    echo "-------------------------------------------------------"
    php $CURRENTRELEASEDIR/bin/magento cache:clean
    echo "-------------------------------------------------------"
    echo "update magento index ..."
    echo "-------------------------------------------------------"
    php $CURRENTRELEASEDIR/bin/magento indexer:reindex
fi

########################################################################################################################
# create deployment file flag
########################################################################################################################
echo "-------------------------------------------------------"
echo "creating deployment file flag ${DEPLOY_FLAG_FILEPATH}"
echo "-------------------------------------------------------"
touch $DEPLOY_FLAG_FILEPATH

echo "******************************************** DEPLOY RELEASE 0.2 END ********************************************"
