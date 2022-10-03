# installcheckOpenedge

TODO: Enter the cookbook description here.

This repo is used for deploying Openedge and performing post installation check,

Openedge is being deployed via chef infra cookbook and the Post installtion check is performed via complinace phase part of the cookbook.

The Installer recipe uses an S3 Bucket(https://openedge-anupam.s3.us-west-2.amazonaws.com/PROGRESS_OE_12.5.1_LNX_64.tar.gz) as Openedge repo .

All the attribute has been defined inside the Attribute folder for the Cookbook.

The Response.ini file which is used by the OpenEdge Installer is being copied over via Cookbook Template .

The Post installation Sanity checks are perfromed via Chef Complinace Phase.

