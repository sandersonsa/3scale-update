#!/bin/bash

function waitdc() {
  oc rollout status dc/$1
}

# registry.redhat.io
REGISTRY_URL=registry.redhat.io

DEPLOYED_APP_LABEL=$(oc get dc backend-listener -o json | jq .spec.template.metadata.labels.app -r)


echo "DEPLOYED_APP_LABEL is not empty "
echo  ${DEPLOYED_APP_LABEL}

echo "Confirm that the system-smtp secret has been created"
oc get secret system-smtp -o yaml

echo "Verifying all data smtp from system-smtp secret"
oc get secret system-smtp -o json | jq -r .data.mykey | base64 -d

# MASTER_ACCESS_TOKEN=$(cat master-access-token.txt)

echo "Updating pre-hook with new command"
echo "----------"
oc patch dc/system-app -p '{"spec":{"strategy":{"rollingParams":{"pre":{"execNewPod":{"command":["bash","-c","bundle exec rake boot openshift:deploy"]}}}}}}'

waitdc system-app 

echo "Verifying new pre-hook command below"
echo "----------"
oc get dc system-app -o json | jq .spec.strategy.rollingParams.pre.execNewPod.command

echo "Patching pre-hook with new command"
echo "----------"
oc get dc system-app -o json | jq 'del(.spec.strategy.rollingParams.pre.execNewPod.env[] |select(.name == "SMTP_ADDRESS" // .name == "SMTP_USER_NAME" // .name =="SMTP_PASSWORD" // .name == "SMTP_DOMAIN" // .name == "SMTP_PORT" // .name== "SMTP_AUTHENTICATION" // .name == "SMTP_OPENSSL_VERIFY_MODE")) |.spec.strategy.rollingParams.pre.execNewPod.env +=[{"name":"SMTP_ADDRESS","valueFrom":{"secretKeyRef":{"key":"address","name":"system-smtp"}}},{"name":"SMTP_USER_NAME","valueFrom":{"secretKeyRef":{"key":"username","name":"system-smtp"}}},{"name":"SMTP_PASSWORD","valueFrom":{"secretKeyRef":{"key":"password","name":"system-smtp"}}},{"name":"SMTP_DOMAIN","valueFrom":{"secretKeyRef":{"key":"domain","name":"system-smtp"}}},{"name":"SMTP_PORT","valueFrom":{"secretKeyRef":{"key":"port","name":"system-smtp"}}},{"name":"SMTP_AUTHENTICATION","valueFrom":{"secretKeyRef":{"key":"authentication","name":"system-smtp"}}},{"name":"SMTP_OPENSSL_VERIFY_MODE","valueFrom":{"secretKeyRef":{"key":"openssl.verify.mode","name":"system-smtp"}}},{"name":"MASTER_ACCESS_TOKEN","valueFrom":{"secretKeyRef":{"key":"MASTER_ACCESS_TOKEN","name":"system-seed"}}}]' > dc-system-app.json

oc apply -f dc-system-app.json

echo "Verifying length Master Access Token - expected 1)"
echo "----------"
oc get dc system-app -o json | jq '.spec.strategy.rollingParams.pre.execNewPod.env| map(select(.name == "MASTER_ACCESS_TOKEN")) | length'

echo "Verifying Master Access Token"
echo "----------"
oc get dc system-app -o json | jq '.spec.strategy.rollingParams.pre.execNewPod.env| map(select(.name == "MASTER_ACCESS_TOKEN"))'

echo "Verifying SMTP Variables"
echo "----------"
oc get dc system-app -o json | jq '.spec.strategy.rollingParams.pre.execNewPod.env |map(select(.name | contains("SMTP")))'

waitdc system-app

echo "Patching the environment of the system-app"
echo "----------"
oc patch dc system-app type=json -p $(cat patch-system-app.json)

waitdc system-app

echo "Checking updates on containers"
echo "----------"

echo "system-developer"
oc get dc system-app -o json | jq '.spec.template.spec.containers | map(select(.name =="system-developer"))[].env | map(select(.name | contains("SMTP")))'
echo "----------"

