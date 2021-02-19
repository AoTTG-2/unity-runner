  # install sonar scanner
RUN /opt/Unity/Editor/Data/NetCore/Sdk-2.2.107/dotnet tool install dotnet-sonarscanner --tool-path . --version 5.0.4

COPY sonar-scanner.sh  /

ENV DOTNET_ROOT=/opt/Unity/Editor/Data/NetCore/Sdk-2.2.107/

RUN chmod +x /sonar-scanner.sh

ENTRYPOINT ["/sonar-scanner.sh"]
