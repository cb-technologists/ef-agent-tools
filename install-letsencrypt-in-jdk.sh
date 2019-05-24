#!/bin/bash
set -e

KEYSTORE=/opt/electriccloud/electriccommander/jre/lib/security/cacerts
KEYTOOL=/opt/electriccloud/electriccommander/jre/bin/keytool

wget https://letsencrypt.org/certs/letsencryptauthorityx1.der
wget https://letsencrypt.org/certs/letsencryptauthorityx2.der
wget https://letsencrypt.org/certs/lets-encrypt-x1-cross-signed.der
wget https://letsencrypt.org/certs/lets-encrypt-x2-cross-signed.der
wget https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.der
wget https://letsencrypt.org/certs/lets-encrypt-x4-cross-signed.der

# to be idempotent
$KEYTOOL -delete -alias isrgrootx1 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
$KEYTOOL -delete -alias isrgrootx2 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
$KEYTOOL -delete -alias letsencryptauthorityx1 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
$KEYTOOL -delete -alias letsencryptauthorityx2 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
$KEYTOOL -delete -alias letsencryptauthorityx3 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
$KEYTOOL -delete -alias letsencryptauthorityx4 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true

$KEYTOOL -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias isrgrootx1 -file letsencryptauthorityx1.der
$KEYTOOL -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias isrgrootx2 -file letsencryptauthorityx2.der
$KEYTOOL -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx1 -file lets-encrypt-x1-cross-signed.der
$KEYTOOL -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx2 -file lets-encrypt-x2-cross-signed.der
$KEYTOOL -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx3 -file lets-encrypt-x3-cross-signed.der
$KEYTOOL -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx4 -file lets-encrypt-x4-cross-signed.der

rm -f letsencryptauthorityx1.der letsencryptauthorityx2.der lets-encrypt-x1-cross-signed.der lets-encrypt-x2-cross-signed.der lets-encrypt-x3-cross-signed.der lets-encrypt-x4-cross-signed.der