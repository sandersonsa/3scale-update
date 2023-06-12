Working Dir:    /opt/app-root
User:           1001
Exposes Ports:  8080/tcp
Docker Labels:  architecture=x86_64
                build-date=2020-07-21T12:00:25.650018
                com.redhat.build-host=cpt-1004.osbs.prod.upshift.rdu2.redhat.com
                com.redhat.component=3scale-amp-apicast-gateway-container
                com.redhat.license_terms=https://www.redhat.com/agreements
                description=APIcast is not a standalone API gateway therefore it needs connection to the 3scale API management platform. The container includes OpenResty and uses LuaRocks to install dependencies (rocks are installed in the application folder).
                distribution-scope=public
                io.k8s.description=APIcast is not a standalone API gateway therefore it needs connection to the 3scale API management platform. The container includes OpenResty and uses LuaRocks to install dependencies (rocks are installed in the application folder).
                io.k8s.display-name=3scale API gateway (APIcast)
                io.openshift.expose-services=8080:apicast
                io.openshift.tags=integration, nginx, lua, openresty, api, gateway, 3scale, rhamp
                maintainer=3scale-engineering@redhat.com
                name=3scale-amp2/apicast-gateway-rhel8
                release=3.1595331932
                summary=3scale's API gateway (APIcast) is an OpenResty application which consists of two parts: Nginx configuration and Lua files.
                url=https://access.redhat.com/containers/#/registry.access.redhat.com/3scale-amp2/apicast-gateway-rhel8/images/1.17.1-3.1595331932
                vcs-ref=c992347ac3b8fdd0cc52bba51ce9543e75b5f90a
                vcs-type=git
                vendor=Red Hat, Inc.
                version=1.17.1
Environment:    PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
                container=oci
                AUTO_UPDATE_INTERVAL=0
                HOME=/opt/app-root/src
                LD_LIBRARY_PATH=:/opt/app-root/lib
                LUA_CPATH=./?.so;/usr/lib64/lua/5.1/?.so;/usr/lib64/lua/5.1/loadall.so;/usr/local/lib64/lua/5.1/?.so


sandersonsa@USU-E0FQ15C8F7S:~$ oc import-image openshift/backend-rhel7:3scale2.8 --from=registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.8 --confirmoc import-image openshift/backend-rhel7:3scale2.8 --from=registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.8 --confirm^C
sandersonsa@USU-E0FQ15C8F7S:~$ oc import-image openshift/backend-rhel7:3scale2.8 --from=registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.8 --confirm
imagestream.image.openshift.io/backend-rhel7 imported

Name:                   backend-rhel7
Namespace:              openshift
Created:                Less than a second ago
Labels:                 <none>
Annotations:            openshift.io/image.dockerRepositoryCheck=2023-06-06T17:51:21Z
Docker Pull Spec:       docker-registry.default.svc:5000/openshift/backend-rhel7
Image Lookup:           local=false
Unique Images:          1
Tags:                   1

3scale2.8
  tagged from registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.8

  * registry.redhat.io/3scale-amp2/backend-rhel7@sha256:d984c0cabe300e49e0933f981acb650e10073687e07af92036ab5fd4b301ea00
      Less than a second ago

Image Name:     backend-rhel7:3scale2.8
Docker Image:   registry.redhat.io/3scale-amp2/backend-rhel7@sha256:d984c0cabe300e49e0933f981acb650e10073687e07af92036ab5fd4b301ea00
Name:           sha256:d984c0cabe300e49e0933f981acb650e10073687e07af92036ab5fd4b301ea00
Created:        Less than a second ago
Annotations:    image.openshift.io/dockerLayersOrder=ascending
Image Size:     225.8MB in 6 layers
Layers:         76.24MB sha256:fc5b206e9329a1674dd9e8efbee45c9be28d0d0dcbabba3c6bb67a2f22cfcf2a
                1.744kB sha256:e7021e0589e97471d99c4265b7c8e64da328e48f116b5f260353b2e0a2adb373
                7.209MB sha256:9e7a6dc796f0a75c560158a9f9e30fb8b5a90cb53edce9ffbdf5778406e4de39
                88.07MB sha256:f659c5c779ac4373302bfe3dc7d713c59cf9ec9f179a71e9b26336a51043fad2
                14.16MB sha256:2cc7982e7aebf188738bbdca92ac97da911a12a3c38ff7e83898468976195aee
                40.09MB sha256:22315bd67864f63fdef41e254e334fd1a91d4690e0350c0b165800526edc3d58
Image Created:  2 years ago
Author:         <none>
Arch:           amd64
Entrypoint:     /bin/bash -- /opt/app/entrypoint.sh
Working Dir:    /opt/app
User:           1001
Exposes Ports:  3000/tcp, 8080/tcp
Docker Labels:  architecture=x86_64
                build-date=2020-07-29T19:13:44.143847
                com.redhat.build-host=cpt-1002.osbs.prod.upshift.rdu2.redhat.com
                com.redhat.component=3scale-amp-backend-container
                com.redhat.license_terms=https://www.redhat.com/agreements
                description=3scale is an API Management Platform suitable to manage both internal and external API services. This image contains the platform's backend, which takes care of applying rate limits, authorization, and reporting of HTTP(s) requests.
                distribution-scope=public
                io.k8s.description=3scale is an API Management Platform suitable to manage both internal and external API services. This image contains the platform's backend, which takes care of applying rate limits, authorization, and reporting of HTTP(s) requests.
                io.k8s.display-name=3scale API manager (backend)
                io.openshift.expose-services=3000:backend
                io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
                io.openshift.tags=api, backend, 3scale, 3scale-amp
                io.s2i.scripts-url=image:///usr/libexec/s2i
                maintainer=eastiz@redhat.com
                name=3scale-amp2/backend-rhel7
                release=31.1596049807
                summary=3scale API Management platform backend.
                url=https://access.redhat.com/containers/#/registry.access.redhat.com/3scale-amp2/backend-rhel7/images/1.11.0-31.1596049807
                usage=s2i build https://github.com/sclorg/s2i-ruby-container.git --context-dir=2.5/test/puma-test-app/ rhscl/ruby-25-rhel7 ruby-sample-app
                vcs-ref=6f777aa99a8b3e50cb392011da93926bf887ccd4
                vcs-type=git
                vendor=Red Hat, Inc.
                version=1.11.0
Environment:    PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
                container=oci
                SUMMARY=Platform for building and running Ruby 2.5 applications
                DESCRIPTION=Ruby 2.5 available as container is a base platform for building and running various Ruby 2.5 applications and frameworks. Ruby is the interpreted scripting language for quick and easy object-oriented programming. It has many features to process text files and to do system management tasks (as in Perl). It is simple, straight-forward, and extensible.
                STI_SCRIPTS_URL=image:///usr/libexec/s2i
                STI_SCRIPTS_PATH=/usr/libexec/s2i
                APP_ROOT=/opt/app-root
                HOME=/tmp/
                PLATFORM=el7
                BASH_ENV=/opt/app-root/etc/scl_enable
                ENV=/opt/app-root/etc/scl_enable
                PROMPT_COMMAND=. /opt/app-root/etc/scl_enable
                NODEJS_SCL=rh-nodejs10
                RUBY_MAJOR_VERSION=2
                RUBY_MINOR_VERSION=5
                RUBY_VERSION=2.5
                RUBY_SCL_NAME_VERSION=25
                RUBY_SCL=rh-ruby25
                IMAGE_NAME=rhscl/ruby-25-rhel7
                TZ=:/etc/localtime
                ENV_SETUP=/opt/app-root/etc/scl_enable
                RACK_ENV=production
                CONFIG_SAAS=false
                CONFIG_LOG_PATH=/tmp/
                CONFIG_NOTIFICATION_BATCH=1
                CONFIG_WORKERS_LOG_FILE=/dev/stdout
                PUMA_WORKERS=1


sandersonsa@USU-E0FQ15C8F7S:~$ oc import-image openshift/zync-rhel7:3scale2.8 --from=registry.redhat.io/3scale-amp2/zync-rhel7:3scale2.8 --confirm
imagestream.image.openshift.io/zync-rhel7 imported

Name:                   zync-rhel7
Namespace:              openshift
Created:                Less than a second ago
Labels:                 <none>
Annotations:            openshift.io/image.dockerRepositoryCheck=2023-06-06T17:51:40Z
Docker Pull Spec:       docker-registry.default.svc:5000/openshift/zync-rhel7
Image Lookup:           local=false
Unique Images:          1
Tags:                   1

3scale2.8
  tagged from registry.redhat.io/3scale-amp2/zync-rhel7:3scale2.8

  * registry.redhat.io/3scale-amp2/zync-rhel7@sha256:3fe2a111b7166edaf67d670004b6e6d5e7a6a100bef2959cc9b99eb82f3b2e23
      Less than a second ago

Image Name:     zync-rhel7:3scale2.8
Docker Image:   registry.redhat.io/3scale-amp2/zync-rhel7@sha256:3fe2a111b7166edaf67d670004b6e6d5e7a6a100bef2959cc9b99eb82f3b2e23
Name:           sha256:3fe2a111b7166edaf67d670004b6e6d5e7a6a100bef2959cc9b99eb82f3b2e23
Created:        Less than a second ago
Annotations:    image.openshift.io/dockerLayersOrder=ascending
Image Size:     223.2MB in 6 layers
Layers:         76.24MB sha256:fc5b206e9329a1674dd9e8efbee45c9be28d0d0dcbabba3c6bb67a2f22cfcf2a
                1.744kB sha256:e7021e0589e97471d99c4265b7c8e64da328e48f116b5f260353b2e0a2adb373
                7.209MB sha256:9e7a6dc796f0a75c560158a9f9e30fb8b5a90cb53edce9ffbdf5778406e4de39
                88.07MB sha256:f659c5c779ac4373302bfe3dc7d713c59cf9ec9f179a71e9b26336a51043fad2
                14.16MB sha256:2cc7982e7aebf188738bbdca92ac97da911a12a3c38ff7e83898468976195aee
                37.54MB sha256:5648311c0bfd73b6d9330b61a0852462d788863c443745b0a3632a9dd568a6c9
Image Created:  2 years ago
Author:         <none>
Arch:           amd64
Entrypoint:     /opt/zync/entrypoint.sh
Command:        bin/rails server --binding 0.0.0.0 --port 8080
Working Dir:    /opt/zync
User:           1001
Exposes Ports:  8080/tcp
Docker Labels:  architecture=x86_64
                build-date=2020-07-29T19:11:09.564844
                com.redhat.build-host=cpt-1006.osbs.prod.upshift.rdu2.redhat.com
                com.redhat.component=3scale-amp-zync-container
                com.redhat.license_terms=https://www.redhat.com/agreements
                description=Zync is going to take your 3scale data                    and push it somewhere else, reliably.                    Offers only one directional sync (from 3scale to other systems).
                distribution-scope=public
                io.k8s.description=Zync is going to take your 3scale data                    and push it somewhere else, reliably.                    Offers only one directional sync (from 3scale to other systems).
                io.k8s.display-name=Zync
                io.openshift.expose-services=8080:zync
                io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
                io.openshift.tags=sync, api management, 3scale, rhamp
                io.s2i.scripts-url=image:///usr/libexec/s2i
                maintainer=mcichra@redhat.com
                name=3scale-amp2/zync-rhel7
                release=32.1596049798
                summary=Zync - the sync tool
                url=https://access.redhat.com/containers/#/registry.access.redhat.com/3scale-amp2/zync-rhel7/images/1.11.0-32.1596049798
                usage=s2i build https://github.com/sclorg/s2i-ruby-container.git --context-dir=2.5/test/puma-test-app/ rhscl/ruby-25-rhel7 ruby-sample-app
                vcs-ref=138eb41882f259d977340db9a219104e85d6ab95
                vcs-type=git
                vendor=Red Hat, Inc.
                version=1.11.0
