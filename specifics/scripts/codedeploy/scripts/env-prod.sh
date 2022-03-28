#!/bin/bash

#############################################################################################
#  this script contains environment specific parameters, it's called by the parent script
#  environment : PREPROD
##############################################################################################

# commons params
ENV=prod
SHAREDBASEDIR=/data/www/client/shared_data
DEPLOY_FLAG_FILEPATH=$SHAREDBASEDIR/magento/deploy_prod_$(date +%Y%m%d)
RELEASEDESTBASEDIR=/data/www/client/electroplanet
CODEDEPLOYDESTDIR=$RELEASEDESTBASEDIR/codedeploy-release
RELEASENAME="ep_release_03_$(date +%Y%m%d)_prod"
CURRENTRELEASEDIR=$RELEASEDESTBASEDIR/prod
