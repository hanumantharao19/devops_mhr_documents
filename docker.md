## Install docker in centos or Redhat
------
step1)create ec2 instance with redhat or centos operating system

step2)
- #yum update
- #yum install yum-utils device-mapper-persistent-data lvm2
- #yum-config-manager --add-repo      https://download.docker.com/linux/centos/docker-ce.repo
- #yum install docker-ce
- #systemctl start docker
- #systemctl enable docker
- #systemctl status docker
- #docker –version


## docker commands
1. how to search a docker image in hub.docker.com
```sh
docker search httpd
```
2. Download a docker image from hub.docker.com
```sh
docker image pull <image_name>:<image_version/tag>
```

3. List out docker images from your local system
```sh
docker image ls
```

4. Create/run/start a docker container from image
```sh
docker run -d --name <container_Name> <image_name>:<image_version/tag>

d - run your container in back ground (detached)
```

5. Expose your application to host server
```sh
docker run -d  -p <host_port>:<container_port> --name <container_Name> <image_name>:<Image_version/tag>

docker run -d --name httpd_server -p 8080:80 httpd:2.2
```

6. List out running containers
```sh
docker ps
```

7. List out all docker container (running, stpooed, terminated, etc...)
```sh
docker ps -a
```

8. run a OS based container which interactive mode (nothing but login to container after it is up and running)

```sh
docker run -i -t --name centos_server centos:latest
i - interactive
t - Terminal
```

9. Stop a container 
```sh
docker stop <container_id>
```

10. Start a container which is in stopped or exit state

```sh
docker start <container_id>
```
11. Remove a container

```sh
docker rm <container_id>
```

12. login to a docker container
```sh
docker exec -it <container_Name> /bin/bash
```
- docker search httpd --->search httpd image in docker hub
- docker pull httpd    --> pull the docker httpd image from docker hub
- docker images  --> list images
- docker run -d httpd  --> run the docker httpd  image as container in back ground
- docker ps ---> list the only running containers
- docker ps -a --->list the running and exit containers as well
- docker stop <containerid>  --> to stop the container
- docker start containerid   ---> to start the contaier
- docker rm containerid  --> to remove container which is in stop state
- docker rm -f contianer  --->  we can remove running contaienr as well
- docker rmi imagename  --> toremove the iamge
- docker run --name <contianername> -d httpd  --> create container with name which we want
- docker exec -it contianerid /bin/bash
- docker run -d -p 80:80 httpd  --> to access application through browser with Host Ip with 80 port
- docker run -d -p 90:80 httpd  --> to access application through browser with Host Ip with 90 port


# Build the image and push to the docker repo
- docker build -t hanu_httpd .
- docker tag hanu_httpd  hanumantharao1986/hanu_httpd
or 
- docker build -t hanumantharao1986/hanu_httpd
- docker login  # to login the docker hub while login it as your user name and password of docker hub
- docker push hanumantharao1986/hanu_httpd

## Doker file for  buils the httpd image
```
FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd","-D", "FOREGROUND"]
```


