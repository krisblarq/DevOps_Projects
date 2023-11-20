# Loadbalancer with Nginx
Load balancing is the distribution of client request across different servers serving the same response. Lets say you have a web server that serves user login details, profile, etc. If you have one server that scales vertically, when the server gets to it's maximun limit, it starts to fail. But what if we scale the server horizontally, meaning we add more servers to accomodate growing user request. This means we never run out of processing capacity. But this poses a problem, how do we tell which server to send user request to? and how do we not overload a single server while others are idle?

This is why we use load balancers. A load balancer can be a software installed in a server. It helps us route user requests to different servers based on a set algorithm.

In this article, we are going to talk about implementing a load balancer with Nginx.

Fist, we need three VMs. Two of them will have Apache webserver installed in them and the third server will serve as our load balancer with Nginx installed. We have initially provisioned 2 AWS EC2 instances, lets install and configure Apache on them.

## Step 1 - Install Apache Webserver

After connecting to your web server, to install Apache2, run the following command 

`sudo apt update -y &&  sudo apt install apache2 -y`

![apache installation](./img/install%20apache2.png)

Then start Apache with 

`sudo systemctl status apache2`

## Step 2 - Configure Apache to serve a page showing its IP.
We start by editing the apache config file to add a new port 8000.
Use this command to open and edit the file in your text editor

`sudo vi /etc/apache2/ports.conf`

![apache config 1](./img/config%20apache%20to%20listen%20at%20port%208000.png)


Now edit another of the apache config files and change the virtualhost port from 80 to port 8000.

`sudo vi /etc/apache2/sites-available/000-default.conf`

Restart Apache

`sudo systemctl restart apache2`

Create a new HTML file in VIM text editor.

`sudo vi index.html`

Add this content to the HTML file

`        <!DOCTYPE html>
        <html>
        <head>
            <title>My EC2 Instance</title>
        </head>
        <body>
            <h1>Welcome to my EC2 instance</h1>
            <p>Public IP: YOUR_PUBLIC_IP</p>
        </body>
        </html>
`
Change ownership of the index file

`sudo chown www-data:www-data ./index.html`

Replace the default HTML file with the new on created.

`sudo cp -f ./index.html /var/www/html/index.html`
Restart Apache.

If we go to the browser and enter <our-public-IP/8000> We should see the HTML file created like below.

![apache on browser](./img/confirm%20apache2%20on%20browser.png)


## Step 3 - Install Nginx as load balancer
Now we provision a new instance and install Nginx on it.

`sudo apt update -y && sudo apt install nginx -y`

Confirm installation 

`sudo systemctl status nginx`

Open Nginx configuration file with the command below

`sudo vi /etc/nginx/conf.d/loadbalancer.conf`

Copy the below code into the file 

`        
        upstream backend_servers {

            # your are to replace the public IP and Port to that of your webservers
            server 127.0.0.1:8000; # public IP and port for webserser 1
            server 127.0.0.1:8000; # public IP and port for webserver 2

        }

        server {
            listen 80;
            server_name <your load balancer's public IP addres>; # provide your load balancers public IP address

            location / {
                proxy_pass http://backend_servers;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            }
        }
`

The file should look like the below;

![nginx config file](./img/nginx%20load%20balancer%20config.png)

Test your configuration with this command below

`sudo nginx -t`

Paste the public IP of the Nginx load balancer on your browser. You should see the initial apache screen on display.

![nginx screen](./img/public%20IP%20of%20nginx%20server.png)

