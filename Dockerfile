FROM mcr.microsoft.com/dotnet/sdk:3.1
COPY / /usr/share/dotnet/
RUN ls -la /*

# install sonar scanner
RUN dotnet tool install dotnet-sonarscanner --tool-path . --version 4.7.1

COPY sonar-scanner.sh  /

ENV DOTNET_ROOT=/usr/share/dotnet

RUN chmod +x /sonar-scanner.sh

ENTRYPOINT ["/sonar-scanner.sh"]
