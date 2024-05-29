#!/bin/bash

if [ -z "$CLOUDSMITH_ORGANISATION" ]
then
  echo "export CLOUDSMITH_ORGANISATION=\"financial-times\"" >> "$BASH_ENV"
fi

if [ -z "$CLOUDSMITH_DOWNLOADS_DOMAIN" ]
then
  echo "export CLOUDSMITH_DOWNLOADS_DOMAIN=\"packages.ft.com\"" >> "$BASH_ENV"
fi

if [ -z "$CLOUDSMITH_REPOSITORY" ]
then
  echo "export CLOUDSMITH_REPOSITORY=\"financial-times-internal-releases\"" >> "$BASH_ENV"
fi

echo "export CLOUDSMITH_MAVEN_UPLOAD_DOMAIN=\"maven.packages.ft.com\"" >> "$BASH_ENV"