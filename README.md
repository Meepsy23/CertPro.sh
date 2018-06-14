# CertPro.sh
A script to create a local CA and ssl cert for nginx.<br />
Initialize the script by travelling to the directory,<br />
Then type (in terminal)
	
	sudo sh ./CertPro.sh
The script will then guide you through the process.<br />
Retrieve the files in the directory you ran the script in.<br />
-------------------------
How to Attach to Nginx<br />
1.Run in terminal: 
	
	sudo nano /etc/nginx/sites-enabled/default
-------------------------
2.Then Add this to the server block:<br />

	listen 443 ssl default_server;
	listen [::]:443 ssl default_server;
  	ssl_certificate /etc/nginx/ssl/nginx.crt;
  	ssl_certificate_key /etc/nginx/ssl/nginx.key;
  -------------------------
3. Change the ssl_certificate and ssl_certificate_key path to where your nginx.key and nginx.crt are stored.<br />
-------------------------
4. Install the ca.crt in your browser. Keep the private key secret. (Check your browser for a setting like "certificates")<br />
-------------------------
5. Run in terminal:
	
	sudo service nginx restart (requires password)
-------------------------
6. Then, navigate to the IP your server is on (eg 127.0.0.1)<br />
------------------------
