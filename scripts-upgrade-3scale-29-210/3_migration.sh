#!/bin/bash

REGISTRY_URL=registry.redhat.io
DEPLOYED_APP_LABEL=$(oc get dc backend-listener -o json | jq .spec.template.metadata.labels.app -r)

echo "DEPLOYED_APP_LABEL is not empty "
echo  ${DEPLOYED_APP_LABEL}

echo " ## ## Updating 3scale version number"
oc patch cm system-environment --patch '{"data": {"AMP_RELEASE": "2.10"}}'
oc get cm system-environment -o json | jq '.data["AMP_RELEASE"]'

echo " ## ## Upgrading 3scale images"
echo " ## ## Patch the system image"
oc patch imagestream/amp-system --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "AMP system 2.10"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/system-rhel7:3scale2.10"}, "name": "2.10", "referencePolicy": {"type": "Source"}}}]'

echo " ## ## Patch the system-app ImageChange trigger "
oc set triggers dc/system-app --from-image=amp-system:2.9 --containers=system-master,system-developer,system-provider --remove
oc set triggers dc/system-app --from-image=amp-system:2.10 --containers=system-master,system-developer,system-provider
# oc rollout latest dc/system-app -n claro-3scale

echo " ## ## Patch the system-sidekiq ImageChange trigger "
oc set triggers dc/system-sidekiq --from-image=amp-system:2.9 --containers=system-sidekiq,check-svc --remove
oc set triggers dc/system-sidekiq --from-image=amp-system:2.10 --containers=system-sidekiq,check-svc
# oc rollout latest dc/system-sidekiq -n claro-3scale

echo " ## ## Patch the system-sphinx ImageChange trigger"
oc set triggers dc/system-sphinx --from-image=amp-system:2.9 --containers=system-sphinx,system-master-svc --remove
oc set triggers dc/system-sphinx --from-image=amp-system:2.10 --containers=system-sphinx,system-master-svc
# oc rollout latest dc/system-sphinx -n claro-3scale

echo " ## ## Patch the apicast image"
oc patch imagestream/amp-apicast --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "AMP APIcast 2.10"}, "from": {"kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/apicast-gateway-rhel8:3scale2.10"}, "name": "2.10", "referencePolicy": {"type": "Source"}}}]'
oc set triggers dc/apicast-staging --from-image=amp-apicast:2.9 --containers=apicast-staging --remove
oc set triggers dc/apicast-staging --from-image=amp-apicast:2.10 --containers=apicast-staging
# oc rollout latest dc/apicast-staging -n claro-3scale

echo " ## ## Patch the apicast-production ImageChange trigger:"
oc set triggers dc/apicast-production --from-image=amp-apicast:2.9 --containers=apicast-production,system-master-svc --remove
oc set triggers dc/apicast-production --from-image=amp-apicast:2.10 --containers=apicast-production,system-master-svc
# oc rollout latest dc/apicast-production -n claro-3scale

echo " ## ## Patch the backend image"
oc patch imagestream/amp-backend --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "AMP Backend 2.10"}, "from": {"kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.10"}, "name": "2.10", "referencePolicy": {"type": "Source"}}}]'
oc set triggers dc/backend-listener --from-image=amp-backend:2.9 --containers=backend-listener --remove
oc set triggers dc/backend-listener --from-image=amp-backend:2.10 --containers=backend-listener
# oc rollout latest dc/backend-listener -n claro-3scale

echo " ## ## Patch the backend-worker ImageChange trigger:"
oc set triggers dc/backend-worker --from-image=amp-backend:2.9 --containers=backend-worker,backend-redis-svc --remove
oc set triggers dc/backend-worker --from-image=amp-backend:2.10 --containers=backend-worker,backend-redis-svc
# oc rollout latest dc/backend-worker -n claro-3scale

echo " ## ## Patch the backend-cron ImageChange trigger:"
oc set triggers dc/backend-cron --from-image=amp-backend:2.9 --containers=backend-cron,backend-redis-svc --remove
oc set triggers dc/backend-cron --from-image=amp-backend:2.10 --containers=backend-cron,backend-redis-svc
# oc rollout latest dc/backend-cron -n claro-3scale

