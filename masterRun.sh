#!/bin/sh

#source /.env.example

/generateMasterProxies

/appendEnvToYaml config-master.yaml

./clash -f config-master.yaml
