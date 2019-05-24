FROM ubuntu:16.04

LABEL maintainer "jhendrick@cloudbees.com"

RUN apt-get update \
    && apt-get -y install curl less vim wget

COPY ElectricFlowAgent-x64-9.0.1.136311 /tmp/ElectricFlowAgent-x64-9.0.1.136311
COPY install-letsencrypt-in-jdk.sh /tmp/install-letsencrypt-in-jdk.sh

# install the agent in silent mode
RUN chmod +x /tmp/ElectricFlowAgent-x64-9.0.1.136311 \
    && chmod +x /tmp/install-letsencrypt-in-jdk.sh \
    && /tmp/ElectricFlowAgent-x64-9.0.1.136311 --mode silent \
    && mkdir -p /opt/electriccloud/data \
    && /tmp/install-letsencrypt-in-jdk.sh \
    && rm -f /tmp/ElectricFlowAgent-x64-9.0.1.136311 \
    && rm -f /tmp/install-letsencrypt-in-jdk.sh

ENV COMMANDER_HOME=/opt/electriccloud/electriccommander
ENV COMMANDER_DATA=/opt/electriccloud/data
ENV PATH=$COMMANDER_HOME/bin:$PATH