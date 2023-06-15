#!/bin/sh
#
# WARNING: DO NOT USE THIS METHOD WITH LARGE AMOUNTS OF DATA

PODNAME=$(kubectl get pods | grep -o 'test-deployment[a-z0-9\-]*')

kubectl cp 'command.sh' "$PODNAME:/opt/pvc/command.sh"
