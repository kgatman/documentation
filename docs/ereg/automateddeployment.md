# Automated Deployment

!!! warning
    * Please make sure that **no one** is using the system 
    * Backup your database before doing any of these steps.


### Our automated deployment comprises 5 steps:

* **Preparatory Steps**
    * First check to see if your server has internet connectivity with `ping github.com`
    * SSH into the server with `ssh openmrs@_SERVER_IP_ADDRESS` 
    * Then download all of the files need with `git clone https://github.com/eRegister/docs.git `
    * The command above will create a folder called `docs` in `/home/openmrs` if you didn't change to another directory. All of files that need to be transfered to the server are in docs/scripts:
        * `gitpull.service`
        * `gitpull.sh`,`openmrs_global_properties`
        * `serialized objects`
        * `symbolic_creation.sh`
        * `visit_types.sql`
        !!! note
            we started by ssh'ng into the server so the files are already in the server


    * Backup facility specific configurations and configurations: 
        * copy those config files from the running container into the hosting server with: `docker cp openmrseregister:/var/wwww/bahmni_config/openmrs/apps/home/whiteLabel.json .` **<- don't forget that dot**
        *  if you haven't already, backup your database with invoking the script that does that, that is already in your server: `docker exec -i openmrseregister /usr/bin/mysqldump -u root --password=password -A > $HOME/latestback.sql` _the -A tag is going to backup everything_
        * do `ls -lh` to see the size of `latestback.sq` it should be 200MB or more, not less.

!!! caution
    **PLEASE ENSURE THAT YOU HAVE BACKED UP BOTH  THE DB AND CONFIG FILES BEFORE EXECUTING THE STEPS BELOW!!!**

2. **Removing Current Container**
    * check the running container: `docker ps`
    * Stop the container: `docker stop openmrseregister`
    * Check that the container has stopped run `docker ps` and you should see an empty table
    * Create a new image from the stopped container: `docker commit openmrseregister omrsregrepo/bahmni_base:19052020` [*tag should be date at time of creating image*]
        * *you can check the newly created image with* `docker images` 
    * Remove the container: `docker container rm openmrseregister`

3. **Creating a Volume**
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
    * also check that the service is running with `systemctl status gitpull.service`

4. **Configuring `cronjob` & Restoring database**
    * configure the cronjob to trigger the service Monday 9 am
        * to edit the cronjob do: `sudo crontab -e` if it's first time running the this command it'll probably ask you to choose the default text editor, please be kind enough to choose Nano as it's the easiest editor formost administrators.
        * configure the script to run within 2 mins just to make sure everything is running OK: 
        ```bash
        */2 * * * * systemctl restart gitpull.service >> /var/log/gitpull.log2>&1
        ```
        * inside the crontab editor write: `* 7 * * mon systemctl restart gitpull.service >> /var/log/gitpull.log2>&1`
        * do `systemctl status cron.service` to check that the service that will run the cronjob is running
        * to check logs of the service above you can go `sudo tail -f /var/log/gitpull.log`
    * Now it's time to create a new container from the image we created earlier with: `docker run -e container_name=openmrseregister -it -d --restart always -p 443:443 -p 80:80 -p 8069:8069 -p 8000:8000 --privileged --name openmrseregister -v /development/bahmni_config_release:/development/bahmni_config_release -v openmrseregister:/openmrseregister omrsregrepo/bahmni_base:19052020 /bin/bash`
    * after the command above you should see a container called `openmrseregister` running. 
    * copy the backup into the new running container `docker cp latestbackup.sql openmrseregister:/`
    * copy the script to create all symbolic links `docker cp docs/docs/scripts/symbolic_creation.sh openmrseregister:/`
    * To get into the container do: `docker exec -it openmrseregister bash`
    * start MySQL service: `service mysqld start`
    * get into MySQL client: `mysql -u root -p`
    * restore the backup: `source latestbackup.sql`
    * create the following symbolic links: 
        * start by manually creating this symlink: `ln -s /var/www/bahmni_config  /development/bahmni_config_release/`
        * make sure you're in `/` directory and `run bash ./symbolic_creation.sh`
5. Browse to `http://IP_of_eRegister/bahmni/home` and check if the changes have been effected.

