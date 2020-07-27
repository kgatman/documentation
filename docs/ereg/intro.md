# eRegister Installation Manual

This document attempts to standardize how we prepare our servers to be ready for deployment at health facilities.

Before we follow the steps on how to prepare the server, we first have to install Ubuntu Server 18.04 LTS from [Ubuntu Site](https://ubuntu.com/#download)

## Installing Docker

[![asciicast](https://asciinema.org/a/CZiacOPBRcmlOtjaVXcFUFohr.svg)](https://asciinema.org/a/CZiacOPBRcmlOtjaVXcFUFohr)

* To install Docker, please follow the instructions detailed in [https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04) 

_these instructions above were written for Ubuntu 16 but work perfectly for Ubuntu 18_

## Pulling the docker image and running it as a container
* In situations of poor internet connectivity where we're committing and sharing images using sneakernet, please follow the guide in [here](Working-with-Docker-Images-Locally)
* To pull the docker, it's not necessary to login from the terminal, just run the following:
`docker pull omrsregrepo/bahmni_base:25012020_release`
* After the image has been pulled you should be able to see it when you do `docker images`
* A container is a running instance of an image. The last step is to run our image to make container with `docker run -e container_name=openmrseregister -it -d --restart always -p 443:443 -p 80:80 -p 8069:8069 -p 8000:8000 --privileged --name openmrseregister -v openmrseregister:/openmrseregister omrsregrepo/bahmni_base:25012020_release /bin/bash`
* To check that indeed we have a container running, you can do `docker ps`. 
* Navigate into the container using the command,`docker exec -it openmrseregister bash`
* Once you have landed into the container, make sure that you're in the / directory and then start mysqld service with `services mysqld start`, login to a database without a password and then run the command below:
* `source openmrs.sql`
* After running the command above, do `use openmrs` and then do `source OpenMRS_Start_up_Schema_V1.sql`


## Starting Services
Often times, we're going to encounter situations where a container is running but the services inside the container are not, to start your services running the following commands in this order:
    
* `service httpd start`
* `service mysqld start`
* `service openmrs start`
* `service bahmni-reports start`

Now you should be able to see eRegister when you browse to http://server_IP/bahmni/home. *you'll use the IP address of your server*  

## Enabling/Disabling Locations

Depending on the health facility where the server will be deployed, we'll have to either enable or disable locations in the database.
To do all of these, it is highly recommended that we run all of our sql queries through phpMyAdmin and shy away from using CLI. Browse to http://192.168.8.10/mydb and use the following credentials. *remember to use your IP address*

* username: 
* password: 

On the left pane, you'll see a list of databases, click on `openmrs`. All of the locations are managed by a `location` table. If for example you're in Motebang Hospital, to see all of the locations for Motebang Hospital, run the following query: 

`SELECT location_id, name, retired
FROM location
WHERE name LIKE '%mote%'`


`1` is for when retired is `TRUE` and `0` is when retired is `FALSE`. To enable locations we have to set retired to `0`. 
 * So it will be done with the following `UPDATE` query:
`UPDATE location
SET retired = 0, 
WHERE location_id=121;`
to enable `Motebang Hospital`
 * So it will be done with the following `UPDATE` query:
`UPDATE location
SET retired = 0, 
WHERE location_id=122;`
to enable `ART Corner Motebang Hospital`
* ...and so on and so fourth...


 ## Configuring Backup
CONTENT LOADING....
