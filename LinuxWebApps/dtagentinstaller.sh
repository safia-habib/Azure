#!/bin/sh
readonly installerWrapperInstallationPath=/tmp/installer-wrapper.sh
readonly installerWrapperURL=https://raw.githubusercontent.com/dynatrace-oss/cloud-snippets/main/azure/linux-app-service/oneagent-installer.sh
wget -O $installerWrapperInstallationPath $installerWrapperURL
DT_ENDPOINT=$DT_ENDPOINT DT_API_TOKEN=$DT_API_TOKEN DT_INCLUDE=$DT_INCLUDE START_APP_CMD=$START_APP_CMD sh $installerWrapperInstallationPath