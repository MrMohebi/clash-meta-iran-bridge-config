#!/bin/sh

#source /.env.example

/appendEnvToYaml config-slave.yaml

./clash -f config-slave.yaml
