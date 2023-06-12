oc patch dc/system-sidekiq -p '{"spec":{"template":{"spec":{"containers":[{"name":"system-sidekiq","env":[{"name":"SMTP_ADDRESS","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"address","name":"system-smtp"}}},{"name":"SMTP_USER_NAME","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"username","name":"system-smtp"}}},{"name":"SMTP_PASSWORD","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"password","name":"system-smtp"}}},{"name":"SMTP_DOMAIN","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"domain","name":"system-smtp"}}},{"name":"SMTP_PORT","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"port","name":"system-smtp"}}},{"name":"SMTP_AUTHENTICATION","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"authentication","name":"system-smtp"}}},{"name":"SMTP_OPENSSL_VERIFY_MODE","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"openssl.verify.mode","name":"system-smtp"}}}]}]}}}}'


oc patch dc/system-app -p '{"spec":{"template":{"spec":{"containers":[{"name":"system-master","env":[{"name":"SMTP_ADDRESS","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"address","name":"system-smtp"}}},{"name":"SMTP_USER_NAME","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"username","name":"system-smtp"}}},{"name":"SMTP_PASSWORD","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"password","name":"system-smtp"}}},{"name":"SMTP_DOMAIN","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"domain","name":"system-smtp"}}},{"name":"SMTP_PORT","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"port","name":"system-smtp"}}},{"name":"SMTP_AUTHENTICATION","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"authentication","name":"system-smtp"}}},{"name":"SMTP_OPENSSL_VERIFY_MODE","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"openssl.verify.mode","name":"system-smtp"}}}]},{"name":"system-provider","env":[{"name":"SMTP_ADDRESS","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"address","name":"system-smtp"}}},{"name":"SMTP_USER_NAME","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"username","name":"system-smtp"}}},{"name":"SMTP_PASSWORD","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"password","name":"system-smtp"}}},{"name":"SMTP_DOMAIN","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"domain","name":"system-smtp"}}},{"name":"SMTP_PORT","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"port","name":"system-smtp"}}},{"name":"SMTP_AUTHENTICATION","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"authentication","name":"system-smtp"}}},{"name":"SMTP_OPENSSL_VERIFY_MODE","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"openssl.verify.mode","name":"system-smtp"}}}]},{"name":"system-developer","env":[{"name":"SMTP_ADDRESS","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"address","name":"system-smtp"}}},{"name":"SMTP_USER_NAME","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"username","name":"system-smtp"}}},{"name":"SMTP_PASSWORD","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"password","name":"system-smtp"}}},{"name":"SMTP_DOMAIN","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"domain","name":"system-smtp"}}},{"name":"SMTP_PORT","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"port","name":"system-smtp"}}},{"name":"SMTP_AUTHENTICATION","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"authentication","name":"system-smtp"}}},{"name":"SMTP_OPENSSL_VERIFY_MODE","valueFrom":{"configMapKeyRef":null,"secretKeyRef":{"key":"openssl.verify.mode","name":"system-smtp"}}}]}]}}}}'


oc patch imagestream/system-mysql --type=json -p '[{"op": "add", "path": "/spec/tags/-", "value": {"annotations": {"openshift.io/display-name": "System MySQL (latest)"}, "from": { "kind": "ImageStreamTag", "name": "2.8"}, "name": "latest", "referencePolicy": {"type": "Source"}}}]'


oc rollout latest dc/system-app -n claro-3scale
oc rollout latest dc/system-sphinx -n claro-3scale
oc rollout latest dc/system-sidekiq -n claro-3scale
oc rollout latest dc/apicast-production -n claro-3scale
oc rollout latest dc/apicast-staging -n claro-3scale
oc rollout latest dc/backend-listener -n claro-3scale
oc rollout latest dc/backend-worker -n claro-3scale
oc rollout latest dc/backend-cron -n claro-3scale
oc rollout latest dc/zync -n claro-3scale
oc rollout latest dc/zync-que -n claro-3scale
oc rollout latest dc/system-memcache -n claro-3scale
oc rollout latest dc/zync-database-postgresql -n claro-3scale
oc rollout latest dc/backend-redis -n claro-3scale
oc rollout latest dc/system-mysql -n claro-3scale
oc rollout latest dc/system-redis -n claro-3scale



oc exec zync-que-17-9stzc cat /etc/pki/tls/cert.pem > zync-update.pem