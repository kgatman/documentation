# Automated Deployment

!!! warning
    * Please make sure that **no one** is using the system 
    * Backup your database before doing any of these steps.


### Our automated deployment comprises 5 steps:

##### 0. Preparatory Steps

* SSH into the server with `ssh openmrs@_SERVER_IP_ADDRESS` 
* First check to see if your server has internet connectivity with `ping github.com`
* If not try to check contents of `resolv.conf` in `/etc/` by running the following command: `cat /etc/resolv.conf`

* Normally you should see google.com nameserver pointing to its ip `8.8.8.8`. Edit the file if name server is not configured in the file.

        * `nameserver 8.8.8.8`
        
        `Ping 8.8.8.8` or `google.com`.After you may ping github.com just to make sure you are able to get packets from github.com

* Then download all of the files need with `git clone https://github.com/eRegister/docs.git `

* The command above will create a folder called `docs` in `/home/openmrs` if you didn't change to another directory. All of files that need to be transfered to the server are in docs/scripts/:
        
* `gitpull.service`
* `gitpull.sh`
* `openmrs_global_properties`
* `serialized objects`
* `symbolic_creation.sh`
* `visit_types.sql`
        
!!! note
    we started by ssh'ng into the server so the files are already in the server


* Backup facility specific configurations and configurations: 
        *  if you haven't already, backup your database with invoking the script that does that, that is already in your server: `docker exec -i openmrseregister /usr/bin/mysqldump -u root --password=password -A > $HOME/latestback.sql` _the -A tag is going to backup everything_
        * do `ls -lh` to see the size of `latestback.sql` it should be 200MB or more, not less.

!!! caution
    **PLEASE ENSURE THAT YOU HAVE BACKED UP BOTH  THE DB AND CONFIG FILES BEFORE EXECUTING THE STEPS BELOW!!!**

##### 1. Removing Current Container

* check the running container: `docker ps`
* Stop the container: `docker stop openmrseregister`
* Check that the container has stopped run `docker ps` and you should see an empty table
* Create a new image from the stopped container: `docker commit openmrseregister omrsregrepo/bahmni_base:19052020` [*tag should be date at time of creating image*]
* you can check the newly created image with* `docker images` 
* Remove the container: `docker container rm openmrseregister`

##### 2. Creating a Volume

* create development directory `sudo mkdir -p /development/bahmni_config_release`
* change ownership of the new folder from `root` to `openmrs` with `sudo chown -R openmrs:openmrs /development` becuase the service is managed by openmrs user 
* get into the directory with `cd /development/bahmni_config_release`
* configure gitpull services

!!! note
**DO NOT** use `git clone`

* initialise new local git repo: `git init`
* if you do `ls -a` you'll see a hidden `.git` to show that indeed the folder has been intialized
* connect local repository with remote: `git remote add origin https://github.com/eRegister/bahmni_config_release.git`
* download the latest commits to the repo: `git fetch --all` *you should see a log of all the latest commits downloading*
* now go to the home directory: `cd ~` OR `cd $HOME`
* copy `gitpull.service` file: `sudo cp gitpull.service /etc/systemd/system/`
* move `gitpull.sh` file: `sudo mv gitpull.sh /development/bahmni_config_release`
* change directory `cd /development/bahmni_config_release/` make the script executable `sudo chmod +x gitpull.sh` and `sudo chown openmrs:openmrs gitpull.sh`
* check the contents of the script with  `cat gitpull.sh` to make sure that it does `git fetch --all` and `git pull origin master`
* Nagivate into `/etc/systemd/system/` and type the following commands to register gitpull service in system
   * `sudo chmod 664 gitpull.service`
   * `sudo systemctl daemon-reload`
   * `sudo systemctl enable gitpull.service` 
   
   ** Note:when the service has been registered successfully you should see created sym link in ** `/etc/systemd/system/default.target.wants/.`


##### 3. Configuring **cronjob** & Restoring database
* configure the cronjob to trigger the service Monday 9 am
* to edit the cronjob do: `sudo crontab -e` if it's first time running the this command it'll probably ask you to choose the default text editor, please be kind enough to choose Nano as it's the easiest editor formost administrators.
* configure the script to run within 2 mins just to make sure everything is running OK: 

    
        */2 * * * * systemctl restart gitpull.service >> /var/log/gitpull.log2>&1


* inside the crontab editor write: `* 7 * * mon systemctl restart gitpull.service >> /var/log/gitpull.log2>&1`
* Go to /development/bahmni_config_release/ and check the status of cron service to see when it has executed gitpull. service, once done check the file by typing ll or ls. For some reason you may find that the service has not pulled the files from our remote repository, first thing to do is to check the status of the service if it has successfully started. If not check the status code of the service to guide you what might went wrong. The following table shows possible exit codes of the systemd service. Another possible reason it could be that you forgot to change the ownership of the development bahmni config release, check it.

     | **EXIT CODE**        | **SYMBOLIC NAME**           | **DESCRIPTION**  |
     | ------------- |:-------------:| -----:|
     | 0      | EXIT_SUCCESS | Generic success code |
     | 1      | EXIT_FAILURE      |   Generic failure or unspecified error(try to start the development/bahmni_config_release afresh directory ) |
     | 200 | EXIT_CHDIR      |    Changing to the requested working directory failed |
     | 208 | EXIT_STDIN      |    Failed to setup standard input |
     | 209 | EXIT_STDOUT      |    Failed to set up standard out |
     | 203 | EXIT_EXEC      |    The actual process execution failed. Most likely this is caused by a missing or non-accessible executable file |


* Another possible reason could be that the service in unable to fetch from remote repository which is not related to systemd service,  check the logs of the service by typing `sudo tail -f /var/log/gitpull.log`

* If gitpull service has pulled the bahmni config file then make a permanent configuration in cronjob to trigger the service *every Monday 9am*.
* inside the crontab editor write: `* 7 * * mon systemctl restart gitpull.service >> /var/log/gitpull.log2>&1`
* Now it's time to create a new container from the image we created earlier with: `docker run -e container_name=openmrseregister -it -d --restart always -p 443:443 -p 80:80 -p 8069:8069 -p 8000:8000 --privileged --name openmrseregister -v /development/bahmni_config_release:/development/bahmni_config_release -v openmrseregister:/openmrseregister omrsregrepo/bahmni_base:19052020 /bin/bash`
* After the command above you should see a container called openmrseregister running
* If the container has started successfully there is no need to restore database just copy all .sql files to container root `./` and `symbolic_creation.sh` to `/opt/openmrs` into the new running container docker cp latestbackup.sql openmrseregister:/
* To get into the container do: `docker exec -it openmrseregister bash`
* Change directory to `/development/bahmni_config` to check if the volume was created when starting a new container. You should see the bahmni config release files.
* Go to `/var/www/` and run: `sudo rm bahmni_config` or `unlink bahmni_config`
* Type `sudo ln –s /development/bahmni_config_release/ bahmni_config`
* Go to `/opt/openmrs/` and make symbolic_creation executable and run it
* Start MySQL service: `service mysqld start`
* Restore all sql copied sql files `visit_type.sql`,`patient_identifier.sql`,`openmrs_global_property.sql` and `serial object.sql`
* Start other services `openmrs`,`httpd` and `bahmni-reports`
* Browse to `http://IP_of_eRegister/bahmni/home` and check if the changes have been effected.


##### The video below is an attempt to demonstrate the steps above:

[![asciicast](https://asciinema.org/a/334423.svg)](https://asciinema.org/a/334423)