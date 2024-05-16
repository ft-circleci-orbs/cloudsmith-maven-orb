#!/bin/bash

shellcheck disable=SC2016
shellcheck disable=SC2129


set +e

if [ -z "$CLOUDSMITH_MAVEN_TOKEN" ]
then
  echo "Unable to configure MAVEN. Env var CLOUDSMITH_MAVEN_TOKEN is not defined. Please run the set_env_vars_for_maven command first."
  exit 1
fi

if [ -z "$CLOUDSMITH_MAVEN_REPOSITORY" ]
then
  echo "Unable to configure MAVEN. Env var CLOUDSMITH_MAVEN_REPOSITORY is not defined. Please run the set_env_vars_for_maven command first."
  exit 1
fi

echo "MAVEN has been configured to use Cloudsmith repository with $CLOUDSMITH_MAVEN_REPOSITORY."


# Check for existence of .m2 & settings.xml and create them if they don't exist
if [ -d "$HOME"/.m2 ]
then
  echo "\"$HOME\"/.m2 exists"
  if [ -f "$HOME"/.m2/settings.xml ]
  then
    echo "settings.xml exists"
  else
    echo "settings.xml does not exist"
    touch settings.xml
  fi
else
  echo "\"$HOME\"/.m2 does not exist. Creating \"$HOME\"/.m2/settings.xml"
  mkdir "$HOME"/.m2 && touch "$HOME"/.m2/settings.xml
  cat >> "$HOME"/.m2/settings.xml<< EOF
  <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">
    <servers>
        <server>
          <id>\$CLOUDSMITH_ORGANISATION-\$CLOUDSMITH_REPOSITORY</id>
            <username>\$CLOUDSMITH_SERVICE_ACCOUNT</username>
            <password>\$CLOUDSMITH_MAVEN_TOKEN</password>
        </server>
    </servers>
  </settings>
EOF
fi
