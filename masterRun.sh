#!/bin/sh

#source /.env.example

/generateMasterProxies

/appendEnvToYaml config-master.yaml

python /code/main.py & ./clash -f config-master.yaml && fg
