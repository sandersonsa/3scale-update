#!/bin/bash

# registry.redhat.io
REGISTRY_URL=registry.redhat.io
DEPLOYED_APP_LABEL=$(oc get dc backend-listener -o json | jq .spec.template.metadata.labels.app -r)

echo " ## ## DEPLOYED_APP_LABEL is not empty "
echo  ${DEPLOYED_APP_LABEL}

echo " ## ## Removing the BASE_URL field"
oc patch secret system-master-apicast --type=json -p='[{"op": "remove", "path": "/data/BASE_URL"}]'
oc get secret system-master-apicast -o json | jq .data

echo " ## ## Updating 3scale version number"
oc patch cm system-environment --patch '{"data": {"AMP_RELEASE": "2.9"}}'
oc get cm system-environment -o json | jq '.data["AMP_RELEASE"]'

echo " ## ## Upgrading 3scale images"
oc patch imagestream/amp-system --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "AMP system 2.9"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/system-rhel7:3scale2.9"}, "name": "2.9", "referencePolicy": {"type": "Source"}}}]'

echo " ## ## Patch the system-app ImageChange trigger"
oc set triggers dc/system-app --from-image=amp-system:latest --containers=system-master,system-developer,system-provider --remove
oc set triggers dc/system-app --from-image=amp-system:2.9 --containers=system-master,system-developer,system-provider

echo " ## ## Patch the system-sidekiq ImageChange trigger"
oc set triggers dc/system-sidekiq --from-image=amp-system:latest --containers=system-sidekiq,check-svc --remove
oc set triggers dc/system-sidekiq --from-image=amp-system:2.9 --containers=system-sidekiq,check-svc

echo " ## ## Patch the system-sphinx ImageChange trigger"
oc set triggers dc/system-sphinx --from-image=amp-system:latest --containers=system-sphinx,system-master-svc --remove
oc set triggers dc/system-sphinx --from-image=amp-system:2.9 --containers=system-sphinx,system-master-svc

echo " ## ## Patch the apicast image"
oc patch imagestream/amp-apicast --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "AMP APIcast 2.9"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/apicast-gateway-rhel8:3scale2.9"}, "name": "2.9", "referencePolicy": {"type": "Source"}}}]'
oc set triggers dc/apicast-staging --from-image=amp-apicast:latest --containers=apicast-staging --remove
oc set triggers dc/apicast-staging --from-image=amp-apicast:2.9 --containers=apicast-staging

echo " ## ## Patch the apicast-production ImageChange trigger:"
oc set triggers dc/apicast-production --from-image=amp-apicast:latest --containers=apicast-production,system-master-svc --remove
oc set triggers dc/apicast-production --from-image=amp-apicast:2.9 --containers=apicast-production,system-master-svc
oc tag -d amp-apicast:latest

echo " ## ## Patch the backend image"
oc patch imagestream/amp-backend --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "AMP Backend 2.9"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.9"}, "name": "2.9", "referencePolicy": {"type": "Source"}}}]'
oc set triggers dc/backend-listener --from-image=amp-backend:latest --containers=backend-listener --remove
oc set triggers dc/backend-listener --from-image=amp-backend:2.9 --containers=backend-listener

echo " ## ## Patch the backend-worker ImageChange trigger:"
oc set triggers dc/backend-worker --from-image=amp-backend:latest --containers=backend-worker,backend-redis-svc --remove
oc set triggers dc/backend-worker --from-image=amp-backend:2.9 --containers=backend-worker,backend-redis-svc
oc tag -d amp-backend:latest

echo " ## ## Patch the backend-cron ImageChange trigger:"
oc set triggers dc/backend-cron --from-image=amp-backend:latest --containers=backend-cron,backend-redis-svc --remove
oc set triggers dc/backend-cron --from-image=amp-backend:2.9 --containers=backend-cron,backend-redis-svc

echo " ## ## Patch the zync image"
oc patch imagestream/amp-zync --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "AMP Zync 2.9"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/zync-rhel7:3scale2.9"}, "name": "2.9", "referencePolicy": {"type": "Source"}}}]'
oc set triggers dc/zync --from-image=amp-zync:latest --containers=zync,zync-db-svc --remove
oc set triggers dc/zync --from-image=amp-zync:2.9 --containers=zync,zync-db-svc

