#!/bin/bash
#CodeDeploy Script which generates project specific WAR
#
echo "Build Number is: $BUILD_NUMBER"
echo "Jenkins Workspace: $WORKSPACE"
mvn package
ls -lthr $WORKSPACE/target
