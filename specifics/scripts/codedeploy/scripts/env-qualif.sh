#!/bin/bash

#############################################################################################
#  this script contains environment specific parameters, it's called by the parent script
#  environment : PREPROD
##############################################################################################

# commons params
ENV=qualif
SHAREDBASEDIR=/data/www/client/shared_data
DEPLOY_FLAG_FILEPATH=$SHAREDBASEDIR/magento/deploy_qualif_$(date +%Y%m%d)
RELEASEDESTBASEDIR=/data/www/client/electroplanet
CODEDEPLOYDESTDIR=$RELEASEDESTBASEDIR/codedeploy-release
RELEASENAME="ep_release_03_$(date +%Y%m%d)_qualif"
CURRENTRELEASEDIR=$RELEASEDESTBASEDIR/qualif
