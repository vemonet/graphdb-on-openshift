#!/bin/bash

oc delete -f graphdb-master-1-deployment.yaml
oc delete -f graphdb-master-2-deployment.yaml
oc delete -f graphdb-worker-1-deployment.yaml
oc delete -f graphdb-worker-2-deployment.yaml
oc delete -f graphdb-worker-3-deployment.yaml
oc delete -f graphdb-worker-4-deployment.yaml