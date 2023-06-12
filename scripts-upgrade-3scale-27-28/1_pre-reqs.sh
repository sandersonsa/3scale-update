#!/bin/sh

docker pull registry.redhat.io/3scale-amp2/system-rhel7:3scale2.8
docker pull registry.redhat.io/3scale-amp2/apicast-gateway-rhel8:3scale2.8
docker pull registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.8
docker pull registry.redhat.io/3scale-amp2/zync-rhel7:3scale2.8
docker pull registry.redhat.io/3scale-amp2/memcached-rhel7:3scale2.8
#docker pull registry.redhat.io/rhscl/postgresql-10-rhel7
#docker pull registry.redhat.io/rhscl/mysql-57-rhel7:5.7
#docker pull registry.redhat.io/rhscl/redis-32-rhel7:3.2

docker tag registry.redhat.io/3scale-amp2/system-rhel7:3scale2.8 docker-registry.novalte.corp/amp/amp-system:2.8
docker tag registry.redhat.io/3scale-amp2/apicast-gateway-rhel8:3scale2.8 docker-registry.novalte.corp/amp/amp-apicast:2.8
docker tag registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.8 docker-registry.novalte.corp/amp/amp-backend:2.8
docker tag registry.redhat.io/3scale-amp2/zync-rhel7:3scale2.8 docker-registry.novalte.corp/amp/amp-zync:2.8
docker tag registry.redhat.io/3scale-amp2/memcached-rhel7:3scale2.8 docker-registry.novalte.corp/amp/memcached:2.8




docker push docker-registry.novalte.corp/amp/amp-system:2.8
docker push docker-registry.novalte.corp/amp/amp-apicast:2.8
docker push docker-registry.novalte.corp/amp/amp-backend:2.8
docker push docker-registry.novalte.corp/amp/amp-zync:2.8
docker push docker-registry.novalte.corp/amp/memcached:2.8


# desde satellite
# echo "creando tag en image stream de version 2.8 directamente desde satellite"
# oc create imagestreamtag amp-system:2.8 --from-image=cancun.novalte.corp:5000/wom-red_hat_container_catalog-system-rhel7:3scale2.8 -n amp --insecure=true
# oc create imagestreamtag amp-apicast:2.8 --from-image=cancun.novalte.corp:5000/wom-red_hat_container_catalog-apicast-gateway-rhel8:3scale2.8 -n amp --insecure=true
# oc create imagestreamtag amp-backend:2.8 --from-image=cancun.novalte.corp:5000/wom-red_hat_container_catalog-backend-rhel7:3scale2.8 -n amp --insecure=true
# oc create imagestreamtag amp-zync:2.8 --from-image=cancun.novalte.corp:5000/wom-red_hat_container_catalog-zync-rhel7:3scale2.8 -n amp --insecure=true
# oc create imagestreamtag memcached:2.8 --from-image=cancun.novalte.corp:5000/wom-red_hat_container_catalog-memcached-rhel7:3scale2.8 -n amp --insecure=true

echo "verificando tag de image stream para amp-system"
echo "------------"
oc describe is amp-system |grep 2.8

echo "verificando tag de image stream para amp-apicast"
echo "------------"
oc describe is amp-apicast |grep 2.8

echo "verificando tag de image stream para amp-backend"
echo "------------"
oc describe is amp-backend |grep 2.8

echo "verificando tag de image stream para amp-zync"
echo "------------"
oc describe is amp-zync |grep 2.8

echo "verificando tag de image stream para memcached"
echo "------------"
oc describe is memcached |grep 2.8
