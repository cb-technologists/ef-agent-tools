# ef-agent-tools

Dockerfile for building an Electric Cloud image based on Ubuntu with a Tools Only Installation.

Reference: http://docs.electric-cloud.com/eflow_doc/8_1/Install/Mobile/Basic/Content/Install%20Guide/installing_ec/7silent_unattended_installation/dLinuxExamples.htm


docker build -t  darinpope/ef-tools:9.0.1.136311 .

ectool --debug 1 --timeout 5 --server ps9.ecloud-kdemo.com login dpope pic34080