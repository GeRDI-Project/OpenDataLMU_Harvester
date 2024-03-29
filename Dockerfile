# GeRDI Harvester Image for Open Data LMU (OAI-PMH) Harvesters

FROM docker-registry.gerdi.research.lrz.de:5043/harvest/oai-pmh:0.6.0-test8

COPY config.json /var/lib/jetty/config/OaiPmhHarvesterService/config.json

USER root
RUN chown -R jetty:jetty /var/lib/jetty/
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY dfn-ca.crt.pem /usr/local/share/ca-certificates/dfn-ca.crt
RUN update-ca-certificates
USER jetty

EXPOSE 8080
