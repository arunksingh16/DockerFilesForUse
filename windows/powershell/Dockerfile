FROM mcr.microsoft.com/powershell:latest
#RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
RUN pwsh --command Install-Module -Name PowerShellGet -Force
RUN pwsh --command Install-Module -Name Az -AllowClobber -Force
