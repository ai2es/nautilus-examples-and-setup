#!/bin/sh

PODNAME=$(kubectl get pods | grep -o 'test-deployment[a-z0-9\-]*')

kubectl exec -it "$PODNAME" -- /bin/bash