echo "system-provider"
oc get dc system-app -o json | jq '.spec.template.spec.containers | map(select(.name =="system-provider"))[].env | map(select(.name | contains("SMTP")))'
echo "----------"

echo "system-master"
oc get dc system-app -o json | jq '.spec.template.spec.containers | map(select(.name =="system-master"))[].env | map(select(.name | contains("SMTP")))'
echo "----------"

echo "Patching the environment of the system-sidekiq"
echo "-----------"
oc patch dc/system-sidekiq --type=json -p $(cat patch-sidekiq.json)

echo "Verifying sidekiq smtp variables"
oc get dc system-sidekiq -o json | jq '.spec.template.spec.containers | map(select(.name =="system-sidekiq"))[].env | map(select(.name | contains("SMTP")))'

waitdc system-sidekiq

echo "Upgrading 3scale Version Number"
echo "----------"
# oc patch cm system-environment --type=json -p '{"data":{"AMP_RELEASE":"2.8"}}'
oc patch cm system-environment --patch '{"data": {"AMP_RELEASE": "2.8"}}'

echo "Verifying 3scale Version Number 2.8"
echo "----------"
oc get cm system-environment -o json | jq .data.AMP_RELEASE

echo "Upgrading 3scale ImageStreams"
echo "----------"
echo "1. amp-system imagestream"
echo "----------"
oc patch imagestream/amp-system --type=json -p '[{"op": "add", "path": "/spec/tags/-","value": {"annotations": {"openshift.io/display-name": "AMP system 2.8"}, "from": { "kind":"DockerImage", "name": "'$REGISTRY_URL'/amp/amp-system:2.8"},"name": "2.8", "referencePolicy": {"type": "Source"}}}]'
oc patch imagestream/amp-system --type=json -p '[{"op": "add", "path": "/spec/tags/-","value": {"annotations": {"openshift.io/display-name": "AMP system (latest)"}, "from": {"kind": "ImageStreamTag", "name": "2.8"}, "name": "latest", "referencePolicy": {"type":"Source"}}}]'

waitdc system-app
waitdc system-sphinx
waitdc system-sidekiq

echo "----------"
echo "2. amp-apicast imagestream"
echo "----------"
oc patch imagestream/amp-apicast --type=json -p '[{"op": "add", "path": "/spec/tags/-","value": {"annotations": {"openshift.io/display-name": "AMP APIcast 2.8"}, "from": { "kind":"DockerImage", "name": "'$REGISTRY_URL'/amp/amp-apicast:2.8"},"name": "2.8", "referencePolicy": {"type": "Source"}}}]'
oc patch imagestream/amp-apicast --type=json -p '[{"op": "add", "path": "/spec/tags/-","value": {"annotations": {"openshift.io/display-name": "AMP APIcast (latest)"}, "from": { "kind":"ImageStreamTag", "name": "2.8"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'

waitdc apicast-staging
waitdc apicast-production

echo "----------"
echo "3. amp-backend imagestream"
echo "----------"
oc patch imagestream/amp-backend --type=json -p '[{"op": "add", "path": "/spec/tags/-","value": {"annotations": {"openshift.io/display-name": "AMP Backend 2.8"}, "from": { "kind":"DockerImage", "name": "'$REGISTRY_URL'/amp/amp-backend:2.8"}, "name":"2.8", "referencePolicy": {"type": "Source"}}}]'
oc patch imagestream/amp-backend --type=json -p '[{"op": "add", "path": "/spec/tags/-","value": {"annotations": {"openshift.io/display-name": "AMP Backend (latest)"}, "from": {"kind": "ImageStreamTag", "name": "2.8"}, "name": "latest", "referencePolicy": {"type":"Source"}}}]'

waitdc backend-listener
waitdc backend-worker
waitdc backend-cron

echo "----------"
echo "4. amp-zync imagestream"
echo "----------"

