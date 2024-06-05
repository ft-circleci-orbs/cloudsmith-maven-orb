#!/bin/bash

# shellcheck disable=SC2016
# shellcheck disable=SC2129

set +e

if [ -z "$CLOUDSMITH_SERVICE_ACCOUNT" ] || [ -z "$CLOUDSMITH_OIDC_TOKEN" ]
then
  echo "Unable to find an OIDC token to use. Please ensure the cloudsmith-oidc/authenticate_with_oidc command has been run before this command."
  exit 1
fi

if [ -z "$CLOUDSMITH_REPOSITORY" ]
then
  echo "Unable to set environment variables for maven. Env var CLOUDSMITH_REPOSITORY is not defined."
  exit 1
fi

if [ -z "$CLOUDSMITH_DOWNLOADS_DOMAIN" ]
then
  echo "Unable to set environment variables for maven. Env var CLOUDSMITH_DOWNLOADS_DOMAIN is not defined."
  exit 1
fi

CLOUDSMITH_MAVEN_DOWNLOADS_DOMAIN="$CLOUDSMITH_DOWNLOADS_DOMAIN"
CLOUDSMITH_MAVEN_REPOSITORY_URL="https://$CLOUDSMITH_MAVEN_DOWNLOADS_DOMAIN/basic/$CLOUDSMITH_REPOSITORY/maven/"
CLOUDSMITH_MAVEN_TOKEN="$CLOUDSMITH_OIDC_TOKEN"
CLOUDSMITH_REPO_ID="cloudsmith"

echo "export CLOUDSMITH_REPOSITORY=\"$CLOUDSMITH_REPOSITORY\"" >> "$BASH_ENV"
echo "export CLOUDSMITH_MAVEN_REPOSITORY_URL=\"$CLOUDSMITH_MAVEN_REPOSITORY_URL\"" >> "$BASH_ENV"
echo "export CLOUDSMITH_SERVICE_ACCOUNT=\"$CLOUDSMITH_SERVICE_ACCOUNT\"" >> "$BASH_ENV"
echo "export CLOUDSMITH_MAVEN_TOKEN=\"$CLOUDSMITH_MAVEN_TOKEN\"" >> "$BASH_ENV"
echo "export CLOUDSMITH_REPO_ID=\"$CLOUDSMITH_REPO_ID\"" >> "$BASH_ENV"

echo "The following environment variables have been exported. Note, the OIDC token has been masked below."
echo ""
echo "CLOUDSMITH_MAVEN_REPOSITORY_URL=https://$CLOUDSMITH_MAVEN_DOWNLOADS_DOMAIN/basic/$CLOUDSMITH_REPOSITORY/maven/"
