#!/bin/bash
set -e

KEYSTORE=/opt/electriccloud/electriccommander/jre/lib/security/cacerts
KEYTOOL=/opt/electriccloud/electriccommander/jre/bin/keytool

wget https://letsencrypt.org/certs/isrgrootx1.pem.txt
wget https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt
wget https://letsencrypt.org/certs/letsencryptauthorityx3.pem.txt

# to be idempotent
$KEYTOOL -delete -alias isrgrootx1 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
$KEYTOOL -delete -alias letsencryptauthorityx3 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
$KEYTOOL -delete -alias letsencryptauthorityx4 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true

$KEYTOOL -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias isrgrootx1 -file isrgrootx1.pem.txt
$KEYTOOL -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx3 -file letsencryptauthorityx3.pem.txt
$KEYTOOL -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx3-cross -file lets-encrypt-x3-cross-signed.pem.txt

rm -f isrgrootx1.pem.txt lets-encrypt-x3-cross-signed.pem.txt letsencryptauthorityx3.pem.txt