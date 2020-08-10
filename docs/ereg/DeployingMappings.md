# Mappings and Serialized Object Deployment

!!! warning
    * Please make sure that **no one** is using the system when doing Step  1 and 2 **Removing and Creating New Container**.
    * Backup your database before doing any of these steps.


### Our automated deployment for mappings and serialized object comprises 5 steps:

##### 0. Preparatory Steps

* SSH into the server with `ssh openmrs@_SERVER_IP_ADDRESS`
* First check to see if your server has internet connectivity with `ping github.com`
* If not try to check contents of resolv.conf in /etc/ by running the following command: cat /etc/resolv.conf.Normally you should see google.com nameserver pointing to its ip 8.8.8.8.Edit the file if name server is not configured in the file.
* Nameserver(all in lowercase) 8.8.8.8.Ping 8.8.8.8 or google.com.After you may ping github.com just to make sure you are able to get packets from github.com

* Then download all of the files need with `git clone https://github.com/eRegister/docs.git `

* The command above will create a folder called `docs` in `/home/openmrs` if you didn't change to another directory. All of files that need to be transfered to the server are in docs/scripts:
        * `concept_restore.sh`
        * `gitpull_bahmniapps.sh`,`gitpull_concepts.sh`,`gitpull_mappings`,
        * `gitpull_serial.sh`,`serializedobject_restore.sh`
        * `gitpullbahmniapps.service`,`gitpullconcepts.service`,`gitpullmappings.service`,`gitpullserializedobject.service`
* Go to `/development/` and create the following directories `openmrs_reporting_release` and `openmrs_concepts_release` and grant openmrs user permissions to own the files.
* Move the following files to  `/usr/local/bin/` and make them executable:
`concept_restore.sh`,`serializedobject_restore`.
* Move `gitpull_concepts.sh` to `/development/openmrs_concepts_release` and `gitpull_serial.sh` to `/development/openmrs_reporting_release/`


!!! note
    Files are already on the server

!!! caution
    **PLEASE ENSURE THAT YOU HAVE BACKED UP THE DB BEFORE EXECUTING THE STEPS BELOW!!!**

##### 1. Removing Current Container

* check the running container: `docker ps`
* Stop the container: `docker stop openmrseregister`
* Check that the container has stopped run `docker ps` and you should see an empty table
* Create a new image from the stopped container: `docker commit openmrseregister omrsregrepo/bahmni_base:09082020` [*tag should be date at time of creating image*]
* you can check the newly created image with* `docker images`
* Remove the container: `docker container rm openmrseregister`

##### 2. Creating a Volumes and enabling services

* Now it's time to create a new container from the image we created earlier with: `docker run -e container_name=openmrseregister -it -d --restart always -p 443:443 -p 80:80 -p 8069:8069 -p 8000:8000 --privileged --name openmrseregister -v /development/bahmni_config_release:/development/bahmni_config_release -v /development/dhisconnector_mappings:/development/dhisconnector_mappings -v /development/bahmniapps_release:/development/bahmniapps_release omrsregrepo/bahmni_base:06082020 /bin/bash
`
* Go to `/development/` and grant openmrs user permissions to files in `/development/dhisconnector_mappings` and `/development/bahmniapps_release`
* Move `gitpull_bahmniapps.sh` to `/development/bahmniapps_release` and `gitpull_mappings.sh` to `/development/dhisconnector_mappings`, make them executable.
* Create local repo's in all directories in `/development` except `/development/bahmni_config_release`, commands `git init` , `git remote add origin https://github.com:/eRegister/repo_name`
* test that you are able to fetch files from remote repo's by `git fetch --all`
* move all services `gitpullmappings.service`,`gitpullconcepts.serivce`,
`gitpullbahmniapps.service` and `gitpullserializedobject.service`.
* Nagivate into /etc/system/system/ and type the following commands to enable `gitpull_mappings.service`, `gitpullconcepts.service`, `gitpullbahmniapps.service`,`gitpullserializedobject.service`
   * `sudo chmod 664 service_name`
   * `sudo systemctl daemon-reload`
   * `sudo systemctl enable service_name`

   ** Note:when the service has been registered successfully you should see created sym link in ** `/etc/systemd/system/default.target.wants/.`

##### 3. Configuring **cronjob**
* configure the cronjob to trigger the services everyday 9 am.
* to edit the cronjob do: `sudo crontab -e` if it's first time running the this command it'll probably ask you to choose the default text editor, please be kind enough to choose Nano as it's the easiest editor formost administrators.
* configure the script as as shown below
`*/3 * * * * systemctl restart gitpullmappings.service >> /var/log/gitpull_mappings.log`
`*/4 * * * * systemctl restart gitpullserializedobject.service >> /var/log/gitpull_serial.log`
`*/5 * * * * systemctl restart gitpullconcepts.service >> /var/log/gitpull_concepts.log`
`*/6 * * * * sudo bash /usr/local/bin/concepts_restore.sh >> /var/log/concept_restore.log`
`20 7 * * * sudo bash /usr/local/bin/serializedobject_restore.sh >> /var/log/serial_restore.log`
* Wait for a while for cron job to execute the commands and check  directories in development have updates from github.For failed services reffer to `automated deployment page` to troubleshoot.



##### 4. Restore database and create soft links

* Go to into a container and start mysql service.
* Connect to database server using no password `mysql -uroot -p`
* Initialise openmrs database and users by sourcing openmsq.sql file in container root directory, `source openmrs.sql;`
* Wait a moment for databases to be created and once the script is done quit or exit the database server and restart mysql.
* Restore facility database using the command `mysql -uroot -ppassword openmrs;`
* Go to `/opt/openmrs/dhisconnector`
* Unlink remove mappings folder and create soft link to `/development/dhisconnector_mappings/dhisconnector_mappings/mappings` command: `sudo ln -s /development/dhisconnector_mappings/dhisconnector_mappings/mappings/ mappings`
* Go to `/usr/local/bin` and run `serializedobject_restore.sh`
* Restart other services and openmrs the broswer to access openmrs admin page.
* Go to reporting  you should see total of 36 openmrs period indicator reports.