echo " ## ## Patch the zync-que ImageChange trigger:"
oc set triggers dc/zync-que --from-image=amp-zync:latest --containers=que --remove
oc set triggers dc/zync-que --from-image=amp-zync:2.9 --containers=que
oc tag -d amp-zync:latest

echo " ## ## Patch the zync-que ImageChange trigger:"
oc set triggers dc/zync-que --from-image=amp-zync:latest --containers=que --remove
oc set triggers dc/zync-que --from-image=amp-zync:2.9 --containers=que
oc tag -d amp-zync:latest

echo " ## ## Patch the system-memcached image"
oc patch imagestream/system-memcached --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System 2.9 Memcached"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/memcached-rhel7:3scale2.9"}, "name": "2.9", "referencePolicy": {"type": "Source"}}}]'
oc set triggers dc/system-memcache --from-image=system-memcached:latest --containers=memcache --remove
oc set triggers dc/system-memcache --from-image=system-memcached:2.9 --containers=memcache
oc tag -d system-memcached:latest

echo " ## ## Patch the zync-database-postgresql image"
oc patch imagestream/zync-database-postgresql --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "Zync 2.9 PostgreSQL"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/rhscl/postgresql-10-rhel7"}, "name": "2.9", "referencePolicy": {"type": "Source"}}}]'
oc get is zync-database-postgresql

echo " ## ## Patch the zync-database ImageChange trigger:"
oc set triggers dc/zync-database --from-image=zync-database-postgresql:latest --containers=postgresql --remove
oc set triggers dc/zync-database --from-image=zync-database-postgresql:2.9 --containers=postgresql
oc tag -d zync-database-postgresql:latest

echo " ## ## Additional image changes"
echo " ## ## backend-redis DeploymentConfig"
oc patch imagestream/backend-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "Backend 2.9 Redis"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/rhscl/redis-32-rhel7:3.2"}, "name": "2.9", "referencePolicy": {"type": "Source"}}}]'
oc get is backend-redis
oc set triggers dc/backend-redis --from-image=backend-redis:latest --containers=backend-redis --remove
oc set triggers dc/backend-redis --from-image=backend-redis:2.9 --containers=backend-redis
oc tag -d backend-redis:latest

echo " ## ## system-redis DeploymentConfig"
oc patch imagestream/system-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System 2.9 Redis"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/rhscl/redis-32-rhel7:3.2"}, "name": "2.9", "referencePolicy": {"type": "Source"}}}]'
oc get is system-redis
oc set triggers dc/system-redis --from-image=system-redis:latest --containers=system-redis --remove
oc set triggers dc/system-redis --from-image=system-redis:2.9 --containers=system-redis
oc tag -d system-redis:latest

echo " ## ## system-mysql DeploymentConfig"
oc patch imagestream/system-mysql --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System 2.9 MySQL"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/rhscl/mysql-57-rhel7:5.7"}, "name": "2.9", "referencePolicy": {"type": "Source"}}}]'
oc get is system-mysql
oc set triggers dc/system-mysql --from-image=system-mysql:latest --containers=system-mysql --remove
oc set triggers dc/system-mysql --from-image=system-mysql:2.9 --containers=system-mysql
oc tag -d system-mysql:latest

echo " ## ## Confirm image URLs"
THREESCALE_DC_NAMES="apicast-production apicast-staging backend-cron backend-listener backend-redis backend-worker system-app system-memcache system-mysql system-redis system-sidekiq system-sphinx zync zync-database zync-que"
for component in ${THREESCALE_DC_NAMES}; do echo -n "${component} image: " && oc get dc $component -o json | jq .spec.template.spec.containers[0].image ; done

echo " ## ## After you have performed all the listed steps, 3scale upgrade from 2.8 to 2.9.1 in a template-based deployment is now complete."

# This triggers a redeployment of
# oc rollout latest dc/system-app -n claro-3scale
# - system-app
# - system-sidekiq
# - system-sphinx
# - apicast-staging
# - apicast-production
# - backend-listener
# - backend-worker
# - backend-cron
# - zync
# - zync-que
# - system-memcache
# - zync-database
# - backend-redis
# - system-redis
# - system-mysql