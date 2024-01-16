#!/bin/sh

#source /.env.example

/generateMasterProxies

/appendEnvToYaml config.yaml

./clash -f config.yaml
