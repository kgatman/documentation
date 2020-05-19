# Automated Deployment

!!! warning
    * Please make sure that **no one** is using the system 
    * Backup your database before doing any of these steps.


### Our automated deployment comprises 5 steps:

1. **Preparatory Steps**
    * First check to see if your sever has internet connectivity with `ping github.com`
    * Then transfer all of the script files to the server using with `scp`, `pscp` or FileZilla *(whatever works for you)*
    * Files that need to be transfered are:
        * `gitpull.service`
        * `gitpull.sh`,`openmrs_global_properties`
        * `serialized objects`
        * `symbolic_creation.sh`
        * `visit_types.sql`

        !!! note
            all of the scrips mentioned abover are in [here](https://github.com/eRegister/docs/tree/master/docs/ereg)


    * After successfully copying these files to the server, ssh into the server with `ssh openmrs@IP_ADDRESS_SERVER`
    * Backup facility specific configurations: 
        * copy those config files from the running container into the hosting server with: `docker cp openmrseregister:/var/wwww/bahmni_config/openmrs/apps/home/whiteLabel.json .` **<- don't forget that dot**
        *  if you haven't already, backup your database with invoking the script that does that, that is already in your server.
    * Create backup and copy backup from container to host

!!! caution
    **PLEASE ENSURE THAT YOU HAVE BACKED UP BOTH  THE DB AND CONFIG FILES BEFORE EXECUTING THE STEPS BELOW!!!**

2. **Removing Current Container**
    * check the running container: `docker ps`
    * Stop the container: `docker stop openmrseregister`
    * Check that the container has stopped: `docker ps` and `docker ps -a`
    * Create a new Image from the stopped container: `docker commit openmrseregister omrsregrepo/bahmni_base:19052020` [*tag should be date at time of creating image*]
        * *you can check the newly created image with* `docker images` 
    * Remove the container

3. **Creating a Volume**
    * create development directory `sudo mkdir -p /development/bahmni_config_release`
    * change ownership of the new folder from `root` to `openmrs` with `sudo chown -R openmrs:openmrs /development` becuase the service is managed by openmrs user 
    * get into the directory with `cd /development/bahmni_config_release`
    * configure gitpull services

        !!! note
            **DO NOT** use `git clone`

        * initialise new local git repo: `git init`
        * connect local repository with remote: `git remote add origin https://github.com/eRegister/bahmni_config_release.git`
        * download the latest commits to the repo: `git fetch --all` *you should see a log of all the latest commits downloading*
    * now go to the home directory: `cd ~`
    * move `gitpull.service` file: `sudo mv gitpull.service /etc/systemd/system/`
    * move `gitpull.sh` file: `sudo mv gitpull.sh /development/bahmni_config_release`
    * change directory `cd /development/bahmni_config_release/` make the script executable `sudo chmod +x gitpull.sh` and `sudo chown openmrs:openmrs gitpull.sh`
    * check the contents of the script with  `cat gitpull.sh` to make sure that it does `git fetch all` and `git pull origin master` 
    * also check that the service is running with `systemctl status gitpull.service`

4. **Configuring `cronjob` & Restoring database**
    * configure the cronjob to trigger the service Monday 9 am
        * to edit the cronjob do: `sudo crontab -e` if it's first time running the this command it'll probably ask you to choose the default text editor, please be kind enough to choose Nano as it's the easiest editor formost administrators.
        * inside the crontab editor write: `* 7 * * mon systemctl restart gitpull.service >> /var/log/gitpull.log2>&1`
        * to check logs of the service above you can go `sudo tail -f /var/log/gitpull.log`
    * Now it's time to create a new container from the image we created earlier with: `docker run -e container_name=openmrseregister -it -d --restart always -p 443:443 -p 80:80 -p 8069:8069 -p 8000:8000 --privileged --name openmrseregister -v /development/bahmni_config_release:/development/bahmni_config_release -v openmrseregister:/openmrseregister omrsregrepo/bahmni_base:19052020 /bin/bash`
    * after the command above you should see a container called `openmrseregister` running. To get into the container do: `docker exec -it openmrseregister bash`
    * create the following symbolic links: 
        * `ln -s /var/www/bahmni_config /development/bahmni_config_release`
        * `ln -s /opt/openmrs/bahmni_config /development/bahmni_config_release` OR
        * Copy symbolic_creation.sh to /opt/openmrs/ and run it to create symbolic links
    * The last step is to restore db and the facility specific configs
        * Copy and  restore all .sql file and restart services
5. Browse to `http://IP_of_eRegister/bahmni/home` and check if the changes have been effected.

