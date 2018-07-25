# Integrating Dynatrace OneAgent with Azure Web Roles #

1. Add the InstallDynatraceInCloudService.ps1 and startup-dynatrace.cmd in bin folder of Cloud Service and Web Role Projects
2. Add Dynatrace Environment and Dynatrace APi Token in ServiceDefination.csdef file as required configurations parameters. Add the startup-dynatrace.cmd file as a startup task 
3. Add the values for Dynatrace Environment, Dynatrace API Token in the ServiceConfiguration.cscfg file. You Can get these values from your Dynatrace Environment. 


## What do the files do ##  
## InstallDynatraceInCloudService.ps1 ##
This script is responsible for installing the Dynatrace OneAgent into the Cloud services applications 
The Script does the following:
1. Section 1 (Function Section) - Creates the functions for Logging - when to log an error, warning and information for future debugging
2. Section 2 (Main Section) - Runs checks to see if the Agent can be installed (if the application is a Cloud Service or running in an emulator), loads the environment variables (Dynatrace Tenant ID and the API Token for authentication), Establishes connection with the Dyantrace Environment to download the connection properties, Downloads the Dynatrace OneAgent from the Dynatrace environment, unzips it, searches for the .msi from the files and executes it to install the Dynatrace OneAgent

## ServiceDefinition.csdef ##
There are two required settings added in the defination file - Dynatrace Environment and Dynatrace APi Token. This is to identify the Dynatrace tenant where the agent should be downloaded from and the token is used for authentication 
There is where the startup command to call the powershell script to download and install the OneAgent

## ServiceConfiguration.Cloud.cscfg ##
In this file the values for the configuration settings which are defined in the ServiceDefination.csdef file are mentioned.

## startup-dynatrace.cmd ## 
When the cloud service is deployed the cmd file is executed which calls the powershell script to download and install the Dynatrace OneAgent. 