oc patch imagestream/amp-zync --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "AMP Zync 2.8"}, "from": { "kind":"DockerImage", "name": "'$REGISTRY_URL'/amp/amp-zync:2.8"}, "name":"2.8", "referencePolicy": {"type": "Source"}}}]'
oc patch imagestream/amp-zync --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "AMP Zync (latest)"}, "from": { "kind":"ImageStreamTag", "name": "2.8"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'

waitdc zync
waitdc zync-que

echo "----------"
echo "5. amp-memcached imagestream"
echo "----------"
oc patch imagestream/system-memcached --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System 2.8 Memcached"}, "from": {"kind": "DockerImage", "name": "'$REGISTRY_URL'/amp/memcached:2.8"}, "name": "2.8", "referencePolicy": {"type": "Source"}}}]'
oc patch imagestream/system-memcached --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System Memcached (latest)"}, "from":{ "kind": "ImageStreamTag", "name": "2.8"}, "name": "latest", "referencePolicy": {"type":"Source"}}}]'

waitdc system-memcache

echo "----------"
echo "6. Setting AMP_RELEASE to 2.8"
echo "----------"
oc set env dc/system-app AMP_RELEASE=2.8

waitdc system-app

echo "----------"
echo "7. Creating Tags for ImageStreams that did not changed"
echo "----------"
#zync-database amp/postgresql-10-rhel7:latest
#backend-redis docker-registry-default.lab.wom.cl/openshift/redis:3.2
#system-redis docker-registry-default.lab.wom.cl/openshift/redis:3.2
#system-mysql docker-registry-default.lab.wom.cl/openshift/mysql:5.7

oc patch imagestream/zync-database-postgresql --type=json -p '[{"op": "add", "path":"/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "Zync 2.8 PostgreSQL"},"from": { "kind": "DockerImage", "name": "'$REGISTRY_URL'/amp/postgresql-10-rhel7:latest"},"name": "2.8", "referencePolicy": {"type": "Source"}}}]'
oc patch imagestream/zync-database-postgresql --type=json -p '[{"op": "add", "path":"/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "Zync PostgreSQL(latest)"}, "from": { "kind": "ImageStreamTag", "name": "2.8"}, "name": "latest","referencePolicy": {"type": "Source"}}}]'

waitdc zync-database

oc patch imagestream/backend-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "Backend 2.8 Redis"}, "from": { "kind": "DockerImage","name": "'$REGISTRY_URL'/openshift/redis:3.2"}, "name": "2.8", "referencePolicy": {"type":"Source"}}}]'
oc patch imagestream/backend-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "Backend Redis (latest)"}, "from": { "kind":"ImageStreamTag", "name": "2.8"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'

waitdc backend-redis

oc patch imagestream/system-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "System 2.8 Redis"}, "from": { "kind": "DockerImage","name": "'$REGISTRY_URL'/openshift/redis:3.2"}, "name": "2.8", "referencePolicy": {"type":"Source"}}}]'
oc patch imagestream/system-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "System Redis (latest)"}, "from": { "kind":"ImageStreamTag", "name": "2.8"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'

waitdc system-redis

oc patch imagestream/system-mysql --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "System 2.8 MySQL"}, "from": { "kind": "DockerImage","name": "'$REGISTRY_URL'/openshift/mysql:5.7"}, "name": "2.8", "referencePolicy": {"type":"Source"}}}]'
oc patch imagestream/system-mysql --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System MySQL (latest)"}, "from": { "kind": "ImageStreamTag", "name": "2.8"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'
waitdc system-mysql


echo "----------"
echo "Verifying new imagen in DeploymentConfigs"
echo "----------"
THREESCALE_DC_NAMES="apicast-production apicast-staging backend-cron backend-listener backend-redis backend-worker system-app system-memcache system-mysql system-redis system-sidekiq system-sphinx zync zync-database zync-que"

for component in ${THREESCALE_DC_NAMES}; do echo -n "${component} image: " && oc get dc $component -o json | jq .spec.template.spec.containers[0].image ; done

echo "----------"
echo "Deleting smtp ConfigMap"
echo "----------"
#oc delete cm smtp






