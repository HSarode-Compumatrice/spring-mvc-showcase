#!/bin/bash
#CodeDeploy Script which generates project specific WAR
#
pwd
ls -lthr
mvn package
ls -lthr $WORKSPACE/target
