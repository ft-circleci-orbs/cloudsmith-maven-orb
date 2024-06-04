#!/bin/bash

# shellcheck disable=SC2016
# shellcheck disable=SC2129

# Check required environment variables are set and look valid
if [ -z "$CLOUDSMITH_ORGANISATION" ]
then
  echo "Unable to upload package. Env var CLOUDSMITH_ORGANISATION is not defined."
  exit 1
fi
if [ -z "$CLOUDSMITH_REPOSITORY" ]
then
  echo "Unable to upload package. Env var CLOUDSMITH_REPOSITORY is not defined."
  exit 1
fi
if [ -z "$CLOUDSMITH_OIDC_TOKEN" ]
then
  echo "Unable to upload package. Env var CLOUDSMITH_OIDC_TOKEN is not defined."
  exit 1
fi

# Check if the dist directory exists and is valid
if [ -d "$DIST_DIR" ]; then
  echo "$DIST_DIR is a valid directory."
else
  echo "$DIST_DIR is not a directory."
  exit 1
fi

# Test for a pom.xml file in root directory of maven project
LS_POM_CMD="ls -A ${DIST_DIR}/pom.xml"

if [ -z "$($LS_POM_CMD)" ]
then
  echo "$DIST_DIR does not a pom.xml file."
  exit 1
else
  echo "pom.xml file found."
fi

# Test for existence of src/main
LS_MAIN_CMD="ls -A ${DIST_DIR}/src/main"

if [ -z "$($LS_MAIN_CMD)" ]
then
  echo "$DIST_DIR does not contain a main directory."
  exit 1
else
  echo "main directory found."
fi

# Test for existence of src/test
LS_TEST_CMD="ls -A ${DIST_DIR}/src/test"

if [ -z "$($LS_TEST_CMD)" ]
then
  echo "$DIST_DIR does not contain a test directory."
  exit 1
else
  echo "test directory found."
fi


# Upload package using cli

# Check for existence of a target directory and *.jar file in that directory
LS_TARGET_CMD="ls -A ${DIST_DIR}/target"

if [ -z "$($LS_TARGET_CMD)" ]
then
  echo "$DIST_DIR does not contain a target directory."
  exit 1
else
  echo "target directory found."
  printf "getting file name"
  pwd
  echo ""
  for filename in "$DIST_DIR"/target/*.jar;
    do
      echo "file name is: $filename"
      [ -f "$filename" ] || continue

      echo "Uploading java maven package $filename to Cloudsmith repository $CLOUDSMITH_ORGANISATION/$CLOUDSMITH_REPOSITORY ..."
      echo "current working directory is:" && pwd
      echo "CLOUDSMITH_ORGANISATION: " && echo "$CLOUDSMITH_ORGANISATION"
      echo "CLOUDSMITH_REPOSITORY: " && echo "$CLOUDSMITH_REPOSITORY"
      echo ""
      printf 'cloudsmith push maven "$CLOUDSMITH_ORGANISATION"/"$CLOUDSMITH_REPOSITORY" --pom-file "$DIST_DIR"/pom.xml "$filename"'
      cloudsmith push maven "$CLOUDSMITH_ORGANISATION"/"$CLOUDSMITH_REPOSITORY" --pom-file "$DIST_DIR"/pom.xml "$filename"
      echo ""

      echo "Package upload and synchronisation completed OK."
    done
fi



