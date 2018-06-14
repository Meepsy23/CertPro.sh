# CertPro.sh
A script to create a local CA and ssl cert for nginx.
Initialize the script by travelling to the directory,
Then type sudo sh ./CertPro.sh
The script will then guide you through the process.
Retrieve the files in the directory you ran the script in.
-------------------------
How to Attach to Nginx
1.Run in terminal: sudo nano /etc/nginx/sites-enabled/default
-------------------------
2.Then Add this to the server block:
	listen 443 ssl default_server;
	listen [::]:443 ssl default_server;
  ssl_certificate /etc/nginx/ssl/nginx.crt;
  ssl_certificate_key /etc/nginx/ssl/nginx.key;
  -------------------------
3. Change the ssl_certificate and ssl_certificate_key path to where your nginx.key and nginx.crt are stored.
-------------------------
4. Install the ca.crt in your browser. Keep the private key secret.
-------------------------
5. Run in terminal: service restart nginx (requires password)
-------------------------
6. Then, navigate to the IP your server is on (eg 127.0.0.1)
-------------------------
