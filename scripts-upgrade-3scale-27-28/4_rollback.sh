#!/bin/bash

function waitdc() {
  oc rollout status dc/$1
}

echo "Rolling Back pre-hook-pod"
oc patch dc/system-app -p "{\"spec\":{\"strategy\":{\"rollingParams\":{\"pre\":{\"execNewPod\":{\"command\":[\"bash\",\"-c\",\"bundle exec rake boot openshift:deploy MASTER_ACCESS_TOKEN=\\\"${MASTER_ACCESS_TOKEN}\\\""

waitdc system-app

oc patch imagestream/amp-system --type=json -p '[{"op": "add", "path": "/spec/tags/-","value": {"annotations": {"openshift.io/display-name": "AMP system (latest)"}, "from": {"kind": "ImageStreamTag", "name": "2.6"}, "name": "latest", "referencePolicy": {"type":"Source"}}}]'

waitdc system-app
waitdc system-sphinx
waitdc system-sidekiq

oc patch imagestream/amp-apicast --type=json -p '[{"op": "add", "path": "/spec/tags/-","value": {"annotations": {"openshift.io/display-name": "AMP APIcast (latest)"}, "from": { "kind":"ImageStreamTag", "name": "2.6"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'

waitdc apicast-production
waitdc apicast-staging

oc patch imagestream/amp-backend --type=json -p '[{"op": "add", "path": "/spec/tags/-","value": {"annotations": {"openshift.io/display-name": "AMP Backend (latest)"}, "from": {"kind": "ImageStreamTag", "name": "2.6"}, "name": "latest", "referencePolicy": {"type":"Source"}}}]'

waitdc backend-listener
waitdc backend-worker
waitdc backend-cron

oc patch imagestream/amp-zync --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "AMP Zync (latest)"}, "from": { "kind":"ImageStreamTag", "name": "2.6"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'

waitdc zync
waitdc zync-que

oc patch imagestream/system-memcached --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System Memcached (latest)"}, "from":{ "kind": "ImageStreamTag", "name": "2.6"}, "name": "latest", "referencePolicy": {"type":"Source"}}}]'

waitdc system-memcache

oc patch imagestream/zync-database-postgresql --type=json -p '[{"op": "add", "path":"/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "Zync PostgreSQL(latest)"}, "from": { "kind": "ImageStreamTag", "name": "2.6"}, "name": "latest","referencePolicy": {"type": "Source"}}}]'

waitdc zync-database-postgresql

oc patch imagestream/backend-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "Backend Redis (latest)"}, "from": { "kind":"ImageStreamTag", "name": "2.6"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'

waitdc backend-redis 

oc patch imagestream/system-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "System Redis (latest)"}, "from": { "kind":"ImageStreamTag", "name": "2.6"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'

waitdc system-redis

oc patch imagestream/system-mysql --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value":{"annotations": {"openshift.io/display-name": "System MySQL (latest)"}, "from": { "kind":"ImageStreamTag", "name": "2.6"}, "name": "latest", "referencePolicy": {"type": "Source"}}}'

waitdc system-mysql


