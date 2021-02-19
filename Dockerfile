FROM mcr.microsoft.com/dotnet/sdk:3.1
COPY / /opt/Unity/Editor/Data/NetCore/Sdk-3.1/
RUN ls -la /*

# install sonar scanner
RUN /opt/Unity/Editor/Data/NetCore/Sdk-3.1/dotnet tool install dotnet-sonarscanner --tool-path . --version 5.0.4

COPY sonar-scanner.sh  /

ENV DOTNET_ROOT=/opt/Unity/Editor/Data/NetCore/Sdk-3.1/

RUN chmod +x /sonar-scanner.sh

ENTRYPOINT ["/sonar-scanner.sh"]
