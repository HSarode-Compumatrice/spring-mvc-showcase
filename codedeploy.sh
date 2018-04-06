#!/bin/bash
#CodeDeploy Script which generates project specific WAR
#
pwd
cd $WORKSPACE
mvn package
ls -lthr $WORKSPACE/target
