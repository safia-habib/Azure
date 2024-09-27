# Instrumenting Java Linux WebApps with Dynatrace OneAgent 

For Linux App Services / WebApps running Java app use the following guide to instrument the app service with Dynatrace OneAgent

1. Add the following environment variables with values from Dynatrace in App Service -> Settings -> Environment Variables section:
     DT_API_TOKEN, DT_ENDPOINT, DT_INCLUDE, START_APP_CMD
     Note the Values for this example (Java Linux Web App are)
     DT_INCLUDE = java and START_APP_CMD = /usr/local/tomcat/bin/startup.sh
     DT_ENDPOINT and DT_API_TOKEN (PaaS token to download the Dynatrace Installer) are obtained from the Dynatrace environment
   ![LinuxWebApp_EnvironmentVariables.png]
2. Add the following into a dtagentinstaller.sh file and store it into a Storage Account on Azure. The file is also available to download from the repo. You can download the dtagentinstaller.sh from this folder and add it to the Storage Account as follows:
   ![LinuxWebApp_StorageAccount.png]
  
   ```
   #!/bin/sh
   readonly installerWrapperInstallationPath=/tmp/installer-wrapper.sh
   readonly installerWrapperURL=https://raw.githubusercontent.com/dynatrace-oss/cloud-snippets/main/azure/linux-app-service/oneagent-installer.sh
   wget -O $installerWrapperInstallationPath $installerWrapperURL
   DT_ENDPOINT=$DT_ENDPOINT DT_API_TOKEN=$DT_API_TOKEN DT_INCLUDE=$DT_INCLUDE START_APP_CMD=$START_APP_CMD sh $installerWrapperInstallationPath
   ```
3. Add the Mapping of the Storage Accunt in the web app
   ![LinuxWebApp_PathMappings.png]
4. Add the Installer script  as the Startup Command
   ![LinuxWebApp_StartupCommand.png]
5. View Data in Dynatrace:
   ![image](https://github.com/user-attachments/assets/03e9d9d6-73a8-41f6-9099-1bfe7c6aa80b)

     
