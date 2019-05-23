FROM ubuntu:18.04

LABEL maintainer "jhendrick@cloudbees.com"

COPY ElectricFlowAgent-x86-9.0.1.136311 /opt/ElectricFlowAgent-x86-9.0.1.136311

RUN chmod +x /opt/ElectricFlowAgent-x86-9.0.1.136311

# These commands need to be run prior to install or the setup will fail
# See: http://docs.electric-cloud.com/eflow_doc/8_1/Install/Mobile/Basic/Content/Install%20Guide/installing_ec/3BeforeInstall.htm

RUN apt-get update
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install libbz2-1.0:i386 -y
RUN apt-get update
RUN apt-get install libuuid1:i386 -y

# install the agent in silent mode
RUN ./opt/ElectricFlowAgent-x86-9.0.1.136311 --mode silent