Environment:    PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
                container=oci
                SUMMARY=Platform for building and running Ruby 2.5 applications
                DESCRIPTION=Ruby 2.5 available as container is a base platform for building and running various Ruby 2.5 applications and frameworks. Ruby is the interpreted scripting language for quick and easy object-oriented programming. It has many features to process text files and to do system management tasks (as in Perl). It is simple, straight-forward, and extensible.
                STI_SCRIPTS_URL=image:///usr/libexec/s2i
                STI_SCRIPTS_PATH=/usr/libexec/s2i
                APP_ROOT=/opt/app-root
                HOME=/opt/app-root/src
                PLATFORM=el7
                BASH_ENV=/opt/app-root/etc/scl_enable
                ENV=/opt/app-root/etc/scl_enable
                PROMPT_COMMAND=. /opt/app-root/etc/scl_enable
                NODEJS_SCL=rh-nodejs10
                RUBY_MAJOR_VERSION=2
                RUBY_MINOR_VERSION=5
                RUBY_VERSION=2.5
                RUBY_SCL_NAME_VERSION=25
                RUBY_SCL=rh-ruby25
                IMAGE_NAME=rhscl/ruby-25-rhel7
                RAILS_ENV=production
                RAILS_LOG_TO_STDOUT=1
                BUNDLE_WITHOUT=development:test
                TZ=:/etc/localtime
                BUNDLE_GEMFILE=Gemfile
                DISABLE_SPRING=1
                GEMS_REPO=https://origin-repository.jboss.org/nexus/content/groups/rubygems_store/


sandersonsa@USU-E0FQ15C8F7S:~$ oc import-image openshift/memcached-rhel7:3scale2.8 --from=registry.redhat.io/3scale-amp2/memcached-rhel7:3scale2.8 --confirm
imagestream.image.openshift.io/memcached-rhel7 imported

Name:                   memcached-rhel7
Namespace:              openshift
Created:                Less than a second ago
Labels:                 <none>
Annotations:            openshift.io/image.dockerRepositoryCheck=2023-06-06T17:51:47Z
Docker Pull Spec:       docker-registry.default.svc:5000/openshift/memcached-rhel7
Image Lookup:           local=false
Unique Images:          1
Tags:                   1

3scale2.8
  tagged from registry.redhat.io/3scale-amp2/memcached-rhel7:3scale2.8

  * registry.redhat.io/3scale-amp2/memcached-rhel7@sha256:f8981dbf86761bed31d03c359f6c4552b49cf4d1f5a199cbd8b44c02b50d5bc6
      Less than a second ago

Image Name:     memcached-rhel7:3scale2.8
Docker Image:   registry.redhat.io/3scale-amp2/memcached-rhel7@sha256:f8981dbf86761bed31d03c359f6c4552b49cf4d1f5a199cbd8b44c02b50d5bc6
Name:           sha256:f8981dbf86761bed31d03c359f6c4552b49cf4d1f5a199cbd8b44c02b50d5bc6
Created:        Less than a second ago
Annotations:    image.openshift.io/dockerLayersOrder=ascending
Image Size:     91.49MB in 3 layers
Layers:         76.24MB sha256:fc5b206e9329a1674dd9e8efbee45c9be28d0d0dcbabba3c6bb67a2f22cfcf2a
                1.744kB sha256:e7021e0589e97471d99c4265b7c8e64da328e48f116b5f260353b2e0a2adb373
                15.25MB sha256:fd82d238b8be568afa8578e07a4d1db8e9a2a191bf7be1e470b2c0905c581c39
Image Created:  2 years ago
Author:         <none>
Arch:           amd64
Entrypoint:     memcached
Command:        -m 64 -vv
Working Dir:    <none>
User:           1001
Exposes Ports:  11211/tcp
Docker Labels:  architecture=x86_64
                build-date=2020-07-13T15:37:12.719478
                com.redhat.build-host=cpt-1008.osbs.prod.upshift.rdu2.redhat.com
                com.redhat.component=3scale-amp-memcached-container
                com.redhat.license_terms=https://www.redhat.com/agreements
                description=3scale container image used for caching.
                distribution-scope=public
                io.k8s.description=3scale container image used for caching.
                io.k8s.display-name=3scale API manager (memcached)
                io.openshift.expose-services=11211:memcached
                io.openshift.tags=caching, 3scale
                maintainer=hramihaj@redhat.com
                name=3scale-amp2/memcached-rhel7
                release=24.1594642185
                summary=3scale container image used for caching.
                url=https://access.redhat.com/containers/#/registry.access.redhat.com/3scale-amp2/memcached-rhel7/images/1.4.16-24.1594642185
                vcs-ref=5eb130b13a31b9d75101115573efe644113afb1a
                vcs-type=git
                vendor=Red Hat, Inc.
                version=1.4.16
Environment:    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
                container=oci


sandersonsa@USU-E0FQ15C8F7S:~$ cd /mnt/c/
$Recycle.Bin/              Documents and Settings/    Program Files/             ProgramData/               System Volume Information/ Windows/
Arquivos de Programas/     PerfLogs/                  Program Files (x86)/       Recovery/                  Users/
sandersonsa@USU-E0FQ15C8F7S:~$ cd /mnt/c/Users/sandersonsa/Documents/
3scale-scripts_upgrade-27-28/ Minhas Imagens/               oc/                           oclinux/
Meus Vídeos/                  Minhas Músicas/               oc-3.11.784-linux.tar/
sandersonsa@USU-E0FQ15C8F7S:~$ cd /mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28/
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ pwd
/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ ll
total 256
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 14:55  ./
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 14:55  ../
-rwxrwxrwx 1 sandersonsa sandersonsa   3472 Jun  6 14:52  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   2282 Apr 14  2021  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11212 Apr 14  2021  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   3198 Apr 12  2021  4_rollback.sh*
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 14:55  BACKUP/
-rwxrwxrwx 1 sandersonsa sandersonsa 112891 Apr 12  2021  dc-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 100100 Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa   2587 Jun  6 14:38  historico.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa      8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa   3625 Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  10597 Apr 12  2021  patch-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa    495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa    311 Apr 12  2021  smtp-secret.json*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ oc project
Using project "openshift" on server "https://console.ocp.virtua.com.br:8443".
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ oc project claro-3sacle
error: A project named "claro-3sacle" does not exist on "https://console.ocp.virtua.com.br:8443".
Your projects are:
* admin
* apimock
* app-storage
* claro-3scale
* claro-gitlab
* claro-idp
* claro-inventory
* claro-sso-external
* claro-sso-prod
* claro-sso-waf-prod
* claro-teste
* default
* Development (dev)
* kube-public
* kube-service-catalog
* kube-system
* management-infra
* openshift
* openshift-console
* openshift-infra
* openshift-logging
* openshift-metrics-server
* openshift-migration
* openshift-monitoring
* openshift-node
* openshift-node-problem-detector
* openshift-sdn
* openshift-web-console
* Pre-Production (preprod)
* Production (production)
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ oc project claro-3scale
Now using project "claro-3scale" on server "https://console.ocp.virtua.com.br:8443".
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ ll
total 256
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 14:55  ./
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 14:55  ../
-rwxrwxrwx 1 sandersonsa sandersonsa   3472 Jun  6 14:52  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   2291 Jun  6 14:59  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11212 Apr 14  2021  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   3198 Apr 12  2021  4_rollback.sh*
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 14:55  BACKUP/
-rwxrwxrwx 1 sandersonsa sandersonsa 112891 Apr 12  2021  dc-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 100100 Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa   2587 Jun  6 14:38  historico.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa      8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa   3625 Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  10597 Apr 12  2021  patch-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa    495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa    311 Apr 12  2021  smtp-secret.json*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ ./2_backup.sh
#!/bin/sh -v

BACKUP_FOLDER=prod-backup-2.7-amp

oc project claro-3scale
Already on project "claro-3scale" on server "https://console.ocp.virtua.com.br:8443".

mkdir -p $BACKUP_FOLDER

pushd $BACKUP_FOLDER
./2_backup.sh: 9: pushd: not found
oc get dc system-app -o json | jq .spec.strategy.rollingParams.pre.execNewPod.command > pro-hook-pood.old.txt

THREESCALE_DC_NAMES="apicast-production apicast-staging backend-cron backend-listener backend-redis backend-worker system-app system-memcache system-mysql system-redis system-sidekiq system-sphinx zync zync-database zync-que"
for component in ${THREESCALE_DC_NAMES}; do oc get --export -o yaml dc ${component} > ${component}_dc.yml ; done

THREESCALE_IMAGESTREAM_NAMES="amp-apicast amp-backend amp-system amp-zync zync-database-postgresql system-memcached"
for component in ${THREESCALE_IMAGESTREAM_NAMES}; do oc get --export -o yaml is ${component} > ${component}_is.yml ; done

oc get --export -o yaml secret system-redis --request-timeout=0 > system-redis_secret.yml

for object in `oc get routes | awk '{print $1}' | grep -v NAME`; do oc get -o yaml --export route ${object} > ${object}_route.yaml; done

oc get -o yaml --export all --request-timeout=0 > threescale-project-elements.yaml

for object in rolebindings serviceaccounts secrets imagestreamtags cm rolebindingrestrictions limitranges resourcequotas pvc templates cronjobs statefulsets hpa deployments replicasets poddisruptionbudget endpoints;
do
  oc get -o yaml --export $object > $object.yaml
done

oc rsh $(oc get pods -l 'deploymentConfig=system-mysql' -o json | jq -r '.items[0].metadata.name') bash -c 'export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}; mysqldump --single-transaction -hsystem-mysql -uroot system' | gzip > system-mysql-backup.gz

mkdir -p system-storage

oc rsync $(oc get pods -l 'deploymentConfig=system-app' -o json | jq '.items[0].metadata.name' -r):/opt/system/public/system ./system-storage
receiving incremental file list
system/
system/provider-name/
system/provider-name/2/
system/provider-name/2/profiles/
system/provider-name/2/profiles/logos/
system/provider-name/2/profiles/logos/invoice/
system/provider-name/2/profiles/logos/invoice/claro-logo-8.png
system/provider-name/2/profiles/logos/large/
system/provider-name/2/profiles/logos/large/claro-logo-8.png
system/provider-name/2/profiles/logos/medium/
system/provider-name/2/profiles/logos/medium/claro-logo-8.png
system/provider-name/2/profiles/logos/original/
system/provider-name/2/profiles/logos/original/claro-logo-8.png
system/provider-name/2/profiles/logos/thumb/
system/provider-name/2/profiles/logos/thumb/claro-logo-8.png
system/provider-name/2019/
system/provider-name/2019/12/
system/provider-name/2019/12/03/
system/provider-name/2019/12/03/desk-9ebcf132970bb62b.jpg
system/provider-name/2019/12/03/favicon-842bc4440588ca23.ico
system/provider-name/2019/12/03/mouse-7e79ae33be2e3918.jpg
system/provider-name/2019/12/03/notes-567a3f4a0365bc01.jpg
system/provider-name/2019/12/03/plant-7c99ef7ff2b8a7bd.jpg
system/provider-name/2019/12/03/powered-by-3scale-563848d8b8432350.png
system/provider-name/2019/12/03/powered-by-3scale-dark-0bd991ee8964e19d.png
system/provider-name/2019/12/03/powered-by-3scale-light-f23b3c0202f106f0.png
system/provider-name/2019/12/16/
system/provider-name/2019/12/16/Unknown-7fb3f665dfc232ec.jpg

sent 358 bytes  received 1,029,495 bytes  228,856.22 bytes/sec
total size is 1,027,682  speedup is 1.00
Defaulting container name to system-master.
Use 'oc describe pod/system-app-16-trcpd -n claro-3scale' to see all of the containers in this pod.

oc rsh $(oc get pods -l 'deploymentConfig=zync-database' -o json | jq '.items[0].metadata.name' -r) bash -c 'pg_dumpall -c --if-exists' | gzip > zync-database-backup.gz

