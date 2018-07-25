@echo off
DATE /T >> c:\Dynatrace-Install.log 2>&1
TIME /T >> c:\Dynatrace-Install.log 2>&1

powershell -NoProfile -ExecutionPolicy unrestricted -File InstallDynatraceInCloudService.ps1 >> c:\Dynatrace-Install.log 2>&1
exit /B 0
