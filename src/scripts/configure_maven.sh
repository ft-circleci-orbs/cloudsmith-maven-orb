#!/bin/bash

# shellcheck disable=SC2016
# shellcheck disable=SC2129

set +e

if [ -z "$CLOUDSMITH_MAVEN_REGISTRY" ]
then
  echo "Unable to configure MAVEN. Env var CLOUDSMITH_MAVEN_REGISTRY is not defined. Please run the set_env_vars_for_maven command first."
  exit 1
fi

maven config set registry="$CLOUDSMITH_MAVEN_REGISTRY"

echo "MAVEN has been configured to use Cloudsmith registry with $CLOUDSMITH_MAVEN_REGISTRY."