oc cp $(oc get pods -l 'deploymentConfig=backend-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./backend-redis-dump.rdb
tar: Removing leading `/' from member names

oc cp $(oc get pods -l 'deploymentConfig=system-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./system-redis-dump.rdb
tar: Removing leading `/' from member names

popd
./2_backup.sh: 41: popd: not found

sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ popd
-bash: popd: directory stack empty
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ popd
-bash: popd: directory stack empty
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/3scale-scripts_upgrade-27-28$ cd ..
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents$ ./scripts-upgrade-3scale-27-28/2_backup.sh
#!/bin/sh -v

BACKUP_FOLDER=prod-backup-2.7-amp

oc project claro-3scale
Already on project "claro-3scale" on server "https://console.ocp.virtua.com.br:8443".

mkdir -p $BACKUP_FOLDER

#!/bin/bash
pushd $BACKUP_FOLDER
./scripts-upgrade-3scale-27-28/2_backup.sh: 10: pushd: not found
oc get dc system-app -o json | jq .spec.strategy.rollingParams.pre.execNewPod.command > pro-hook-pood.old.txt

THREESCALE_DC_NAMES="apicast-production apicast-staging backend-cron backend-listener backend-redis backend-worker system-app system-memcache system-mysql system-redis system-sidekiq system-sphinx zync zync-database zync-que"
for component in ${THREESCALE_DC_NAMES}; do oc get --export -o yaml dc ${component} > ${component}_dc.yml ; done

THREESCALE_IMAGESTREAM_NAMES="amp-apicast amp-backend amp-system amp-zync zync-database-postgresql system-memcached"
for component in ${THREESCALE_IMAGESTREAM_NAMES}; do oc get --export -o yaml is ${component} > ${component}_is.yml ; done

oc get --export -o yaml secret system-redis --request-timeout=0 > system-redis_secret.yml

for object in `oc get routes | awk '{print $1}' | grep -v NAME`; do oc get -o yaml --export route ${object} > ${object}_route.yaml; done

oc get -o yaml --export all --request-timeout=0 > threescale-project-elements.yaml

for object in rolebindings serviceaccounts secrets imagestreamtags cm rolebindingrestrictions limitranges resourcequotas pvc templates cronjobs statefulsets hpa deployments replicasets poddisruptionbudget endpoints;
do
  oc get -o yaml --export $object > $object.yaml
done

oc rsh $(oc get pods -l 'deploymentConfig=system-mysql' -o json | jq -r '.items[0].metadata.name') bash -c 'export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}; mysqldump --single-transaction -hsystem-mysql -uroot system' | gzip > system-mysql-backup.gz

mkdir -p system-storage

oc rsync $(oc get pods -l 'deploymentConfig=system-app' -o json | jq '.items[0].metadata.name' -r):/opt/system/public/system ./system-storage
receiving incremental file list
system/
system/provider-name/
system/provider-name/2/
system/provider-name/2/profiles/
system/provider-name/2/profiles/logos/
system/provider-name/2/profiles/logos/invoice/
system/provider-name/2/profiles/logos/invoice/claro-logo-8.png
system/provider-name/2/profiles/logos/large/
system/provider-name/2/profiles/logos/large/claro-logo-8.png
system/provider-name/2/profiles/logos/medium/
system/provider-name/2/profiles/logos/medium/claro-logo-8.png
system/provider-name/2/profiles/logos/original/
system/provider-name/2/profiles/logos/original/claro-logo-8.png
system/provider-name/2/profiles/logos/thumb/
system/provider-name/2/profiles/logos/thumb/claro-logo-8.png
system/provider-name/2019/
system/provider-name/2019/12/
system/provider-name/2019/12/03/
system/provider-name/2019/12/03/desk-9ebcf132970bb62b.jpg
system/provider-name/2019/12/03/favicon-842bc4440588ca23.ico
system/provider-name/2019/12/03/mouse-7e79ae33be2e3918.jpg
system/provider-name/2019/12/03/notes-567a3f4a0365bc01.jpg
system/provider-name/2019/12/03/plant-7c99ef7ff2b8a7bd.jpg
system/provider-name/2019/12/03/powered-by-3scale-563848d8b8432350.png
system/provider-name/2019/12/03/powered-by-3scale-dark-0bd991ee8964e19d.png
system/provider-name/2019/12/03/powered-by-3scale-light-f23b3c0202f106f0.png
system/provider-name/2019/12/16/
system/provider-name/2019/12/16/Unknown-7fb3f665dfc232ec.jpg

sent 358 bytes  received 1,029,495 bytes  411,941.20 bytes/sec
total size is 1,027,682  speedup is 1.00
Defaulting container name to system-master.
Use 'oc describe pod/system-app-16-trcpd -n claro-3scale' to see all of the containers in this pod.

oc rsh $(oc get pods -l 'deploymentConfig=zync-database' -o json | jq '.items[0].metadata.name' -r) bash -c 'pg_dumpall -c --if-exists' | gzip > zync-database-backup.gz

oc cp $(oc get pods -l 'deploymentConfig=backend-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./backend-redis-dump.rdb
tar: Removing leading `/' from member names

oc cp $(oc get pods -l 'deploymentConfig=system-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./system-redis-dump.rdb
tar: Removing leading `/' from member names

#!/bin/bash
popd
./scripts-upgrade-3scale-27-28/2_backup.sh: 43: popd: not found
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents$ cd tmp/
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/tmp$ sh ../scripts-upgrade-3scale-27-28/2_backup.sh
Already on project "claro-3scale" on server "https://console.ocp.virtua.com.br:8443".
../scripts-upgrade-3scale-27-28/2_backup.sh: 9: pushd: not found
^C
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/tmp$ popd
-bash: popd: directory stack empty
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/tmp$ pushd
-bash: pushd: no other directory
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/tmp$ cd ..
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents$ cd tmp1/
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/tmp1$ ./2_backup.sh
#!/bin/bash -v

BACKUP_FOLDER=prod-backup-2.7-amp

oc project claro-3scale
Already on project "claro-3scale" on server "https://console.ocp.virtua.com.br:8443".

mkdir -p $BACKUP_FOLDER

pushd $BACKUP_FOLDER
/mnt/c/Users/sandersonsa/Documents/tmp1/prod-backup-2.7-amp /mnt/c/Users/sandersonsa/Documents/tmp1
oc get dc system-app -o json | jq .spec.strategy.rollingParams.pre.execNewPod.command > pro-hook-pood.old.txt

THREESCALE_DC_NAMES="apicast-production apicast-staging backend-cron backend-listener backend-redis backend-worker system-app system-memcache system-mysql system-redis system-sidekiq system-sphinx zync zync-database zync-que"
for component in ${THREESCALE_DC_NAMES}; do oc get --export -o yaml dc ${component} > ${component}_dc.yml ; done

THREESCALE_IMAGESTREAM_NAMES="amp-apicast amp-backend amp-system amp-zync zync-database-postgresql system-memcached"
for component in ${THREESCALE_IMAGESTREAM_NAMES}; do oc get --export -o yaml is ${component} > ${component}_is.yml ; done

oc get --export -o yaml secret system-redis --request-timeout=0 > system-redis_secret.yml

for object in `oc get routes | awk '{print $1}' | grep -v NAME`; do oc get -o yaml --export route ${object} > ${object}_route.yaml; done

oc get -o yaml --export all --request-timeout=0 > threescale-project-elements.yaml

for object in rolebindings serviceaccounts secrets imagestreamtags cm rolebindingrestrictions limitranges resourcequotas pvc templates cronjobs statefulsets hpa deployments replicasets poddisruptionbudget endpoints;
do
  oc get -o yaml --export $object > $object.yaml
done

oc rsh $(oc get pods -l 'deploymentConfig=system-mysql' -o json | jq -r '.items[0].metadata.name') bash -c 'export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}; mysqldump --single-transaction -hsystem-mysql -uroot system' | gzip > system-mysql-backup.gz

mkdir -p system-storage

oc rsync $(oc get pods -l 'deploymentConfig=system-app' -o json | jq '.items[0].metadata.name' -r):/opt/system/public/system ./system-storage
receiving incremental file list
system/
system/provider-name/
system/provider-name/2/
system/provider-name/2/profiles/
system/provider-name/2/profiles/logos/
system/provider-name/2/profiles/logos/invoice/
system/provider-name/2/profiles/logos/invoice/claro-logo-8.png
system/provider-name/2/profiles/logos/large/
system/provider-name/2/profiles/logos/large/claro-logo-8.png
system/provider-name/2/profiles/logos/medium/
system/provider-name/2/profiles/logos/medium/claro-logo-8.png
system/provider-name/2/profiles/logos/original/
system/provider-name/2/profiles/logos/original/claro-logo-8.png
system/provider-name/2/profiles/logos/thumb/
system/provider-name/2/profiles/logos/thumb/claro-logo-8.png
system/provider-name/2019/
system/provider-name/2019/12/
system/provider-name/2019/12/03/
system/provider-name/2019/12/03/desk-9ebcf132970bb62b.jpg
system/provider-name/2019/12/03/favicon-842bc4440588ca23.ico
system/provider-name/2019/12/03/mouse-7e79ae33be2e3918.jpg
system/provider-name/2019/12/03/notes-567a3f4a0365bc01.jpg
system/provider-name/2019/12/03/plant-7c99ef7ff2b8a7bd.jpg
system/provider-name/2019/12/03/powered-by-3scale-563848d8b8432350.png
system/provider-name/2019/12/03/powered-by-3scale-dark-0bd991ee8964e19d.png
system/provider-name/2019/12/03/powered-by-3scale-light-f23b3c0202f106f0.png
system/provider-name/2019/12/16/
system/provider-name/2019/12/16/Unknown-7fb3f665dfc232ec.jpg

sent 358 bytes  received 1,029,495 bytes  294,243.71 bytes/sec
total size is 1,027,682  speedup is 1.00
Defaulting container name to system-master.
Use 'oc describe pod/system-app-16-trcpd -n claro-3scale' to see all of the containers in this pod.

oc rsh $(oc get pods -l 'deploymentConfig=zync-database' -o json | jq '.items[0].metadata.name' -r) bash -c 'pg_dumpall -c --if-exists' | gzip > zync-database-backup.gz

oc cp $(oc get pods -l 'deploymentConfig=backend-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./backend-redis-dump.rdb
tar: Removing leading `/' from member names

oc cp $(oc get pods -l 'deploymentConfig=system-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./system-redis-dump.rdb
tar: Removing leading `/' from member names

popd
/mnt/c/Users/sandersonsa/Documents/tmp1
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/tmp1$ cd ..
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents$ ll
total 0
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  6 15:30  ./
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  2 10:01  ../
lrwxrwxrwx 1 sandersonsa sandersonsa  31 Jun  1 09:07 'Meus Vídeos' -> /mnt/c/Users/sandersonsa/Videos/
lrwxrwxrwx 1 sandersonsa sandersonsa  33 Jun  1 09:07 'Minhas Imagens' -> /mnt/c/Users/sandersonsa/Pictures/
lrwxrwxrwx 1 sandersonsa sandersonsa  30 Jun  1 09:07 'Minhas Músicas' -> /mnt/c/Users/sandersonsa/Music/
-rwxrwxrwx 1 sandersonsa sandersonsa 282 Jun  6 09:47  create-backup4.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 402 Jun  1 09:07  desktop.ini*
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  1 12:26  oc/
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  6 09:15  oclinux/
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  6 15:10  scripts-upgrade-3scale-27-28/
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents$ ll
total 0
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  6 15:30  ./
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  2 10:01  ../
lrwxrwxrwx 1 sandersonsa sandersonsa  31 Jun  1 09:07 'Meus Vídeos' -> /mnt/c/Users/sandersonsa/Videos/
lrwxrwxrwx 1 sandersonsa sandersonsa  33 Jun  1 09:07 'Minhas Imagens' -> /mnt/c/Users/sandersonsa/Pictures/
lrwxrwxrwx 1 sandersonsa sandersonsa  30 Jun  1 09:07 'Minhas Músicas' -> /mnt/c/Users/sandersonsa/Music/
-rwxrwxrwx 1 sandersonsa sandersonsa 282 Jun  6 09:47  create-backup4.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 402 Jun  1 09:07  desktop.ini*
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  1 12:26  oc/
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  6 09:15  oclinux/
drwxrwxrwx 1 sandersonsa sandersonsa 512 Jun  6 15:10  scripts-upgrade-3scale-27-28/
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents$ cd scripts-upgrade-3scale-27-28/
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ll
total 252
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 15:10  ./
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 15:30  ../
-rwxrwxrwx 1 sandersonsa sandersonsa   2850 Apr 14  2021  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   2292 Jun  6 15:25  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11212 Apr 14  2021  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   3198 Apr 12  2021  4_rollback.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 112891 Apr 12  2021  dc-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 100100 Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa      8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa   3625 Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  10597 Apr 12  2021  patch-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa    495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa    311 Apr 12  2021  smtp-secret.json*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ./2_backup.sh
#!/bin/bash -v

BACKUP_FOLDER=prod-backup-2.7-amp

oc project claro-3scale
Already on project "claro-3scale" on server "https://console.ocp.virtua.com.br:8443".

mkdir -p $BACKUP_FOLDER

pushd $BACKUP_FOLDER
/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28/prod-backup-2.7-amp /mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28
oc get dc system-app -o json | jq .spec.strategy.rollingParams.pre.execNewPod.command > pro-hook-pood.old.txt

THREESCALE_DC_NAMES="apicast-production apicast-staging backend-cron backend-listener backend-redis backend-worker system-app system-memcache system-mysql system-redis system-sidekiq system-sphinx zync zync-database zync-que"
for component in ${THREESCALE_DC_NAMES}; do oc get --export -o yaml dc ${component} > ${component}_dc.yml ; done

THREESCALE_IMAGESTREAM_NAMES="amp-apicast amp-backend amp-system amp-zync zync-database-postgresql system-memcached"
for component in ${THREESCALE_IMAGESTREAM_NAMES}; do oc get --export -o yaml is ${component} > ${component}_is.yml ; done

oc get --export -o yaml secret system-redis --request-timeout=0 > system-redis_secret.yml

for object in `oc get routes | awk '{print $1}' | grep -v NAME`; do oc get -o yaml --export route ${object} > ${object}_route.yaml; done

oc get -o yaml --export all --request-timeout=0 > threescale-project-elements.yaml

for object in rolebindings serviceaccounts secrets imagestreamtags cm rolebindingrestrictions limitranges resourcequotas pvc templates cronjobs statefulsets hpa deployments replicasets poddisruptionbudget endpoints;
do
  oc get -o yaml --export $object > $object.yaml
done

oc rsh $(oc get pods -l 'deploymentConfig=system-mysql' -o json | jq -r '.items[0].metadata.name') bash -c 'export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}; mysqldump --single-transaction -hsystem-mysql -uroot system' | gzip > system-mysql-backup.gz

mkdir -p system-storage

oc rsync $(oc get pods -l 'deploymentConfig=system-app' -o json | jq '.items[0].metadata.name' -r):/opt/system/public/system ./system-storage
receiving incremental file list
system/
system/provider-name/
system/provider-name/2/
system/provider-name/2/profiles/
system/provider-name/2/profiles/logos/
system/provider-name/2/profiles/logos/invoice/
system/provider-name/2/profiles/logos/invoice/claro-logo-8.png
system/provider-name/2/profiles/logos/large/
system/provider-name/2/profiles/logos/large/claro-logo-8.png
system/provider-name/2/profiles/logos/medium/
system/provider-name/2/profiles/logos/medium/claro-logo-8.png
system/provider-name/2/profiles/logos/original/
system/provider-name/2/profiles/logos/original/claro-logo-8.png
system/provider-name/2/profiles/logos/thumb/
system/provider-name/2/profiles/logos/thumb/claro-logo-8.png
system/provider-name/2019/
system/provider-name/2019/12/
system/provider-name/2019/12/03/
system/provider-name/2019/12/03/desk-9ebcf132970bb62b.jpg
system/provider-name/2019/12/03/favicon-842bc4440588ca23.ico
system/provider-name/2019/12/03/mouse-7e79ae33be2e3918.jpg
system/provider-name/2019/12/03/notes-567a3f4a0365bc01.jpg
system/provider-name/2019/12/03/plant-7c99ef7ff2b8a7bd.jpg
system/provider-name/2019/12/03/powered-by-3scale-563848d8b8432350.png
system/provider-name/2019/12/03/powered-by-3scale-dark-0bd991ee8964e19d.png
system/provider-name/2019/12/03/powered-by-3scale-light-f23b3c0202f106f0.png
system/provider-name/2019/12/16/
system/provider-name/2019/12/16/Unknown-7fb3f665dfc232ec.jpg

sent 358 bytes  received 1,029,495 bytes  187,246.00 bytes/sec
total size is 1,027,682  speedup is 1.00
Defaulting container name to system-master.
Use 'oc describe pod/system-app-16-trcpd -n claro-3scale' to see all of the containers in this pod.

oc rsh $(oc get pods -l 'deploymentConfig=zync-database' -o json | jq '.items[0].metadata.name' -r) bash -c 'pg_dumpall -c --if-exists' | gzip > zync-database-backup.gz

oc cp $(oc get pods -l 'deploymentConfig=backend-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./backend-redis-dump.rdb
tar: Removing leading `/' from member names

oc cp $(oc get pods -l 'deploymentConfig=system-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./system-redis-dump.rdb
tar: Removing leading `/' from member names

popd
/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get dc
NAME                 REVISION   DESIRED   CURRENT   TRIGGERED BY
apicast-production   7          1         1         config,image(amp-apicast:latest)
apicast-staging      5          1         1         config,image(amp-apicast:latest)
backend-cron         1          1         1         config,image(amp-backend:latest)
backend-listener     1          1         1         config,image(amp-backend:latest)
backend-redis        1          1         1         config,image(backend-redis:latest)
backend-worker       1          1         1         config,image(amp-backend:latest)
system-app           16         1         1         config,image(amp-system:latest)
system-memcache      1          1         1         config,image(system-memcached:latest)
system-mysql         1          1         1         config,image(system-mysql:latest)
system-redis         1          1         1         config,image(system-redis:latest)
system-sidekiq       16         1         1         config,image(amp-system:latest)
system-sphinx        2          1         1         config,image(amp-system:latest)
zync                 30         1         1         config
zync-database        1          1         1         config,image(zync-database-postgresql:latest)
zync-que             17         1         1         config
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get pods
NAME                         READY     STATUS    RESTARTS   AGE
apicast-production-7-5q4zf   1/1       Running   0          192d
apicast-staging-5-74z2d      1/1       Running   0          214d
backend-cron-1-zpx7w         1/1       Running   0          214d
backend-listener-1-pgjff     1/1       Running   0          214d
backend-redis-1-f7d4r        1/1       Running   0          214d
backend-worker-1-vhnkm       1/1       Running   0          192d
system-app-16-trcpd          3/3       Running   6          214d
system-memcache-1-6wxk7      1/1       Running   0          214d
system-mysql-1-t2wzm         1/1       Running   0          214d
system-redis-1-hcwpp         1/1       Running   0          214d
system-sidekiq-16-w92tx      1/1       Running   0          214d
system-sphinx-2-m258j        1/1       Running   0          214d
zync-30-6fbfw                1/1       Running   0          214d
zync-database-1-chtz7        1/1       Running   0          214d
zync-que-17-9stzc            1/1       Running   2          214d
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc import-image claro-3scale/system-rhel7:3scale2.8 --from=registry.redhat.io/3scale-amp2/system-rhel7:3scale2.8 --confirm
imagestream.image.openshift.io/system-rhel7 imported

Name:                   system-rhel7
Namespace:              claro-3scale
Created:                Less than a second ago
Labels:                 <none>
Annotations:            openshift.io/image.dockerRepositoryCheck=2023-06-06T19:17:14Z
Docker Pull Spec:       docker-registry.default.svc:5000/claro-3scale/system-rhel7
Image Lookup:           local=false
Unique Images:          1
Tags:                   1

3scale2.8
  tagged from registry.redhat.io/3scale-amp2/system-rhel7:3scale2.8

  * registry.redhat.io/3scale-amp2/system-rhel7@sha256:6588d74168b438bd166cd810c4efe4b7af0c458b5f657db27462956f7fc181e6
      Less than a second ago

Image Name:     system-rhel7:3scale2.8
Docker Image:   registry.redhat.io/3scale-amp2/system-rhel7@sha256:6588d74168b438bd166cd810c4efe4b7af0c458b5f657db27462956f7fc181e6
Name:           sha256:6588d74168b438bd166cd810c4efe4b7af0c458b5f657db27462956f7fc181e6
Created:        Less than a second ago
Annotations:    image.openshift.io/dockerLayersOrder=ascending
Image Size:     673.5MB in 6 layers
Layers:         76.24MB sha256:fc5b206e9329a1674dd9e8efbee45c9be28d0d0dcbabba3c6bb67a2f22cfcf2a
                1.744kB sha256:e7021e0589e97471d99c4265b7c8e64da328e48f116b5f260353b2e0a2adb373
                7.209MB sha256:9e7a6dc796f0a75c560158a9f9e30fb8b5a90cb53edce9ffbdf5778406e4de39
                88.07MB sha256:f659c5c779ac4373302bfe3dc7d713c59cf9ec9f179a71e9b26336a51043fad2
                14.16MB sha256:2cc7982e7aebf188738bbdca92ac97da911a12a3c38ff7e83898468976195aee
                487.8MB sha256:65c4ed99902de275d5cf0b8adc50a4ace778ecd18514b6772096a72e554254d3
Image Created:  2 years ago
Author:         <none>
Arch:           amd64
Entrypoint:     /opt/system/entrypoint.sh
Command:        unicorn -c config/unicorn.rb -E ${RAILS_ENV} config.ru
Working Dir:    /opt/system
User:           1001
Exposes Ports:  3000/tcp, 8080/tcp, 9306/tcp
Docker Labels:  architecture=x86_64
                build-date=2020-07-29T19:12:14.189429
                com.redhat.build-host=cpt-1005.osbs.prod.upshift.rdu2.redhat.com
                com.redhat.component=3scale-amp-system-container
                com.redhat.license_terms=https://www.redhat.com/agreements
                description=3scale is an API Management Platform suitable                    to manage both internal and external API services.                    This image contains the platform main system                    including usage policies, access control, analytics,                    developer portal, and API documentation.
                distribution-scope=public
                io.k8s.description=3scale is an API Management Platform suitable                    to manage both internal and external API services.                    This image contains the platform main system                    including usage policies, access control, analytics,                    developer portal, and API documentation.
                io.k8s.display-name=3scale API manager (system)
                io.openshift.expose-services=3000:system,9306:system
                io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
                io.openshift.tags=integration, api management, 3scale, rhamp, developer portal, api documentation, api analytics
                io.s2i.scripts-url=image:///usr/libexec/s2i
                maintainer=hramihaj@redhat.com
                name=3scale-amp2/system-rhel7
                release=8.1596049803
                summary=3scale API Management platform main system.
                url=https://access.redhat.com/containers/#/registry.access.redhat.com/3scale-amp2/system-rhel7/images/1.12.1-8.1596049803
                usage=s2i build https://github.com/sclorg/s2i-ruby-container.git --context-dir=2.5/test/puma-test-app/ rhscl/ruby-25-rhel7 ruby-sample-app
                vcs-ref=252261f4cb96a18d7389cf2f53d4673382929343
                vcs-type=git
                vendor=Red Hat, Inc.
                version=1.12.1
Environment:    PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
                container=oci
                SUMMARY=Platform for building and running Ruby 2.5 applications
                DESCRIPTION=Ruby 2.5 available as container is a base platform for building and running various Ruby 2.5 applications and frameworks. Ruby is the interpreted scripting language for quick and easy object-oriented programming. It has many features to process text files and to do system management tasks (as in Perl). It is simple, straight-forward, and extensible.
                STI_SCRIPTS_URL=image:///usr/libexec/s2i
                STI_SCRIPTS_PATH=/usr/libexec/s2i
                APP_ROOT=/opt/app-root
                HOME=/opt/app-root/src
                PLATFORM=el7
                BASH_ENV=/opt/app-root/etc/scl_enable
                ENV=/opt/app-root/etc/scl_enable
                PROMPT_COMMAND=. /opt/app-root/etc/scl_enable
                NODEJS_SCL=rh-nodejs10
                RUBY_MAJOR_VERSION=2
                RUBY_MINOR_VERSION=5
                RUBY_VERSION=2.5
                RUBY_SCL_NAME_VERSION=25
                RUBY_SCL=rh-ruby25
                IMAGE_NAME=rhscl/ruby-25-rhel7
                RAILS_ENV=production
                SAFETY_ASSURED=1
                BUNDLE_WITHOUT=development:test
                TZ=:/etc/localtime
                BUNDLE_GEMFILE=Gemfile
                GEMS_REPO=https://origin-repository.jboss.org/nexus/content/groups/rubygems_store/
                NPM_REPO=https://repository.engineering.redhat.com/nexus/repository/registry.npmjs.org/
                npm_config_tarball=/tmp/node-v10.10.0-headers.tar.gz


sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc import-image claro-3scale/apicast-gateway-rhel8:3scale2.8 --from=registry.redhat.io/3scale-amp2/apicast-gateway-rhel8:3scale2.8 --confirm
imagestream.image.openshift.io/apicast-gateway-rhel8 imported

Name:                   apicast-gateway-rhel8
Namespace:              claro-3scale
Created:                1 second ago
Labels:                 <none>
Annotations:            openshift.io/image.dockerRepositoryCheck=2023-06-06T19:17:38Z
Docker Pull Spec:       docker-registry.default.svc:5000/claro-3scale/apicast-gateway-rhel8
Image Lookup:           local=false
Unique Images:          1
Tags:                   1

3scale2.8
  tagged from registry.redhat.io/3scale-amp2/apicast-gateway-rhel8:3scale2.8

  * registry.redhat.io/3scale-amp2/apicast-gateway-rhel8@sha256:62da69403ad677f8b5ca34c2b07ed15574261d406b851d86624ba9231b7a545f
      1 second ago

Image Name:     apicast-gateway-rhel8:3scale2.8
Docker Image:   registry.redhat.io/3scale-amp2/apicast-gateway-rhel8@sha256:62da69403ad677f8b5ca34c2b07ed15574261d406b851d86624ba9231b7a545f
Name:           sha256:62da69403ad677f8b5ca34c2b07ed15574261d406b851d86624ba9231b7a545f
Created:        1 second ago
Annotations:    image.openshift.io/dockerLayersOrder=ascending
Image Size:     106MB in 3 layers
Layers:         74.01MB sha256:c6e335841c280c4b18a64686237c37b14983402b5b70e967bdfddf297b285c1d
                1.717kB sha256:8498543ec059238ef10205c0e8e6ef1a09b6963d9db285c5a5733dd56fba9774
                31.95MB sha256:30ebc04e5d04652745a9e4a2e06a5ec8fae77d44e6e6169bfc5eec9c5f6479f6
Image Created:  2 years ago
Author:         <none>
Arch:           amd64
Entrypoint:     container-entrypoint
Command:        scripts/run
Working Dir:    /opt/app-root
User:           1001
Exposes Ports:  8080/tcp
Docker Labels:  architecture=x86_64
                build-date=2020-07-21T12:00:25.650018
                com.redhat.build-host=cpt-1004.osbs.prod.upshift.rdu2.redhat.com
                com.redhat.component=3scale-amp-apicast-gateway-container
                com.redhat.license_terms=https://www.redhat.com/agreements
                description=APIcast is not a standalone API gateway therefore it needs connection to the 3scale API management platform. The container includes OpenResty and uses LuaRocks to install dependencies (rocks are installed in the application folder).
                distribution-scope=public
                io.k8s.description=APIcast is not a standalone API gateway therefore it needs connection to the 3scale API management platform. The container includes OpenResty and uses LuaRocks to install dependencies (rocks are installed in the application folder).
                io.k8s.display-name=3scale API gateway (APIcast)
                io.openshift.expose-services=8080:apicast
                io.openshift.tags=integration, nginx, lua, openresty, api, gateway, 3scale, rhamp
                maintainer=3scale-engineering@redhat.com
                name=3scale-amp2/apicast-gateway-rhel8
                release=3.1595331932
                summary=3scale's API gateway (APIcast) is an OpenResty application which consists of two parts: Nginx configuration and Lua files.
                url=https://access.redhat.com/containers/#/registry.access.redhat.com/3scale-amp2/apicast-gateway-rhel8/images/1.17.1-3.1595331932
                vcs-ref=c992347ac3b8fdd0cc52bba51ce9543e75b5f90a
                vcs-type=git
                vendor=Red Hat, Inc.
                version=1.17.1
Environment:    PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
                container=oci
                AUTO_UPDATE_INTERVAL=0
                HOME=/opt/app-root/src
                LD_LIBRARY_PATH=:/opt/app-root/lib
                LUA_CPATH=./?.so;/usr/lib64/lua/5.1/?.so;/usr/lib64/lua/5.1/loadall.so;/usr/local/lib64/lua/5.1/?.so


sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ll
total 252
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 15:31  ./
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 15:30  ../
-rwxrwxrwx 1 sandersonsa sandersonsa   2850 Apr 14  2021  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   2292 Jun  6 15:25  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11233 Jun  6 15:33  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   3198 Apr 12  2021  4_rollback.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 112891 Apr 12  2021  dc-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 100100 Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa      8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa   3625 Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  10597 Apr 12  2021  patch-system-app.json*
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 15:33  prod-backup-2.7-amp/
-rwxrwxrwx 1 sandersonsa sandersonsa    495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa    311 Apr 12  2021  smtp-secret.json*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc import-image claro-3scale/backend-rhel7:3scale2.8 --from=registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.8 --confirm
imagestream.image.openshift.io/backend-rhel7 imported

Name:                   backend-rhel7
Namespace:              claro-3scale
Created:                Less than a second ago
Labels:                 <none>
Annotations:            openshift.io/image.dockerRepositoryCheck=2023-06-06T19:19:49Z
Docker Pull Spec:       docker-registry.default.svc:5000/claro-3scale/backend-rhel7
Image Lookup:           local=false
Unique Images:          1
Tags:                   1

3scale2.8
  tagged from registry.redhat.io/3scale-amp2/backend-rhel7:3scale2.8

  * registry.redhat.io/3scale-amp2/backend-rhel7@sha256:d984c0cabe300e49e0933f981acb650e10073687e07af92036ab5fd4b301ea00
      Less than a second ago

Image Name:     backend-rhel7:3scale2.8
Docker Image:   registry.redhat.io/3scale-amp2/backend-rhel7@sha256:d984c0cabe300e49e0933f981acb650e10073687e07af92036ab5fd4b301ea00
Name:           sha256:d984c0cabe300e49e0933f981acb650e10073687e07af92036ab5fd4b301ea00
Created:        Less than a second ago
Annotations:    image.openshift.io/dockerLayersOrder=ascending
Image Size:     225.8MB in 6 layers
Layers:         76.24MB sha256:fc5b206e9329a1674dd9e8efbee45c9be28d0d0dcbabba3c6bb67a2f22cfcf2a
                1.744kB sha256:e7021e0589e97471d99c4265b7c8e64da328e48f116b5f260353b2e0a2adb373
                7.209MB sha256:9e7a6dc796f0a75c560158a9f9e30fb8b5a90cb53edce9ffbdf5778406e4de39
                88.07MB sha256:f659c5c779ac4373302bfe3dc7d713c59cf9ec9f179a71e9b26336a51043fad2
                14.16MB sha256:2cc7982e7aebf188738bbdca92ac97da911a12a3c38ff7e83898468976195aee
                40.09MB sha256:22315bd67864f63fdef41e254e334fd1a91d4690e0350c0b165800526edc3d58
Image Created:  2 years ago
Author:         <none>
Arch:           amd64
Entrypoint:     /bin/bash -- /opt/app/entrypoint.sh
Working Dir:    /opt/app
User:           1001
Exposes Ports:  3000/tcp, 8080/tcp
Docker Labels:  architecture=x86_64
                build-date=2020-07-29T19:13:44.143847
                com.redhat.build-host=cpt-1002.osbs.prod.upshift.rdu2.redhat.com
                com.redhat.component=3scale-amp-backend-container
                com.redhat.license_terms=https://www.redhat.com/agreements
                description=3scale is an API Management Platform suitable to manage both internal and external API services. This image contains the platform's backend, which takes care of applying rate limits, authorization, and reporting of HTTP(s) requests.
                distribution-scope=public
                io.k8s.description=3scale is an API Management Platform suitable to manage both internal and external API services. This image contains the platform's backend, which takes care of applying rate limits, authorization, and reporting of HTTP(s) requests.
                io.k8s.display-name=3scale API manager (backend)
                io.openshift.expose-services=3000:backend
                io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
                io.openshift.tags=api, backend, 3scale, 3scale-amp
                io.s2i.scripts-url=image:///usr/libexec/s2i
                maintainer=eastiz@redhat.com
                name=3scale-amp2/backend-rhel7
                release=31.1596049807
                summary=3scale API Management platform backend.
                url=https://access.redhat.com/containers/#/registry.access.redhat.com/3scale-amp2/backend-rhel7/images/1.11.0-31.1596049807
                usage=s2i build https://github.com/sclorg/s2i-ruby-container.git --context-dir=2.5/test/puma-test-app/ rhscl/ruby-25-rhel7 ruby-sample-app
                vcs-ref=6f777aa99a8b3e50cb392011da93926bf887ccd4
                vcs-type=git
                vendor=Red Hat, Inc.
                version=1.11.0
Environment:    PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
                container=oci
                SUMMARY=Platform for building and running Ruby 2.5 applications
                DESCRIPTION=Ruby 2.5 available as container is a base platform for building and running various Ruby 2.5 applications and frameworks. Ruby is the interpreted scripting language for quick and easy object-oriented programming. It has many features to process text files and to do system management tasks (as in Perl). It is simple, straight-forward, and extensible.
                STI_SCRIPTS_URL=image:///usr/libexec/s2i
                STI_SCRIPTS_PATH=/usr/libexec/s2i
                APP_ROOT=/opt/app-root
                HOME=/tmp/
                PLATFORM=el7
                BASH_ENV=/opt/app-root/etc/scl_enable
                ENV=/opt/app-root/etc/scl_enable
                PROMPT_COMMAND=. /opt/app-root/etc/scl_enable
                NODEJS_SCL=rh-nodejs10
                RUBY_MAJOR_VERSION=2
                RUBY_MINOR_VERSION=5
                RUBY_VERSION=2.5
                RUBY_SCL_NAME_VERSION=25
                RUBY_SCL=rh-ruby25
                IMAGE_NAME=rhscl/ruby-25-rhel7
                TZ=:/etc/localtime
                ENV_SETUP=/opt/app-root/etc/scl_enable
                RACK_ENV=production
                CONFIG_SAAS=false
                CONFIG_LOG_PATH=/tmp/
                CONFIG_NOTIFICATION_BATCH=1
                CONFIG_WORKERS_LOG_FILE=/dev/stdout
                PUMA_WORKERS=1


sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc import-image claro-3scale/zync-rhel7:3scale2.8 --from=registry.redhat.io/3scale-amp2/zync-rhel7:3scale2.8 --confirm
imagestream.image.openshift.io/zync-rhel7 imported

Name:                   zync-rhel7
Namespace:              claro-3scale
Created:                Less than a second ago
Labels:                 <none>
Annotations:            openshift.io/image.dockerRepositoryCheck=2023-06-06T19:20:13Z
Docker Pull Spec:       docker-registry.default.svc:5000/claro-3scale/zync-rhel7
Image Lookup:           local=false
Unique Images:          1
Tags:                   1

3scale2.8
  tagged from registry.redhat.io/3scale-amp2/zync-rhel7:3scale2.8

  * registry.redhat.io/3scale-amp2/zync-rhel7@sha256:3fe2a111b7166edaf67d670004b6e6d5e7a6a100bef2959cc9b99eb82f3b2e23
      Less than a second ago

Image Name:     zync-rhel7:3scale2.8
Docker Image:   registry.redhat.io/3scale-amp2/zync-rhel7@sha256:3fe2a111b7166edaf67d670004b6e6d5e7a6a100bef2959cc9b99eb82f3b2e23
Name:           sha256:3fe2a111b7166edaf67d670004b6e6d5e7a6a100bef2959cc9b99eb82f3b2e23
Created:        Less than a second ago
Annotations:    image.openshift.io/dockerLayersOrder=ascending
Image Size:     223.2MB in 6 layers
Layers:         76.24MB sha256:fc5b206e9329a1674dd9e8efbee45c9be28d0d0dcbabba3c6bb67a2f22cfcf2a
                1.744kB sha256:e7021e0589e97471d99c4265b7c8e64da328e48f116b5f260353b2e0a2adb373
                7.209MB sha256:9e7a6dc796f0a75c560158a9f9e30fb8b5a90cb53edce9ffbdf5778406e4de39
                88.07MB sha256:f659c5c779ac4373302bfe3dc7d713c59cf9ec9f179a71e9b26336a51043fad2
                14.16MB sha256:2cc7982e7aebf188738bbdca92ac97da911a12a3c38ff7e83898468976195aee
                37.54MB sha256:5648311c0bfd73b6d9330b61a0852462d788863c443745b0a3632a9dd568a6c9
Image Created:  2 years ago
Author:         <none>
Arch:           amd64
Entrypoint:     /opt/zync/entrypoint.sh
Command:        bin/rails server --binding 0.0.0.0 --port 8080
Working Dir:    /opt/zync
User:           1001
Exposes Ports:  8080/tcp
Docker Labels:  architecture=x86_64
                build-date=2020-07-29T19:11:09.564844
                com.redhat.build-host=cpt-1006.osbs.prod.upshift.rdu2.redhat.com
                com.redhat.component=3scale-amp-zync-container
                com.redhat.license_terms=https://www.redhat.com/agreements
                description=Zync is going to take your 3scale data                    and push it somewhere else, reliably.                    Offers only one directional sync (from 3scale to other systems).
                distribution-scope=public
                io.k8s.description=Zync is going to take your 3scale data                    and push it somewhere else, reliably.                    Offers only one directional sync (from 3scale to other systems).
                io.k8s.display-name=Zync
                io.openshift.expose-services=8080:zync
                io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
                io.openshift.tags=sync, api management, 3scale, rhamp
                io.s2i.scripts-url=image:///usr/libexec/s2i
                maintainer=mcichra@redhat.com
                name=3scale-amp2/zync-rhel7
                release=32.1596049798
                summary=Zync - the sync tool
                url=https://access.redhat.com/containers/#/registry.access.redhat.com/3scale-amp2/zync-rhel7/images/1.11.0-32.1596049798
                usage=s2i build https://github.com/sclorg/s2i-ruby-container.git --context-dir=2.5/test/puma-test-app/ rhscl/ruby-25-rhel7 ruby-sample-app
                vcs-ref=138eb41882f259d977340db9a219104e85d6ab95
                vcs-type=git
                vendor=Red Hat, Inc.
                version=1.11.0
Environment:    PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
                container=oci
                SUMMARY=Platform for building and running Ruby 2.5 applications
                DESCRIPTION=Ruby 2.5 available as container is a base platform for building and running various Ruby 2.5 applications and frameworks. Ruby is the interpreted scripting language for quick and easy object-oriented programming. It has many features to process text files and to do system management tasks (as in Perl). It is simple, straight-forward, and extensible.
                STI_SCRIPTS_URL=image:///usr/libexec/s2i
                STI_SCRIPTS_PATH=/usr/libexec/s2i
                APP_ROOT=/opt/app-root
                HOME=/opt/app-root/src
                PLATFORM=el7
                BASH_ENV=/opt/app-root/etc/scl_enable
                ENV=/opt/app-root/etc/scl_enable
                PROMPT_COMMAND=. /opt/app-root/etc/scl_enable
                NODEJS_SCL=rh-nodejs10
                RUBY_MAJOR_VERSION=2
                RUBY_MINOR_VERSION=5
                RUBY_VERSION=2.5
                RUBY_SCL_NAME_VERSION=25
                RUBY_SCL=rh-ruby25
                IMAGE_NAME=rhscl/ruby-25-rhel7
                RAILS_ENV=production
                RAILS_LOG_TO_STDOUT=1
                BUNDLE_WITHOUT=development:test
                TZ=:/etc/localtime
                BUNDLE_GEMFILE=Gemfile
                DISABLE_SPRING=1
                GEMS_REPO=https://origin-repository.jboss.org/nexus/content/groups/rubygems_store/


sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc import-image claro-3scale/memcached-rhel7:3scale2.8 --from=registry.redhat.io/3scale-amp2/memcached-rhel7:3scale2.8 --confirm
imagestream.image.openshift.io/memcached-rhel7 imported

Name:                   memcached-rhel7
Namespace:              claro-3scale
Created:                Less than a second ago
Labels:                 <none>
Annotations:            openshift.io/image.dockerRepositoryCheck=2023-06-06T19:20:25Z
Docker Pull Spec:       docker-registry.default.svc:5000/claro-3scale/memcached-rhel7
Image Lookup:           local=false
Unique Images:          1
Tags:                   1

3scale2.8
  tagged from registry.redhat.io/3scale-amp2/memcached-rhel7:3scale2.8

  * registry.redhat.io/3scale-amp2/memcached-rhel7@sha256:f8981dbf86761bed31d03c359f6c4552b49cf4d1f5a199cbd8b44c02b50d5bc6
      Less than a second ago

Image Name:     memcached-rhel7:3scale2.8
Docker Image:   registry.redhat.io/3scale-amp2/memcached-rhel7@sha256:f8981dbf86761bed31d03c359f6c4552b49cf4d1f5a199cbd8b44c02b50d5bc6
Name:           sha256:f8981dbf86761bed31d03c359f6c4552b49cf4d1f5a199cbd8b44c02b50d5bc6
Created:        Less than a second ago
Annotations:    image.openshift.io/dockerLayersOrder=ascending
Image Size:     91.49MB in 3 layers
Layers:         76.24MB sha256:fc5b206e9329a1674dd9e8efbee45c9be28d0d0dcbabba3c6bb67a2f22cfcf2a
                1.744kB sha256:e7021e0589e97471d99c4265b7c8e64da328e48f116b5f260353b2e0a2adb373
                15.25MB sha256:fd82d238b8be568afa8578e07a4d1db8e9a2a191bf7be1e470b2c0905c581c39
Image Created:  2 years ago
Author:         <none>
Arch:           amd64
Entrypoint:     memcached
Command:        -m 64 -vv
Working Dir:    <none>
User:           1001
Exposes Ports:  11211/tcp
Docker Labels:  architecture=x86_64
                build-date=2020-07-13T15:37:12.719478
                com.redhat.build-host=cpt-1008.osbs.prod.upshift.rdu2.redhat.com
                com.redhat.component=3scale-amp-memcached-container
                com.redhat.license_terms=https://www.redhat.com/agreements
                description=3scale container image used for caching.
                distribution-scope=public
                io.k8s.description=3scale container image used for caching.
                io.k8s.display-name=3scale API manager (memcached)
                io.openshift.expose-services=11211:memcached
                io.openshift.tags=caching, 3scale
                maintainer=hramihaj@redhat.com
                name=3scale-amp2/memcached-rhel7
                release=24.1594642185
                summary=3scale container image used for caching.
                url=https://access.redhat.com/containers/#/registry.access.redhat.com/3scale-amp2/memcached-rhel7/images/1.4.16-24.1594642185
                vcs-ref=5eb130b13a31b9d75101115573efe644113afb1a
                vcs-type=git
                vendor=Red Hat, Inc.
                version=1.4.16
Environment:    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
                container=oci


sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ls
 1_pre-reqs.sh   3_migration.sh   dc-system-app.json   master-access-token.txt   patch-system-app.json      'secret creation.txt'
 2_backup.sh     4_rollback.sh    dc.json              patch-sidekiq.json        prod-backup-2.7-amp-teste   smtp-secret.json
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc login https://console.ocp.virtua.com.br:8443 --token=QaQuee9LLYCAvBdV7wn0pG42QTFFfMoZyuWNwR7-A3c
Logged into "https://console.ocp.virtua.com.br:8443" as "redhat.sandersonsa" using the token provided.

You have access to the following projects and can switch between them with 'oc project <projectname>':

    admin
    apimock
    app-storage
  * claro-3scale
    claro-gitlab
    claro-idp
    claro-inventory
    claro-sso-external
    claro-sso-prod
    claro-sso-waf-prod
    claro-teste
    default
    dev
    kube-public
    kube-service-catalog
    kube-system
    management-infra
    openshift
    openshift-console
    openshift-infra
    openshift-logging
    openshift-metrics-server
    openshift-migration
    openshift-monitoring
    openshift-node
    openshift-node-problem-detector
    openshift-sdn
    openshift-web-console
    preprod
    production

Using project "claro-3scale".
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc project
Using project "claro-3scale" on server "https://console.ocp.virtua.com.br:8443".
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ls
 1_pre-reqs.sh   3_migration.sh   dc-system-app.json   master-access-token.txt   patch-system-app.json      'secret creation.txt'
 2_backup.sh     4_rollback.sh    dc.json              patch-sidekiq.json        prod-backup-2.7-amp-teste   smtp-secret.json
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ll
total 252
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 19:00  ./
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 15:30  ../
-rwxrwxrwx 1 sandersonsa sandersonsa   2852 Jun  6 19:00  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   2292 Jun  6 15:25  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11223 Jun  6 19:03  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   3198 Apr 12  2021  4_rollback.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 112891 Apr 12  2021  dc-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 100100 Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa      8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa   3625 Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  10597 Apr 12  2021  patch-system-app.json*
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 15:33  prod-backup-2.7-amp-teste/
-rwxrwxrwx 1 sandersonsa sandersonsa    495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa    311 Apr 12  2021  smtp-secret.json*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get pods
NAME                         READY     STATUS    RESTARTS   AGE
apicast-production-7-5q4zf   1/1       Running   0          193d
apicast-staging-5-74z2d      1/1       Running   0          214d
backend-cron-1-zpx7w         1/1       Running   0          214d
backend-listener-1-pgjff     1/1       Running   0          214d
backend-redis-1-f7d4r        1/1       Running   0          214d
backend-worker-1-vhnkm       1/1       Running   0          193d
system-app-16-trcpd          3/3       Running   6          214d
system-memcache-1-6wxk7      1/1       Running   0          214d
system-mysql-1-t2wzm         1/1       Running   0          214d
system-redis-1-hcwpp         1/1       Running   0          214d
system-sidekiq-16-w92tx      1/1       Running   0          214d
system-sphinx-2-m258j        1/1       Running   0          214d
zync-30-6fbfw                1/1       Running   0          214d
zync-database-1-chtz7        1/1       Running   0          214d
zync-que-17-9stzc            1/1       Running   2          214d
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc exec zync-que-17-9stzc cat /etc/pki/tls/cert.pem > zync.pem
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ls
 1_pre-reqs.sh   3_migration.sh   dc.json                   patch-sidekiq.json     'secret creation.txt'   zync.pem
 2_backup.sh     4_rollback.sh    master-access-token.txt   patch-system-app.json   smtp-secret.json
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ll
total 360
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 23:08  ./
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 23:04  ../
-rwxrwxrwx 1 sandersonsa sandersonsa   2852 Jun  6 19:00  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   2292 Jun  6 15:25  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11223 Jun  6 19:03  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   3198 Apr 12  2021  4_rollback.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 100100 Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa      8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa   3625 Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  10597 Apr 12  2021  patch-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa    495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa    311 Apr 12  2021  smtp-secret.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 222148 Jun  6 23:08  zync.pem*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ll -lh
total 360K
drwxrwxrwx 1 sandersonsa sandersonsa  512 Jun  6 23:08  ./
drwxrwxrwx 1 sandersonsa sandersonsa  512 Jun  6 23:04  ../
-rwxrwxrwx 1 sandersonsa sandersonsa 2.8K Jun  6 19:00  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 2.3K Jun  6 15:25  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11K Jun  6 19:03  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 3.2K Apr 12  2021  4_rollback.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  98K Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa    8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa 3.6K Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  11K Apr 12  2021  patch-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa  311 Apr 12  2021  smtp-secret.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 217K Jun  6 23:08  zync.pem*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ll
total 360
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 23:08  ./
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 23:04  ../
-rwxrwxrwx 1 sandersonsa sandersonsa   2852 Jun  6 19:00  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   2292 Jun  6 15:25  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11223 Jun  6 19:03  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   3198 Apr 12  2021  4_rollback.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 100100 Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa      8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa   3625 Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  10597 Apr 12  2021  patch-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa    495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa    311 Apr 12  2021  smtp-secret.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 222148 Jun  6 23:08  zync.pem*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ./2_backup.sh
#!/bin/bash -v

BACKUP_FOLDER=prod-backup-2.7-amp

oc project claro-3scale
Already on project "claro-3scale" on server "https://console.ocp.virtua.com.br:8443".

mkdir -p $BACKUP_FOLDER

pushd $BACKUP_FOLDER
/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28/prod-backup-2.7-amp /mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28
oc get dc system-app -o json | jq .spec.strategy.rollingParams.pre.execNewPod.command > pro-hook-pood.old.txt

THREESCALE_DC_NAMES="apicast-production apicast-staging backend-cron backend-listener backend-redis backend-worker system-app system-memcache system-mysql system-redis system-sidekiq system-sphinx zync zync-database zync-que"
for component in ${THREESCALE_DC_NAMES}; do oc get --export -o yaml dc ${component} > ${component}_dc.yml ; done

THREESCALE_IMAGESTREAM_NAMES="amp-apicast amp-backend amp-system amp-zync zync-database-postgresql system-memcached"
for component in ${THREESCALE_IMAGESTREAM_NAMES}; do oc get --export -o yaml is ${component} > ${component}_is.yml ; done

oc get --export -o yaml secret system-redis --request-timeout=0 > system-redis_secret.yml

for object in `oc get routes | awk '{print $1}' | grep -v NAME`; do oc get -o yaml --export route ${object} > ${object}_route.yaml; done

oc get -o yaml --export all --request-timeout=0 > threescale-project-elements.yaml

for object in rolebindings serviceaccounts secrets imagestreamtags cm rolebindingrestrictions limitranges resourcequotas pvc templates cronjobs statefulsets hpa deployments replicasets poddisruptionbudget endpoints;
do
  oc get -o yaml --export $object > $object.yaml
done

oc rsh $(oc get pods -l 'deploymentConfig=system-mysql' -o json | jq -r '.items[0].metadata.name') bash -c 'export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}; mysqldump --single-transaction -hsystem-mysql -uroot system' | gzip > system-mysql-backup.gz

mkdir -p system-storage

oc rsync $(oc get pods -l 'deploymentConfig=system-app' -o json | jq '.items[0].metadata.name' -r):/opt/system/public/system ./system-storage
receiving incremental file list
system/
system/provider-name/
system/provider-name/2/
system/provider-name/2/profiles/
system/provider-name/2/profiles/logos/
system/provider-name/2/profiles/logos/invoice/
system/provider-name/2/profiles/logos/invoice/claro-logo-8.png
system/provider-name/2/profiles/logos/large/
system/provider-name/2/profiles/logos/large/claro-logo-8.png
system/provider-name/2/profiles/logos/medium/
system/provider-name/2/profiles/logos/medium/claro-logo-8.png
system/provider-name/2/profiles/logos/original/
system/provider-name/2/profiles/logos/original/claro-logo-8.png
system/provider-name/2/profiles/logos/thumb/
system/provider-name/2/profiles/logos/thumb/claro-logo-8.png
system/provider-name/2019/
system/provider-name/2019/12/
system/provider-name/2019/12/03/
system/provider-name/2019/12/03/desk-9ebcf132970bb62b.jpg
system/provider-name/2019/12/03/favicon-842bc4440588ca23.ico
system/provider-name/2019/12/03/mouse-7e79ae33be2e3918.jpg
system/provider-name/2019/12/03/notes-567a3f4a0365bc01.jpg
system/provider-name/2019/12/03/plant-7c99ef7ff2b8a7bd.jpg
system/provider-name/2019/12/03/powered-by-3scale-563848d8b8432350.png
system/provider-name/2019/12/03/powered-by-3scale-dark-0bd991ee8964e19d.png
system/provider-name/2019/12/03/powered-by-3scale-light-f23b3c0202f106f0.png
system/provider-name/2019/12/16/
system/provider-name/2019/12/16/Unknown-7fb3f665dfc232ec.jpg

sent 358 bytes  received 1,029,495 bytes  228,856.22 bytes/sec
total size is 1,027,682  speedup is 1.00
Defaulting container name to system-master.
Use 'oc describe pod/system-app-16-trcpd -n claro-3scale' to see all of the containers in this pod.

oc rsh $(oc get pods -l 'deploymentConfig=zync-database' -o json | jq '.items[0].metadata.name' -r) bash -c 'pg_dumpall -c --if-exists' | gzip > zync-database-backup.gz

oc cp $(oc get pods -l 'deploymentConfig=backend-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./backend-redis-dump.rdb
tar: Removing leading `/' from member names

oc cp $(oc get pods -l 'deploymentConfig=system-redis' -o json | jq '.items[0].metadata.name' -r):/var/lib/redis/data/dump.rdb ./system-redis-dump.rdb
tar: Removing leading `/' from member names

popd
/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ll
total 360
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 23:16  ./
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 23:04  ../
-rwxrwxrwx 1 sandersonsa sandersonsa   2852 Jun  6 19:00  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   2292 Jun  6 15:25  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11223 Jun  6 19:03  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa   3198 Apr 12  2021  4_rollback.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 100100 Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa      8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa   3625 Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  10597 Apr 12  2021  patch-system-app.json*
drwxrwxrwx 1 sandersonsa sandersonsa    512 Jun  6 23:18  prod-backup-2.7-amp/
-rwxrwxrwx 1 sandersonsa sandersonsa    495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa    311 Apr 12  2021  smtp-secret.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 222148 Jun  6 23:08  zync.pem*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ./3_migration.sh
DEPLOYED_APP_LABEL is not empty
3scale-api-management
Confirm that the system-smtp secret has been created
apiVersion: v1
data:
  address: c210cC52aXJ0dWEuY29tLmJy
  authentication: ""
  domain: ""
  openssl.verify.mode: bm9uZQ==
  password: ""
  port: MjU=
  username: ""
kind: Secret
metadata:
  creationTimestamp: "2023-06-06T13:02:39Z"
  labels:
    app: 3scale-api-management
    threescale_component: system
    threescale_component_element: smtp
  name: system-smtp
  namespace: claro-3scale
  resourceVersion: "416338838"
  selfLink: /api/v1/namespaces/claro-3scale/secrets/system-smtp
  uid: 6a4ab962-046a-11ee-9d03-000c29c5d379
type: Opaque
Verifying all data smtp from system-smtp secret
��eUpdating pre-hook with new command
----------
deploymentconfig.apps.openshift.io/system-app patched
replication controller "system-app-16" successfully rolled out
Verifying new pre-hook command below
----------
[
  "bash",
  "-c",
  "bundle exec rake boot openshift:deploy"
]
Patching pre-hook with new command
----------
Warning: oc apply should be used on resource created by either oc create --save-config or oc apply
deploymentconfig.apps.openshift.io/system-app configured
Verifying length Master Access Token - expected 1)
----------
1
Verifying Master Access Token
----------
[
  {
    "name": "MASTER_ACCESS_TOKEN",
    "valueFrom": {
      "secretKeyRef": {
        "key": "MASTER_ACCESS_TOKEN",
        "name": "system-seed"
      }
    }
  }
]
Verifying SMTP Variables
----------
[
  {
    "name": "SMTP_ADDRESS",
    "valueFrom": {
      "secretKeyRef": {
        "key": "address",
        "name": "system-smtp"
      }
    }
  },
  {
    "name": "SMTP_USER_NAME",
    "valueFrom": {
      "secretKeyRef": {
        "key": "username",
        "name": "system-smtp"
      }
    }
  },
  {
    "name": "SMTP_PASSWORD",
    "valueFrom": {
      "secretKeyRef": {
        "key": "password",
        "name": "system-smtp"
      }
    }
  },
  {
    "name": "SMTP_DOMAIN",
    "valueFrom": {
      "secretKeyRef": {
        "key": "domain",
        "name": "system-smtp"
      }
    }
  },
  {
    "name": "SMTP_PORT",
    "valueFrom": {
      "secretKeyRef": {
        "key": "port",
        "name": "system-smtp"
      }
    }
  },
  {
    "name": "SMTP_AUTHENTICATION",
    "valueFrom": {
      "secretKeyRef": {
        "key": "authentication",
        "name": "system-smtp"
      }
    }
  },
  {
    "name": "SMTP_OPENSSL_VERIFY_MODE",
    "valueFrom": {
      "secretKeyRef": {
        "key": "openssl.verify.mode",
        "name": "system-smtp"
      }
    }
  }
]
./3_migration.sh: line 51: W: command not found
replication controller "system-app-16" successfully rolled out
Patching the environment of the system-app
----------
Error from server (BadRequest): unexpected EOF
Error from server (NotFound): deploymentconfigs.apps.openshift.io "type=json" not found
replication controller "system-app-16" successfully rolled out
Checking updates on containers
----------
system-developer
[
  {
    "name": "SMTP_ADDRESS",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "address",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_USER_NAME",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "username",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PASSWORD",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "password",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_DOMAIN",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "domain",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PORT",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "port",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_AUTHENTICATION",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "authentication",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_OPENSSL_VERIFY_MODE",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "openssl.verify.mode",
        "name": "smtp"
      }
    }
  }
]
----------
system-provider
[
  {
    "name": "SMTP_ADDRESS",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "address",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_USER_NAME",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "username",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PASSWORD",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "password",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_DOMAIN",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "domain",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PORT",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "port",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_AUTHENTICATION",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "authentication",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_OPENSSL_VERIFY_MODE",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "openssl.verify.mode",
        "name": "smtp"
      }
    }
  }
]
----------
system-master
[
  {
    "name": "SMTP_ADDRESS",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "address",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_USER_NAME",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "username",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PASSWORD",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "password",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_DOMAIN",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "domain",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PORT",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "port",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_AUTHENTICATION",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "authentication",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_OPENSSL_VERIFY_MODE",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "openssl.verify.mode",
        "name": "smtp"
      }
    }
  }
]
----------
Patching the environment of the system-sidekiq
-----------
error: there is no need to specify a resource type as a separate argument when passing arguments in resource/name form (e.g. 'oc get resource/<resource_name>' instead of 'oc get resource resource/<resource_name>'
Verifying sidekiq smtp variables
[
  {
    "name": "SMTP_ADDRESS",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "address",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_USER_NAME",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "username",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PASSWORD",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "password",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_DOMAIN",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "domain",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PORT",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "port",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_AUTHENTICATION",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "authentication",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_OPENSSL_VERIFY_MODE",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "openssl.verify.mode",
        "name": "smtp"
      }
    }
  }
]
replication controller "system-sidekiq-16" successfully rolled out
Upgrading 3scale Version Number
----------
Error from server (BadRequest): json: cannot unmarshal object into Go value of type jsonpatch.Patch
Verifying 3scale Version Number 2.8
----------
"2.7"
Upgrading 3scale ImageStreams
----------
1. amp-system imagestream
----------
imagestream.image.openshift.io/amp-system patched
imagestream.image.openshift.io/amp-system patched
replication controller "system-app-16" successfully rolled out
replication controller "system-sphinx-2" successfully rolled out
replication controller "system-sidekiq-16" successfully rolled out
----------
2. amp-apicast imagestream
----------
imagestream.image.openshift.io/amp-apicast patched
imagestream.image.openshift.io/amp-apicast patched
replication controller "apicast-staging-5" successfully rolled out
replication controller "apicast-production-7" successfully rolled out
----------
3. amp-backend imagestream
----------
imagestream.image.openshift.io/amp-backend patched
imagestream.image.openshift.io/amp-backend patched
replication controller "backend-listener-1" successfully rolled out
replication controller "backend-worker-1" successfully rolled out
replication controller "backend-cron-1" successfully rolled out
----------
4. amp-zync imagestream
----------
imagestream.image.openshift.io/amp-zync patched
imagestream.image.openshift.io/amp-zync patched
replication controller "zync-30" successfully rolled out
replication controller "zync-que-17" successfully rolled out
----------
5. amp-memcached imagestream
----------
imagestream.image.openshift.io/system-memcached patched
imagestream.image.openshift.io/system-memcached patched
replication controller "system-memcache-1" successfully rolled out
----------
6. Setting AMP_RELEASE to 2.8
----------
deploymentconfig.apps.openshift.io/system-app updated
Waiting for rollout to finish: 0 out of 1 new replicas have been updated...
Waiting for rollout to finish: 1 old replicas are pending termination...
Waiting for rollout to finish: 1 old replicas are pending termination...
Waiting for latest deployment config spec to be observed by the controller loop...
Waiting for latest deployment config spec to be observed by the controller loop...
replication controller "system-app-17" successfully rolled out
----------
7. Creating Tags for ImageStreams that did not changed
----------
imagestream.image.openshift.io/zync-database-postgresql patched
imagestream.image.openshift.io/zync-database-postgresql patched
replication controller "zync-database-1" successfully rolled out
imagestream.image.openshift.io/backend-redis patched
imagestream.image.openshift.io/backend-redis patched
replication controller "backend-redis-1" successfully rolled out
imagestream.image.openshift.io/system-redis patched
imagestream.image.openshift.io/system-redis patched
replication controller "system-redis-1" successfully rolled out
imagestream.image.openshift.io/system-mysql patched
error: unable to parse "[{\"op\": \"add\", \"path\": \"/spec/tags/-\", \"value\":{\"annotations\": {\"openshift.io/display-name\": \"System MySQL (latest)\"}, \"from\": { \"kind\":\"ImageStreamTag\", \"name\": \"2.8\"}, \"name\": \"latest\", \"referencePolicy\": {\"type\": \"Source\"}}}": yaml: line 1: did not find expected ',' or ']'
replication controller "system-mysql-1" successfully rolled out
----------
Verifying new imagen in DeploymentConfigs
----------
apicast-production image: "registry.redhat.io/3scale-amp2/apicast-gateway-rhel7@sha256:b1e312b49e48b85441b515b710ff17b420bfd1eab9f9f8730f080e3f5ab7b75c"
apicast-staging image: "registry.redhat.io/3scale-amp2/apicast-gateway-rhel7@sha256:b1e312b49e48b85441b515b710ff17b420bfd1eab9f9f8730f080e3f5ab7b75c"
backend-cron image: "registry.redhat.io/3scale-amp2/backend-rhel7@sha256:b8b45fca90fa9eba973e236a203472e5ea5b27f6bc1cf6fcc34dea6d461e69ca"
backend-listener image: "registry.redhat.io/3scale-amp2/backend-rhel7@sha256:b8b45fca90fa9eba973e236a203472e5ea5b27f6bc1cf6fcc34dea6d461e69ca"
backend-redis image: "registry.redhat.io/rhscl/redis-32-rhel7@sha256:a9bdf52384a222635efc0284db47d12fbde8c3d0fcb66517ba8eefad1d4e9dc9"
backend-worker image: "registry.redhat.io/3scale-amp2/backend-rhel7@sha256:b8b45fca90fa9eba973e236a203472e5ea5b27f6bc1cf6fcc34dea6d461e69ca"
system-app image: "registry.redhat.io/3scale-amp2/system-rhel7@sha256:96b325135a96c9085ec71ebee7ee8c33bdcf9e5eaf3c3730fa4dccac4380b1a3"
system-memcache image: "registry.redhat.io/3scale-amp2/memcached-rhel7@sha256:f4be0092780f5789da6cd17c685ce47aa9386987da28828002d211197822c714"
system-mysql image: "registry.redhat.io/rhscl/mysql-57-rhel7@sha256:9a781abe7581cc141e14a7e404ec34125b3e89c008b14f4e7b41e094fd3049fe"
system-redis image: "registry.redhat.io/rhscl/redis-32-rhel7@sha256:a9bdf52384a222635efc0284db47d12fbde8c3d0fcb66517ba8eefad1d4e9dc9"
system-sidekiq image: "registry.redhat.io/3scale-amp2/system-rhel7@sha256:96b325135a96c9085ec71ebee7ee8c33bdcf9e5eaf3c3730fa4dccac4380b1a3"
system-sphinx image: "registry.redhat.io/3scale-amp2/system-rhel7@sha256:96b325135a96c9085ec71ebee7ee8c33bdcf9e5eaf3c3730fa4dccac4380b1a3"
zync image: "registry.redhat.io/3scale-amp2/zync-rhel7@sha256:a17fbb5ffac12255db4f4616ddf6c3f7749c85e9e3d6bc71bc3862b18658b7a2"
zync-database image: "registry.redhat.io/rhscl/postgresql-10-rhel7@sha256:bf7a6d358b3b6f5a542d061ef96955a1fe9dc1ecf7a60a7876bd2568ab022dc7"
zync-que image: "registry.redhat.io/3scale-amp2/zync-rhel7@sha256:a17fbb5ffac12255db4f4616ddf6c3f7749c85e9e3d6bc71bc3862b18658b7a2"
----------
Deleting smtp ConfigMap
----------
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get pods -w
NAME                         READY     STATUS    RESTARTS   AGE
apicast-production-7-5q4zf   1/1       Running   0          193d
apicast-staging-5-74z2d      1/1       Running   0          214d
backend-cron-1-zpx7w         1/1       Running   0          214d
backend-listener-1-pgjff     1/1       Running   0          214d
backend-redis-1-f7d4r        1/1       Running   0          214d
backend-worker-1-vhnkm       1/1       Running   0          193d
system-app-17-grs89          3/3       Running   0          6m
system-memcache-1-6wxk7      1/1       Running   0          214d
system-mysql-1-t2wzm         1/1       Running   0          214d
system-redis-1-hcwpp         1/1       Running   0          214d
system-sidekiq-16-w92tx      1/1       Running   0          214d
system-sphinx-2-m258j        1/1       Running   0          214d
zync-30-6fbfw                1/1       Running   0          214d
zync-database-1-chtz7        1/1       Running   0          214d
zync-que-17-9stzc            1/1       Running   2          214d
^Csandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get is/system-redis
NAME           DOCKER REPO                                                  TAGS             UPDATED
system-redis   docker-registry.default.svc:5000/claro-3scale/system-redis   2.7,latest,2.8   3 years ago
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get is/backend-redis
NAME            DOCKER REPO                                                   TAGS             UPDATED
backend-redis   docker-registry.default.svc:5000/claro-3scale/backend-redis   latest,2.7,2.8   3 years ago
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get is/zync-database-postgresql
NAME                       DOCKER REPO                                                              TAGS             UPDATED
zync-database-postgresql   docker-registry.default.svc:5000/claro-3scale/zync-database-postgresql   2.7,latest,2.8   3 years ago
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get is/system-mysql
NAME           DOCKER REPO                                                  TAGS             UPDATED
system-mysql   docker-registry.default.svc:5000/claro-3scale/system-mysql   2.7,latest,2.8   3 years ago
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get cm
NAME                  DATA      AGE
apicast-environment   3         3y
backend-environment   1         3y
mysql-extra-conf      1         3y
mysql-main-conf       1         3y
redis-config          1         3y
smtp                  7         3y
system                3         3y
system-environment    11        3y
zync-ca-bundle        1         2y
zync-que-ca-bundle    1         2y
zyncpem               1         2y
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get cm system-environment -o json | jq .data.AMP_RELEASE
"2.7"
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc patch cm system-environment --patch '{"data": {"AMP_RELEASE": "2.8"}}'
configmap/system-environment patched
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get pods -w
NAME                         READY     STATUS    RESTARTS   AGE
apicast-production-7-5q4zf   1/1       Running   0          193d
apicast-staging-5-74z2d      1/1       Running   0          214d
backend-cron-1-zpx7w         1/1       Running   0          214d
backend-listener-1-pgjff     1/1       Running   0          214d
backend-redis-1-f7d4r        1/1       Running   0          214d
backend-worker-1-vhnkm       1/1       Running   0          193d
system-app-17-grs89          3/3       Running   0          12m
system-memcache-1-6wxk7      1/1       Running   0          214d
system-mysql-1-t2wzm         1/1       Running   0          214d
system-redis-1-hcwpp         1/1       Running   0          214d
system-sidekiq-16-w92tx      1/1       Running   0          214d
system-sphinx-2-m258j        1/1       Running   0          214d
zync-30-6fbfw                1/1       Running   0          214d
zync-database-1-chtz7        1/1       Running   0          214d
zync-que-17-9stzc            1/1       Running   2          214d
system-app-17-grs89   3/3       Terminating   0         14m
system-app-17-grs89   0/3       Terminating   0         14m
system-app-17-grs89   0/3       Terminating   0         14m
system-app-17-grs89   0/3       Terminating   0         14m
system-app-17-grs89   0/3       Terminating   0         14m
system-app-17-grs89   0/3       Terminating   0         14m
system-app-17-cgxsb   0/3       Pending   0         0s
system-app-17-cgxsb   0/3       Pending   0         0s
system-app-17-cgxsb   0/3       ContainerCreating   0         0s
system-app-17-cgxsb   0/3       Running   0         3s
^Csandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get pods
NAME                         READY     STATUS    RESTARTS   AGE
apicast-production-7-5q4zf   1/1       Running   0          193d
apicast-staging-5-74z2d      1/1       Running   0          214d
backend-cron-1-zpx7w         1/1       Running   0          214d
backend-listener-1-pgjff     1/1       Running   0          214d
backend-redis-1-f7d4r        1/1       Running   0          214d
backend-worker-1-vhnkm       1/1       Running   0          193d
system-app-17-cgxsb          0/3       Running   0          21s
system-memcache-1-6wxk7      1/1       Running   0          214d
system-mysql-1-t2wzm         1/1       Running   0          214d
system-redis-1-hcwpp         1/1       Running   0          214d
system-sidekiq-16-w92tx      1/1       Running   0          214d
system-sphinx-2-m258j        1/1       Running   0          214d
zync-30-6fbfw                1/1       Running   0          214d
zync-database-1-chtz7        1/1       Running   0          214d
zync-que-17-9stzc            1/1       Running   2          214d
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc exec zync-que-17-9stzc cat /etc/pki/tls/cert.pem > zync-update.pem
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ ll -lh
total 648K
drwxrwxrwx 1 sandersonsa sandersonsa  512 Jun  7 00:24  ./
drwxrwxrwx 1 sandersonsa sandersonsa  512 Jun  6 23:04  ../
-rwxrwxrwx 1 sandersonsa sandersonsa 2.8K Jun  6 19:00  1_pre-reqs.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 2.3K Jun  6 15:25  2_backup.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  11K Jun  6 19:03  3_migration.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa 3.2K Apr 12  2021  4_rollback.sh*
-rwxrwxrwx 1 sandersonsa sandersonsa  66K Jun  7 00:07  dc-system-app.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  98K Apr 12  2021  dc.json*
-rwxrwxrwx 1 sandersonsa sandersonsa    8 Apr 12  2021  master-access-token.txt*
-rwxrwxrwx 1 sandersonsa sandersonsa 3.6K Apr 12  2021  patch-sidekiq.json*
-rwxrwxrwx 1 sandersonsa sandersonsa  11K Apr 12  2021  patch-system-app.json*
drwxrwxrwx 1 sandersonsa sandersonsa  512 Jun  6 23:18  prod-backup-2.7-amp/
-rwxrwxrwx 1 sandersonsa sandersonsa  495 Apr 14  2021 'secret creation.txt'*
-rwxrwxrwx 1 sandersonsa sandersonsa  311 Apr 12  2021  smtp-secret.json*
-rwxrwxrwx 1 sandersonsa sandersonsa 217K Jun  7 00:24  zync-update.pem*
-rwxrwxrwx 1 sandersonsa sandersonsa 217K Jun  6 23:08  zync.pem*
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get dc system-app -o json | jq .spec.strategy.rollingParams.pre.execNewPod.command
[
  "bash",
  "-c",
  "bundle exec rake boot openshift:deploy"
]
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get dc system-app -o json | jq '.spec.strategy.rollingParams.pre.execNewPod.env | map(select(.name == "MASTER_ACCESS_TOKEN")) | length'
1
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get dc system-app -o json | jq '.spec.strategy.rollingParams.pre.execNewPod.env | map(select(.name == "MASTER_ACCESS_TOKEN"))'
[
  {
    "name": "MASTER_ACCESS_TOKEN",
    "valueFrom": {
      "secretKeyRef": {
        "key": "MASTER_ACCESS_TOKEN",
        "name": "system-seed"
      }
    }
  }
]
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get dc system-app -o json | jq '.spec.template.spec.containers | map(select(.name == "system-developer"))[].env | map(select(.name | contains("SMTP")))'
[
  {
    "name": "SMTP_ADDRESS",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "address",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_USER_NAME",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "username",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PASSWORD",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "password",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_DOMAIN",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "domain",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PORT",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "port",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_AUTHENTICATION",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "authentication",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_OPENSSL_VERIFY_MODE",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "openssl.verify.mode",
        "name": "smtp"
      }
    }
  }
]
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get dc system-sidekiq -o json | jq '.spec.template.spec.containers | map(select(.name == "system-sidekiq"))[].env | map(select(.name | contains("SMTP")))'
[
  {
    "name": "SMTP_ADDRESS",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "address",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_USER_NAME",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "username",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PASSWORD",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "password",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_DOMAIN",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "domain",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_PORT",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "port",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_AUTHENTICATION",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "authentication",
        "name": "smtp"
      }
    }
  },
  {
    "name": "SMTP_OPENSSL_VERIFY_MODE",
    "valueFrom": {
      "configMapKeyRef": {
        "key": "openssl.verify.mode",
        "name": "smtp"
      }
    }
  }
]
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get pods
NAME                         READY     STATUS    RESTARTS   AGE
apicast-production-7-5q4zf   1/1       Running   0          193d
apicast-staging-5-74z2d      1/1       Running   0          214d
backend-cron-1-zpx7w         1/1       Running   0          214d
backend-listener-1-pgjff     1/1       Running   0          214d
backend-redis-1-f7d4r        1/1       Running   0          214d
backend-worker-1-vhnkm       1/1       Running   0          193d
system-app-17-cgxsb          3/3       Running   0          24m
system-memcache-1-6wxk7      1/1       Running   0          214d
system-mysql-1-t2wzm         1/1       Running   0          214d
system-redis-1-hcwpp         1/1       Running   0          214d
system-sidekiq-16-w92tx      1/1       Running   0          214d
system-sphinx-2-m258j        1/1       Running   0          214d
zync-30-6fbfw                1/1       Running   0          214d
zync-database-1-chtz7        1/1       Running   0          214d
zync-que-17-9stzc            1/1       Running   2          214d
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get podsecho  ${DEPLOYED_APP_LABEL}^C
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ echo  ${DEPLOYED_APP_LABEL}

sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ DEPLOYED_APP_LABEL=$(oc get dc backend-listener -o json | jq .spec.template.metadata.labels.app -r)
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ echo  ${DEPLOYED_APP_LABEL}
3scale-api-management
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ CFGMAP_DATA_CONTENTS=$(oc get configmap smtp -o json | jq -r .data)
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ echo  ${CFGMAP_DATA_CONTENTS}
{ "address": "smtp.virtua.com.br", "authentication": "", "domain": "", "openssl.verify.mode": "none", "password": "", "port": "25", "username": "" }
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$ oc get configmap smtp -o json | jq -r .data
{
  "address": "smtp.virtua.com.br",
  "authentication": "",
  "domain": "",
  "openssl.verify.mode": "none",
  "password": "",
  "port": "25",
  "username": ""
}
sandersonsa@USU-E0FQ15C8F7S:/mnt/c/Users/sandersonsa/Documents/scripts-upgrade-3scale-27-28$