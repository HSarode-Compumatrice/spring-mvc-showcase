#!/bin/bash
#CodeDeploy Script which generates project specific WAR
#
cd $WORKSPACE"
mvn package
ls -lthr $WORKSPACE/target
