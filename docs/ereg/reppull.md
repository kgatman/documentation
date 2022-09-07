## Automated Pulling of Latest Changes from GitHub Repo

* Get into the container by running `docker exec -it openmrseregister bash`. In the container, you'll land in `/` directory
* If it's not already there, create a folder in the root `/` directory with the following command:

     `mkdir -p scripts`

      NB: you don't need to do `sudo` because we're already logged into the container as `root`

* Change directory into the `scripts` folder with `cd /scripts`
* Do `pwd` to make sure you're in `/scripts` folder
* Download the `git_sync_branch.sh` script by running `wget https://raw.githubusercontent.com/eRegister/scripts/master/git_sync_branch.sh`
* When you run `ls` you should now see the script. 
* Make the script executable by running `chmod +x git_sync_branch.sh`
* You can test that the script is running fine by doing `bash -v git_sync_branch.sh`
* Now let's exit the container with `Exit`
* Now that you're outside the containder, change directory to `/usr/local/bin/`
* In the `/usr/local/bin/` directory create a new file with sudo `touch remote_git_sync_branch.sh`
* Open the `remote_git_sync_branch.sh` file with `sudo vi remote_git_sync_branch.sh` 
* Add the following lines in `remote_git_sync_branch.sh`
      
      #!/usr/bin/env bash
      docker exec -i openmrseregister sh /scripts/git_sync_branch.sh

* Configure a cronjob to run the script everyday at 10:00am or anytime suiting, based on the facility's needs
    * `crontab -e` if it's the first that command is bieng run, it'll probably prompt you to choose your preferred editor. I recommend nano because of its shallow learning curve. 
    * Then add this line: `0 10 * * * /usr/local/bin/remote_git_sync_branch.sh`
* Then lastly add a service to handle running this script
    * Change directory to `/etc/systemd/system/`
    * Create the file with `sudo touch git_sync_branch.service`
    * Open the file with `sudo vi git_sync_branch.service`
    * Add the following inside the `git_sync_branch.service` file
      
        `[Unit]`

        `After=docker.service`

        `[Service]`

        `ExecStart=/usr/local/bin/remote_git_sync_branch.sh`

        `Restart=always`

        `[Install]`

        `WantedBy=default.target`