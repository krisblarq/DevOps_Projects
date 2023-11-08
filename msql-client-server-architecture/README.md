# MySQL Client-Server Architecture
What is client-server architecture? This refer to an architecture where two or more computers are connected to each other for the purpose of sending and recieving messages.

The computer sending the request is the client, and the one sending back a response is the server. If we extend this concept further and add a Database server to our architecture, we get a client requesting from a server and the server sending a request to the Database. In this case, the server becomes the client.

## Implementing a client server architecture using MySQL database management system (DBMS).
We are going to implement a client-server architecture using MySQL database. To achieve this, we are going to launch 2 AWS EC2 instances. 
- Server A - mysql server.
- Server B - mysql client.

on server A, install MySQL Server software.

On server B install mysql client.

By default, your ec2 instances will be on the same VPC. This is important to allow secured communication between your instances through their private IPs. Now ssh into your server A and start mysql server. By default mysql binds internet traffic to 127.0.0.1, we need to change this to all IP addresses.
To do this go to the mysql config file.

`sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf 
`

Look for "binding address" and comment it out or change the address to 0.0.0.0

Go to aws > mysql server instance > security > security group. Here we want to add a new inbound rule to allow traffic from our client server. Add a new inbound rule, select MySQL for type, 3306 is default for port range. Now copy the private IP of your client server and add it to custom filed. What we have done is tell our mysql server to accept inbound request from our client IP address.

Now that we have our servers setup and permissions granted, we need to login to our mysql console on the mysql server and create a user different from root. Assign this new user a password, create a database and assign this new user permission over that new database.

These are the steps:

**Step 1 - Login to mysql as a root user.**

`mysql -u root -p`

![login to sql](./img/login%20mysql%20with%20password.png)

**Step 2 - Create a new user.**
Run the following command to create a new user

`CREATE USER 'username'@'ip-address' IDENTIFIED BY 'set-password';`

Where username is any username you choose, "@ip-address" is the private IP address from your other client server,and set-password is any password you choose.Remember these commands to create a new user is being run on your mysql server.

Give the new user permissions to the database created.

`GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'ip-address';`

Again, the IP address specified above is the private IP of the client server.

Flush the privileges to update the new privileges.

`FLUSH PRIVILEGES;`

We are done setting up the mysql server. Login to the mysql client server and download only sql client software. To connect to the other MySQL server on the server A, run this command.

`mysql -u your_user -p -h serverA-private-IP`

your_user is the new user you created initially on the other ec2 instance. If everything is done correctly the above command should connect you to the server on the Server A.

