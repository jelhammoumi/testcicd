#!/bin/bash

#######################################################
# Magento Deployment Script
# author : Jaouad EL HAMMOUMI
# update : 10/07/2018
#
# description : this script perform actions before code deploy install
#######################################################

########################################################################################################################
# download the magento code base and extract it into the release folder
########################################################################################################################

echo 'Initializing environment params ...'
CURRENTDIR=$(dirname "$0")
source $CURRENTDIR/env.sh

if [ -d "${CODEDEPLOYDESTDIR}" ]; then
	echo "clean code deploy release folder"
	rm "${CODEDEPLOYDESTDIR}" -r || { echo "Error while removing code deploy release folder ${CODEDEPLOYDESTDIR}" ; exit 1; }
fi

if [ ! -d "${CODEDEPLOYDESTDIR}" ]; then
	echo "creating code deploy release folder"
	mkdir "${CODEDEPLOYDESTDIR}" || { echo "Error while creating code deploy release folder ${CODEDEPLOYDESTDIR}" ; exit 1; }
fi

