#!/bin/bash
# Script used in Jenkins to do a Helm Upgrade
# Presumes the path to KUBECONFIG has been set to the active cluster
# In a multi-geo deployment, each jenkins job would set this to it's region, in the release defintion
# export KUBECONFIG=/home/stevelas/k8s-configs/acrdemoeus

echo REGISTRY:$REGISTRY
echo REPOSITORY:$REPOSITORY
echo TAG:$TAG
pwd
case $REPOSITORY in
  demo42/helloworld*)
    echo helm upgrade demo42-helloworld ./helm/ --reuse-values --set web.image=$REGISTRY/$REPOSITORY:$TAG 
    helm upgrade demo42-helloworld ./helm/ --reuse-values --set web.image=$REGISTRY/$REPOSITORY:$TAG 
  ;;
  *)
    echo helm upgrade demo42-helloworld . --reuse-values 
    helm upgrade demo42-helloworld ./helm/ --reuse-values
  ;;
esac
