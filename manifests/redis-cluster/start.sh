#!/bin/sh
set -x

ROOT=$(cd `dirname $0`; pwd)
cd $ROOT

helm upgrade -i redis \
	--create-namespace \
	--namespace dependency \
	-f ./values.yaml \
	-f ./my-values.yaml \
	./redis-ha \
	--atomic \
	--timeout 2m0s
