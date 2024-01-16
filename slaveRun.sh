#!/bin/sh

#source /.env.example

/appendEnvToYaml config.yaml

./clash -f config.yaml
