#!/bin/bash
set -eu
cd $HOME/rpmbuild/SRPMS
curl -sLO https://copr-be.cloud.fedoraproject.org/results/hnakamur/highway/epel-7-x86_64/00143073-highway/highway-1.1.0-1.el7.centos.src.rpm
/usr/bin/mock -r epel-7-x86_64 --rebuild highway-1.1.0-1.el7.centos.src.rpm
