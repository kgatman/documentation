# Working with Docker Images Locally

## Committing a Container locally
Alternatively, we can package all of the changes done on a running container locally by like so:
* First verify the name of your running container with `docker ps` and then,
* Commit all of the changes in a running container with `docker commit d76b19479a2f omrsregrepo/bahmni_base:24102019` *we normally use the date of committing a container as a tag*
* `docker save bahmni_base:24102019 | gzip > bahmni_base_24102019.tar.gz`
* The newly created tarball can be shared via USB stick and loaded with `docker load < bahmni_base_24102019.tar.gz`
* You should now see your newly loaded image when do `docker images`