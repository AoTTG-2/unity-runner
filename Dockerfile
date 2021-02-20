FROM mcr.microsoft.com/dotnet/sdk:3.1
COPY / /usr/share/dotnet/
RUN ls -la /*

# base image
FROM ubuntu: 16.04# install packages
RUN apt-get update && \
    apt-get install -y curl \
    wget \
    openjdk-8-jdkENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# install sonar scanner
RUN dotnet tool install dotnet-sonarscanner --tool-path . --version 5.0.4

COPY sonar-scanner.sh  /

ENV DOTNET_ROOT=/usr/share/dotnet

RUN chmod +x /sonar-scanner.sh

ENTRYPOINT ["/sonar-scanner.sh"]
