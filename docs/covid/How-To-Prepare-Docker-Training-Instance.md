!!!note
    we chose Docker over other many ways of installing DHIS2 because in a few minutes you can have your instance up and running


#### Installing Docker on the host server

Please refer to this [link](../ereg/intro.md) for installing Docker

#### Installling Docker Compose

* To install Docker Compose, please refer to the official Docker Compose site [here](https://www.docker.com)
* To prepare the training instance, we used two images:
    * `dhis2 core 2.33`
    * `dmillon/postgis` (_recommended because it already has postgis which DHIS2 depends on to render maps_)

#### Downloading the images

    ```
    paste contents of docker-compose.yml

    ```

_you can change to whichever image you want to use. But please remember to drop SQL views before creating your dump_

You can go ahead and read [this](#) to prepare your instance. Within a few minutes you should by now have your DHIS2 instance running.

!!!warning
    use `postgres` as your user for the db. It poses security threats (yes) but it's easier to deal with PostgreSQL with that setup. Unless ofcourse you're a PostgreSQL ninja.


#### Restoring Postgres Database

As you saw from the previous step, your instance is running two containers with networking between them handled by Docker Compose.
If you have a live connection to Postgres database, you can't drop and restore your db. 

* Do `docker ps` to see all of the running containers. `docker-compose ps` also works fine. 
    * _it's important to do this step first because docker-compose is going to name according to how you named the folder containing the docker-compose.yml as well as how you labeled them **inside** the file_
* To do that, you have to kill the frontend DHIS2 container then restore the DB with `docker container kill <name_of_dhis_container>`
* Copy DB backup file into Postgres container with `docker cp dhis_db_backup.sql <name_of_postgres_container>:/`
* Get into the container with `docker exec -it <name_of_postgres_container> bash`
* Switch account from `root` to `postgres` with `su postgres` and then launch the PostgreSQL interactive terminal with `psql`
* `\l` to list all of the databases
* `drop database dhis2;` to delete the database
* `create database dhis2` to recreate the database. But now it's empty
* `\q` to the interactive terminal
* `psql --username=postgres --dbname=dhis2 < dhis_db_backup.sql` to restore all of data into the empty database. _if the command ran succefully, you should see a trail of verbosely listed SQL commands processed_
* Then the trail is done, do `exit` to exit the container
* Finally, start the container that we "killed" with `docker container start <name_of_dhis_container>`
