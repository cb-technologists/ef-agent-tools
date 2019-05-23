FROM ubuntu:16.04

LABEL maintainer "jhendrick@cloudbees.com"

# These commands need to be run prior to install or the setup will fail
# See: http://docs.electric-cloud.com/eflow_doc/8_1/Install/Mobile/Basic/Content/Install%20Guide/installing_ec/3BeforeInstall.htm

#RUN apt-get update
#RUN dpkg --add-architecture i386
#RUN apt-get update
#RUN apt-get install libbz2-1.0:i386 -y
#RUN apt-get update
#RUN apt-get install libuuid1:i386 -y

COPY ElectricFlowAgent-x64-9.0.1.136311 /tmp/ElectricFlowAgent-x64-9.0.1.136311

# install the agent in silent mode
RUN chmod +x /tmp/ElectricFlowAgent-x64-9.0.1.136311 \
    && /tmp/ElectricFlowAgent-x64-9.0.1.136311 --mode silent \
    && mkdir -p /opt/electriccloud/data \
    && rm -f /tmp/ElectricFlowAgent-x64-9.0.1.136311

ENV COMMANDER_HOME=/opt/electriccloud/electriccommander
ENV COMMANDER_DATA=/opt/electriccloud/data
ENV PATH=$COMMANDER_HOME/bin:$PATH