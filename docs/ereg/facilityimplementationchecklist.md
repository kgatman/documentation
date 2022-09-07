# Facility Implementation Checklist

Below is a checklist of things that should be done and how to do them during rollout:

1. Disable server laptop lid to hibernate/shutdown when lid is closed. This is done to protect the laptop's monitor and keyboard from dust and potential damage.

    * edit the file `/etc/systemd/logind.conf` and change the line `#HandleLidSwitch=hibernate` to `HandleLidSwitch=ignore`. Don't forget to uncomment the line by removing `#`

2. Configure automated reporting to DHIS2 (Training Instance)
    
    * ...CONTENT LOADING....

3. Configure Services to Start When the Server Boots
 
    * ...CONTENT LOADING....

4. Configure static IP address
    
    * ...CONTENT LOADING....

5. Changing the login name of eRegister

    ssh in to the server with `ssh openmrs@IPADDRESS` and then get into the running container with `sudo docker exec -it openmrseregister bash` then `vi /var/www/bahmniapps/i18n/home/locale_en.json` and then look for `LOGIN_PAGE_HEADER_TEXT` variable and change it accordingly.

6. Create usernames for all health facility staff

    * browse to IPADDRESS/openmrs and login
    * when logged in, go to Administration -> Manage Users -> Add User. Don't forget to search for the user's account before adding a new user account
    * check on appropriate roles

7. Enabled appropriate "locations" for login into the system

    *  ssh in to the server with `ssh openmrs@IPADDRESS` and then get into the running container with `sudo docker exec -it openmrseregister bash` then `vi /var/www/bahmniapps/i18n/home/locale_en.json` and then `mysql -u root -p` enter password when prompted, then `use openmrs` and then run this query to see all location for your site. For example if you're in Lithipeng Health Center you can run `select location_id, name, description, retired from location where description like '%lithipeng%'`  and then you'll something like this:

    +---------------+-----------------+--------------+------------+  
    |   location_id | name            | description  |    retired |  
    +---------------+-----------------+--------------+------------+  
    |           554 | Lithipeng HC    | Lithipeng HC |          1 |  
    |           555 | ART/TB Clinic   | Lithipeng HC |          1 |  
    |           556 | MCH Clinic      | Lithipeng HC |          1 |  
    |           557 | HTS General OPD | Lithipeng HC |          1 |  
    +---------------+-----------------+--------------+------------+  
    
    4 rows in set (0.00 sec)
    
    Then update retired to be 0 with `update set location retired=0 where location_id=554 AND location_id=555 AND location_id=556 AND location_id=557;`

    NB: Creation of locations is managed centrally and your role is just to enable/disable locations so that we mantain identical schemas of the database across all health facilities in the country. This will help in making Health Information Exchange easy. 

8. Automated Backups
    
    *  ...CONTENT LOADING....

9. Blocking The Following Social Media Sites on the Wi-Fi router:

    * whatsapp.com
    * facebook.com
    * youtube.com
    * instagram.com
    * tiktok.com
    * twitter.com
    Browse to http://192.168.8.1 and login, then go to Settings -> Security -> Domain Name Filter, make sure the Blacklist radio button is selected, then Add the domains. Don't forget to change status to "on". 
    
    NB: Make sure "Enable Domain Name Filter" is enabled in here Settings -> Firewall Switch

    