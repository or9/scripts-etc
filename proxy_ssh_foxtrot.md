#Proxy All The Things
There are two parts: server and client. This will be focused on the client side of things. If you want to run your own server, it's pretty simple too.
##Overview
* Create an SSH key
* Provide the public key (.pub) to the server, in this case, to me
* On Mac or Linux, in your terminal, type `ssh -vD 1080 proxy@foxtrot.duckdns.org`
* The `-v` flag above prints verbose output. If you don't wish to see details about errors, connection status, etc., you may ommit the `v` and do `ssh -D …`
* On Windows, you can use PuTTY or if you want to do it the easy way like Mac and Linux, use Git Bash (mingw32 or something like that)

##Details
###Key Generation
To create an SSH key is relatively simple on Mac or Linux. On Windows there is PuTTY Keygen which you can use to generate a key-pair
#### Mac or Linux (or Windows using Git Bash)
Open Terminal and type `ssh-keygen -b 4096 -f ~/.ssh/proxy_id_rsa`  
#### Windows (using PuTTY) 
* Open puttygen, use either a 2048 or 4096 bit key, SSH-2 RSA is fine (default radio button)
* Click Generate button
* Save public and private key to your user's .ssh directory (make it if it's not there)
* I think it's required to export an OpenSSH key (from conversions menu) as your public key which you'll provide to the server (me)  
Email (password protected zip or 7z file), or transfer the public key file to me in whatever way (USB, etc)
###Connecting to the Server
#### Mac or Linux (or Windows using Git Bash)
Open Terminal and type `ssh -vD 1080 proxy@foxtrot.duckdns.org`  
#### Windows
* Open PuTTY
* Host Name (or IP address): `proxy@foxtrot.duckdns.org` Port: `22`
* Menu (left) > Connection > +SSH > Auth > Authentication parameters: Browse for your private key file for authentication
* Menu (left) > Connection > +SSH > Tunnels > Add new forwarded port: Source port `1080`, and change the radio at the bottom to `Dynamic`, click Add button
* Save these settings and click Open at the bottom.
* If you put a passphrase on your key, it will request this, and should connect to the proxy
### Setting up the browser
If you wish to configure settings per browser, you can do that on each platform in the same way. I prefer a global configuration for the computer. Make sure that, for this configuration, we only set the SOCKS field. If the option is present, choose SOCKS 5 and Remote DNS. It may have a different name, but the point is we also want to proxy DNS requests.
####Chrome
Download Proxy SwitchySharp or configure global proxy settings for computer through settings menu
Or, create a chrome launcher script, either in your ~/.bashrc or shortcut to a script
#####~/.bashrc
````
function secure_chromium {
	port=1080
	chromium --proxy-server="socks://localhost:$port" &
	exit
}
````  
then, from terminal you can do `secure_chromium`
#####Shortcut
````
#!/bin/bash
port=1080
chromium --proxy-server="socks://localhost:$port" &
exit
````
then, from terminal `ln -s ~/chromiumsecure /usr/local/bin/`
####Firefox

##Misc.
* The reason I don't simply send my public key is because you need the private key as well.  
The public key is used to authorize clients on the server side. You send the public key to me, I add it to authorized\_hosts, you connect using your private key which validates against the authorized public key that I have.  
Without the private key, you cannot connect or validate.
