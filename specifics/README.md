ALIZNET FILES
=================================================

This folder contains all files specific to aliznet

# Scripts
```
code deploy
database backup and restore
jenkins jobs config for each environement
```

# Magento bug temporary workarounds
```
aliznet/vendor
```
This folder contains override of magento vendor files, il will be copied to the vendor directory during deployment, these files are checked with Magento releases during each upgrade

### Elasticsearch https issue
```
aliznet/vendor/elasticsearch
```
> Elasticsearch\Connections\Connection : Magento not support https scheme for eleasticsearch server

### Wishlist sharing
```
aliznet/vendor/magento/module-wishlist
```
> dev/netik/vendor/magento/module-wishlist : Magento wishlist share patch

### BO grid rows multiselect 
```
aliznet/vendor/magento/module-ui
```
> vendor/magento/module-ui : Magento not work correctly if the grid contains one row