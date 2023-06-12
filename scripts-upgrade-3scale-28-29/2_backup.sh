#!/bin/bash -v

BACKUP_FOLDER=prod-backup-2.8-amp

oc project claro-3scale

# Section 2.2.1, “Creating a backup of the 3scale project”
mkdir -p $BACKUP_FOLDER

pushd $BACKUP_FOLDER
oc get dc system-app -o json | jq .spec.strategy.rollingParams.pre.execNewPod.command > pro-hook-pood.old.txt

THREESCALE_DC_NAMES="apicast-production apicast-staging backend-cron backend-listener backend-redis backend-worker system-app system-memcache system-mysql system-redis system-sidekiq system-sphinx zync zync-database zync-que"
for component in ${THREESCALE_DC_NAMES}; do oc get --export -o yaml dc ${component} > ${component}_dc.yml ; done

oc get -o yaml --export all --request-timeout=0 > threescale-project-elements.yaml

for object in rolebindings serviceaccounts secrets imagestreamtags cm rolebindingrestrictions limitranges resourcequotas pvc templates cronjobs statefulsets hpa deployments replicasets poddisruptionbudget endpoints;
do
  oc get -o yaml --export $object > $object.yaml
done


THREESCALE_IMAGESTREAM_NAMES="amp-apicast amp-backend amp-system amp-zync zync-database-postgresql system-memcached"
for component in ${THREESCALE_IMAGESTREAM_NAMES}; do oc get --export -o yaml is ${component} > ${component}_is.yml ; done

oc get --export -o yaml secret system-redis --request-timeout=0 > system-redis_secret.yml

for object in `oc get routes | awk '{print $1}' | grep -v NAME`; do oc get -o yaml --export route ${object} > ${object}_route.yaml; done

oc rsh $(oc get pods -l 'deploymentConfig=system-mysql' -o json | jq -r '.items[0].metadata.name') bash -c 'export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}; mysqldump --single-transaction -hsystem-mysql -uroot system' | gzip > system-mysql-backup.gz

mkdir -p system-storage

oc rsync $(oc get pods -l 'deploymentConfig=system-app' -o json | jq '.items[0].metadata.name' -r):/opt/system/public/system ./system-storage

oc rsh $(oc get pods -l 'deploymentConfig=zync-database' -o json | jq '.items[0].metadata.name' -r) bash -c 'pg_dumpall -c --if-exists' | gzip > zync-database-backup.gz

oc cp $(oc get pods -l 'deploymentConfig=backend-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./backend-redis-dump.rdb

oc cp $(oc get pods -l 'deploymentConfig=system-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./system-redis-dump.rdb

echo " ## ## FIM BACKUP 2.8 ## ## "

popd
