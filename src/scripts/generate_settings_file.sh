#!/bin/bash

# Create .m2 directory and settings.xml file
# Check for existence of .m2 & settings.xml
mkdir ~/.m2 && touch ~/.m2/settings.xml
# CLOUDSMITH_MAVEN_USERNAME, CLOUDSMITH_MAVEN_PASSWORD, CLOUDSMITH_MAVEN_REPOSITORY
echo -e "<settings>\n\t<servers>\n\t\t<server>\n\t\t\t<id>financial-times-$CLOUDSMITH_REPOSITORY</id>\n\t\t\t<username>$CLOUDSMITH_SERVICE_ACCOUNT</username>\n\t\t\t<password>$CLOUDSMITH_MAVEN_TOKEN</password>\n\t\t</server>\n\t</servers>\n</settings>" > ~/.m2/settings.xml

# parameterise org

# merge into configure_maven & commands