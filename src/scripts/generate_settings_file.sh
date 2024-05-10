#!/bin/bash

mkdir ~/.m2 && touch ~/.m2/settings.xml
echo -e "<settings>\n\t<servers>\n\t\t<server>\n\t\t\t<id>financial-times-financial-times-internal-releases</id>\n\t\t\t<username>$CLOUDSMITH_SERVICE_ACCOUNT</username>\n\t\t\t<password>$CLOUDSMITH_OIDC_KEY</password>\n\t\t</server>\n\t</servers>\n</settings>" > ~/.m2/settings.xml