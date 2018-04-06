#!/bin/bash
#CodeDeploy Script which generates project specific WAR
#
ls -lthr
mvn package
ls -lthr $WORKSPACE/target
