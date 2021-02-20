FROM mcr.microsoft.com/dotnet/sdk:3.1
COPY / /usr/share/dotnet/
RUN ls -la usr/lib/*

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# install sonar scanner
RUN dotnet tool install dotnet-sonarscanner --tool-path . --version 5.0.4

COPY sonar-scanner.sh  /

ENV DOTNET_ROOT=/usr/share/dotnet

RUN chmod +x /sonar-scanner.sh

ENTRYPOINT ["/sonar-scanner.sh"]