echo " ## ## Patch the zync image"
oc patch imagestream/amp-zync --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "AMP Zync 2.10"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/zync-rhel7:3scale2.10"}, "name": "2.10", "referencePolicy": {"type": "Source"}}}]'
oc set triggers dc/zync --from-image=amp-zync:2.9 --containers=zync,zync-db-svc --remove
oc set triggers dc/zync --from-image=amp-zync:2.10 --containers=zync,zync-db-svc
# oc rollout latest dc/zync -n claro-3scale

echo " ## ## Patch the zync-que ImageChange trigger:"
oc set triggers dc/zync-que --from-image=amp-zync:2.9 --containers=que --remove
oc set triggers dc/zync-que --from-image=amp-zync:2.10 --containers=que
# oc rollout latest dc/zync-que -n claro-3scale

echo " ## ## Patch the system-memcached image"
oc patch imagestream/system-memcached --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System 2.10 Memcached"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/3scale-amp2/memcached-rhel7:3scale2.10"}, "name": "2.10", "referencePolicy": {"type": "Source"}}}]'
oc set triggers dc/system-memcache --from-image=system-memcached:2.9 --containers=memcache --remove
oc set triggers dc/system-memcache --from-image=system-memcached:2.10 --containers=memcache
# oc rollout latest dc/system-memcache -n claro-3scale

echo " ## ## Patch the zync-database-postgresql image"
oc patch imagestream/zync-database-postgresql --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "Zync 2.10 PostgreSQL"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/rhscl/postgresql-10-rhel7"}, "name": "2.10", "referencePolicy": {"type": "Source"}}}]'
oc get is zync-database-postgresql

echo " ## ## Patch the zync-database ImageChange trigger:"
oc set triggers dc/zync-database --from-image=zync-database-postgresql:2.9 --containers=postgresql --remove
oc set triggers dc/zync-database --from-image=zync-database-postgresql:2.10 --containers=postgresql
# oc rollout latest dc/zync-database -n claro-3scale

echo " ## ## Additional image changes"
echo " ## ## Patch the backend-redis image stream"
oc patch imagestream/backend-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "Backend 2.10 Redis"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/rhscl/redis-32-rhel7:3.2"}, "name": "2.10", "referencePolicy": {"type": "Source"}}}]'
oc get is backend-redis

echo " ## ## Patch the backend-redis ImageChange trigger"
oc set triggers dc/backend-redis --from-image=backend-redis:2.9 --containers=backend-redis --remove
oc set triggers dc/backend-redis --from-image=backend-redis:2.10 --containers=backend-redis
# oc rollout latest dc/backend-redis -n claro-3scale

echo " ## ## Patch the system-redis image stream"
oc patch imagestream/system-redis --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System 2.10 Redis"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/rhscl/redis-32-rhel7:3.2"}, "name": "2.10", "referencePolicy": {"type": "Source"}}}]'
oc get is system-redis

echo " ## ## Patch the system-redis ImageChange trigger"
oc set triggers dc/system-redis --from-image=system-redis:2.9 --containers=system-redis --remove
oc set triggers dc/system-redis --from-image=system-redis:2.10 --containers=system-redis
# oc rollout latest dc/system-redis -n claro-3scale

echo " ## ## Patch the system-mysql image stream"
oc patch imagestream/system-mysql --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System 2.10 MySQL"}, "from": { "kind": "DockerImage", "name": "registry.redhat.io/rhscl/mysql-57-rhel7:5.7"}, "name": "2.10", "referencePolicy": {"type": "Source"}}}]'
oc get is system-mysql

echo " ## ## Patch the system-mysql ImageChange trigger"
oc set triggers dc/system-mysql --from-image=system-mysql:2.9 --containers=system-mysql --remove
oc set triggers dc/system-mysql --from-image=system-mysql:2.10 --containers=system-mysql

echo " ## ## Confirm image URLs ::"
THREESCALE_DC_NAMES="apicast-production apicast-staging backend-cron backend-listener backend-redis backend-worker system-app system-memcache system-mysql system-redis system-sidekiq system-sphinx zync zync-database zync-que"
for component in ${THREESCALE_DC_NAMES}; do echo -n "${component} image: " && oc get dc $component -o json | jq .spec.template.spec.containers[0].image ; done