#!/usr/bin/env bash
echo CgogICBfX19fXyAgICAgICAgICBfICAgX19fX18gICAgICAgICAgICAgICAgICAgXyAgICAgCiAgLyBfX19ffCAgICAgICAgfCB8IHwgIF9fIFwgICAgICAgICAgICAgICAgIHwgfCAgICAKIHwgfCAgICAgX19fIF8gX198IHxffCB8X18pIHwgX18gX19fICAgICAgX19ffCB8X18gIAogfCB8ICAgIC8gXyBcICdfX3wgX198ICBfX18vICdfXy8gXyBcICAgIC8gX198ICdfIFwgCiB8IHxfX198ICBfXy8gfCAgfCB8X3wgfCAgIHwgfCB8IChfKSB8ICBfXF9fIFwgfCB8IHwKICBcX19fX19cX19ffF98ICAgXF9ffF98ICAgfF98ICBcX19fLyAgKF8pX19fL198IHxffAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKCg== | base64 --decode                              
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo Welcome to CertPro Automated Certificate Generator!
echo WARNING! If you did not run this script as superuser, it will fail. Restart if needed.
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo --Creating Cert Authority Private Key.--
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
openssl genrsa -des3 -out ca.key 2048
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo --Done Creating Key. Creating Certificate Authority Root--
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1825 -out ca.pem
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo --Done creating CA Root. Creating Server Private Key--
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
openssl genrsa -out nginx.key 2048
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo --Done creating Server Key. Creating Server CSR--
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
openssl req -new -key nginx.key -out nginx.csr
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo --Done creating CSR. Creating extension file--
read -p 'You will now need to enter the FQDN of your server: ' fqdn
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo "authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
IP.1=$fqdn">>nginx.ext
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo --Done Creating SAN. Now creating Server Certificate.--
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
openssl x509 -req -in nginx.csr -CA ca.pem -CAkey ca.key -CAcreateserial \
-out nginx.crt -days 18250 -sha256 -extfile nginx.ext
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo --Done. Get files you need in the directory you ran this script in.--
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
