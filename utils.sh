#!/bin/bash

# Script to upgrade 3scale installation from version 2.8 to 2.9 on OpenShift 3.11

# Define variables
APP_NAMESPACE="your-app-namespace"
ADMIN_PORTAL="system-master"

# Switch to the target project namespace
oc project ${APP_NAMESPACE}

# Scale down the existing 3scale components
oc scale --replicas=0 dc/apicast-production -n ${APP_NAMESPACE}
oc scale --replicas=0 dc/apicast-staging -n ${APP_NAMESPACE}
oc scale --replicas=0 dc/system-app -n ${APP_NAMESPACE}
oc scale --replicas=0 dc/zync -n ${APP_NAMESPACE}
oc scale --replicas=0 dc/system-sidekiq -n ${APP_NAMESPACE}

# Upgrade the 3scale components
oc process -f https://raw.githubusercontent.com/3scale/3scale-amp-openshift-templates/2.9.0.GA/amp/amp.yml \
  -p WILDCARD_DOMAIN=${APP_NAMESPACE}.apps.example.com \
  -p ADMIN_USERNAME=admin \
  -p ADMIN_PASSWORD=admin \
  -p SYSTEM_BACKEND_USERNAME=admin \
  -p SYSTEM_BACKEND_PASSWORD=admin \
  -p ADMIN_PORTAL_HOST=${ADMIN_PORTAL}-${APP_NAMESPACE}.apps.example.com \
  -p ADMIN_PORTAL_BACKEND_USERNAME=admin \
  -p ADMIN_PORTAL_BACKEND_PASSWORD=admin \
  -n ${APP_NAMESPACE} | oc apply -f -

# Wait for the pods to start
echo "Waiting for pods to start..."
oc rollout status -w dc/apicast-production -n ${APP_NAMESPACE}
oc rollout status -w dc/apicast-staging -n ${APP_NAMESPACE}
oc rollout status -w dc/system-app -n ${APP_NAMESPACE}
oc rollout status -w dc/zync -n ${APP_NAMESPACE}
oc rollout status -w dc/system-sidekiq -n ${APP_NAMESPACE}

# Perform database migrations
oc exec $(oc get pods -l deploymentConfig=system-sidekiq -n ${APP_NAMESPACE} -o jsonpath='{.items[0].metadata.name}') -n ${APP_NAMESPACE} -- bin/rake db:migrate

# Scale up the upgraded components
oc scale --replicas=1 dc/apicast-production -n ${APP_NAMESPACE}
oc scale --replicas=1 dc/apicast-staging -n ${APP_NAMESPACE}
oc scale --replicas=1 dc/system-app -n ${APP_NAMESPACE}
oc scale --replicas=1 dc/zync -n ${APP_NAMESPACE}
oc scale --replicas=1 dc/system-sidekiq -n ${APP_NAMESPACE}

echo "Upgrade completed successfully!"


#!/bin/bash

# Define variables
CURRENT_VERSION="2.8"
UPGRADE_VERSION="2.9"
BACKUP_DIR="/path/to/backup/directory"

# Backup existing resources
echo "Backing up existing resources..."
mkdir -p $BACKUP_DIR
oc project <your-3scale-project>
oc export all -o yaml > $BACKUP_DIR/3scale-resources.yaml
oc export secret system-seed -o yaml > $BACKUP_DIR/system-seed-secret.yaml

# Upgrade 3scale
echo "Upgrading 3scale from $CURRENT_VERSION to $UPGRADE_VERSION..."
oc project <your-3scale-project>
oc patch system/amp-operator --type=json -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"quay.io/3scale/amp-operator:2.9"}]'

# Wait for upgrade to complete
echo "Waiting for the upgrade to complete..."
oc rollout status deployment/amp-operator -w

# Verify the upgrade
echo "Verifying the upgrade..."
oc get pods -l app=amp-operator -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.phase}{"\n"}{end}'

# Cleanup temporary resources
echo "Cleaning up temporary resources..."
oc delete pods -l name=amp-operator --now=true

echo "Upgrade completed successfully!"


#!/bin/bash

# Set variables
BACKUP_DIR="/path/to/backup/directory"
THREESCALE_PROJECT="your-3scale-project"
THREESCALE_TEMPLATE="3scale-api-management-template"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup existing resources
echo "Backing up existing resources..."
oc export all -n "$THREESCALE_PROJECT" > "$BACKUP_DIR"/backup.yaml

# Upgrade 3scale template
echo "Upgrading 3scale template..."
oc process "$THREESCALE_TEMPLATE" -n "$THREESCALE_PROJECT" \
  -p ADMIN_PASSWORD=admin -p WILDCARD_DOMAIN=your-wildcard-domain.com \
  -p SYSTEM_BACKEND_USERNAME=system -p SYSTEM_BACKEND_PASSWORD=system \
  -p WILDCARD_POLICY=Subdomain -p AMP_RELEASE=2.9 | oc apply -n "$THREESCALE_PROJECT" -f -

# Wait for the upgrade to complete
echo "Waiting for the upgrade to complete..."
sleep 10s

# Check the status of the upgrade
UPGRADE_STATUS=$(oc get pods -n "$THREESCALE_PROJECT" | grep Running | wc -l)
if [[ "$UPGRADE_STATUS" -gt 0 ]]; then
  echo "Upgrade completed successfully."
else
  echo "Upgrade failed. Restoring backup..."
  oc delete all --all -n "$THREESCALE_PROJECT"
  oc apply -f "$BACKUP_DIR"/backup.yaml -n "$THREESCALE_PROJECT"
  echo "Restored backup successfully."
fi
