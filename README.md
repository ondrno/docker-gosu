![Docker Image CI](https://github.com/ondrno/docker-gosu/actions/workflows/docker-image.yml/badge.svg)
----

# docker-gosu
## Introduction
This container is based on the work of [Deni Bertovic](https://denibertovic.com/) and Tianon Gravi's [gosu](https://github.com/tianon/gosu)
It tries to address the hassles which can occur when a docker container running under a certain user id writes on a docker volume which is mounted with a differend user id.

Deni Bertovic has describes the problem and the solution in his blog post [Handling permissions with docker volumes](https://denibertovic.com/posts/handling-permissions-with-docker-volumes/)

## How it works

## How to use
The container alone is of little use. It should be used as base for other 
docker containers.

1) create your own Dockerfile
``
FROM ondrno/gosu
CMD ["/bin/bash"]
``

2) build a ``passuid`` container 
``ondrno@zephyr:~$ docker build -t passuid .``

3) run it 
``ondrno@zephyr:~$ docker run -it passuid
Starting with UID : 9001
user@8b9d02c5f006:/$ id
uid=9001(user) gid=9001(user) groups=9001(user)
 
4) run it with passing in your user id
``ondrno@zephyr:~$ docker run -it -e LOCAL_USER_ID=`id -u $USER` passuid
Starting with UID : 1000
user@8b9d02c5f006:/$ id
uid=1000(user) gid=1000(user) groups=1000(user)
 
