# CertPro.sh
A script to create a local CA and ssl cert for nginx.<br />
Initialize the script by travelling to the directory.<br />
Be sure your machine has openssl installed.<br />
If you copy/pasted the script, there's a good chance it's not executable.
You will get an error.<br />
To remedy this type the following commands:

	cd (full file path)
	sudo chmod u+x ./CertPro.sh
Then type (in terminal):
	
	sudo sh ./CertPro.sh
The script will then guide you through the process. Be sure to follow exactly, or your browser might reject the certificate.<br />
Retrieve the files in the directory you ran the script in.<br />
-------------------------
# How to Attach to Nginx
1. Run in terminal: 
	```
	sudo nano /etc/nginx/sites-enabled/default
	```
2. Then Add this to the server block:<br />
	```
	listen 443 ssl default_server;
	listen [::]:443 ssl default_server;
  	ssl_certificate /etc/nginx/ssl/nginx.crt;
  	ssl_certificate_key /etc/nginx/ssl/nginx.key;
	```
3. Change the ssl_certificate and ssl_certificate_key path to where your nginx.key and nginx.crt are stored. In this case, a seperate "ssl" file has been created inside the defauld /etc/nginx installation.

4. Install the ca.crt in your browser. If you are deploying to multiple computers, you will need to deploy on all computers that need to trust your server. If your end user is using firefox, install separately from the system trust store, as firefox has a separate trust. Keep the private key (nginx.key) secret. If someone gets this key, they can sign their server with you certificate, and fake your identity. (Check your browser for a setting like "certificates")

5. Run in terminal:
	```
	sudo service nginx restart (requires password)
	```
6. Then, navigate to the IP your server is on (eg 127.0.0.1 if you're browsing on the server machine)
