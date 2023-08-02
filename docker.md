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

## Below command is used to build the docker image
------------------------------------------
- docker build -t sephttpd .

- docker build -t hanumantharao1986/saleshttp:v1 . 

- docker login http:www.example.com

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


