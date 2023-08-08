Types of ip address class
- Class A  0- 127
- Class B  128 -191
- Class C  192 -223


- 192.168.0.0 # each ip address have 32 bits
  ex: 8 +8 + 8 +8  =32

- 192.168.0.0/16
  2*32 
  2*32-2*16  = 2*16 = 65500
  - 192.168.0.0
    192.168.0.1
    192.168.0.255
  - 192.168.1.0
    192.168.1.1 
    192.168.1.255
------------
192.168.30.0/20

2*32 -2*20  = 2*12 = 4094

-----------------

192.168.20.0/24


2*32-2*24  = 2*8  = 256

-------
- 192.168.10.240/28
  192.168.10.240
  192.168.10.241
  192.168.10.242

  192.168.10.255

   2*32 - 2*28  = 2*4  =16

## VPC
- virtuval private cloud and VPC is regional resource

10.0.0.0/16  -VPC  2*32-16 = 2*16 --65500

10.0.0.0/24   --VPC 2*32 -24 = 2*8  --256

## Subnets
we can create subnets in VPC

192.168.0.0/16  --2*16 =65000 

we can divide the vpc's in differet subnets

192.168.20.0/24  --> dev-hr-public-subnet
192.168.40.0/24   --qa-hr-subnet

Note : every subnet should associate with one zone

## steps to create application Load Balancer
- step1)  create ec2 instance(hr instance) in one subnet 
and install httpd web server

Note: mention below script in user data


- step2)  create ec2 instance(sales instance) in other subnet 
and install httpd web server

#! /bin/bash
yum install httpd -y
mkdir /var/www/html/sales
systemctl start httpd
systemctl enable httpd
echo "this is sales application" > /var/www/html/sales/index.html

step3) create hr target group and register hr-instance
step4) create sales target group and register sales-instance
step5) create load balancer and add rules route the trafic bsed 
on the path

----------------------

types of instances
--------------
1)ondemand instances
on demand instances are costly as compared to other
which are usually created where ever we are required

2) reserved instances
 we are reserved instances for mutiple years like two or three years
so price is less as compared to on demand

3)spot instance
there spot are provided at very low cost but there take back any time 
there instance are genrally used for peak load
sopt instances cost is less as compared to other instances


IAM  --Identity Access Management

I  --Authentication --We can able to login
A  --Autheraization   --We can able to see the resources
Managemet  --> Management

user has two types of permission
----------------------
1) Console access
user can able to access the aws console by user name and password

2) Programatic Access
user can able to access the AWS using aws CLi,AWS SDK and api's with 
help of access key and secret key



How to connect to the ec2 to s3 by programatic access( aws CLI)
---------------------------
step1) create Ec2 isntance
step2) isntall aws cli in ec2 instance

#dnf install python3-pip  # it  need to install with root user
pip3 install awscli --upgrade --user  # should run with normal user
aws --version

step3) create a user and select programatic access while creating user
step4) Provide the required permission to users
step5) aws configure
step6) aws s3 ls --> list buckets in s3

-------------------------------

roles: roles are used to connect form one resource to other resource


How to connect to the ec2 to s3 by programatic access( aws CLI)

step1) create a role
step2) provide required access(required policy) to the role
step3) create ec2 isntance and attach roles to ec2 isntance while creating
step4)  install aws cli

#dnf install python3-pip  # it  need to install with root user
pip3 install awscli --upgrade --user  # should run with normal user
aws --version

step5) aws s3 ls  -->list the bucekts s3

-------------------------------
EBS
----
Elastic Blcok storage
data is stored in the form of block
it used to perfom read and right oprations

S3 bucket
---------
1)s3( simple storage service)
2)s3 is object orinated storge that means usually we storing objects in the s3
genrally we s3 buckets are there in s3

3)s3 bucket globally unique
4)s3 bucket is globall resource thant means files cam access globally and not regional resouce but we creating
storage buckets region wise
5)genrally we are creating 100 buckets per region more than that if we 
want we need to raise ticket for AWS support team
6) Name of the bucket should be in small letters
7) cost of the data stored in s3 is depends on the region
------------------
versioning

if we want to store same file with mutiple version then we can
for versining

------------
static web site hosting in s3 bucket

access website with index.htnl 
-->https://satic-website-ice-sep.s3.amazonaws.com/index.html

static website -->
http://satic-website-ice-sep.s3-website-us-east-1.amazonaws.com 

www.sanjay.com -->dns server---lb-- 12.0.0.0

www.sanyay.com  --s3bucket


------------

aws s3 ls ---> to list buckets
aws s3 ls s3://satic-website-ice-sep  --> list objects in the buckets
aws s3 ls s3://satic-website-ice-sep/css --> list file in the directory of s3 bcukets
aws s3 mb s3://mhr-progarmatic-access-bucket  --> create new bucket
aws s3 rb s3://mhr-progarmatic-access-bucket --->it is used to remove the bucket

aws s3 cp sepbatch.txt s3://demo-bucket-monday-mhr  --> upload
file from ec2(local) instance to s3

aws s3 cp s3://demo-bucket-monday-mhr/Linux.txt . ---> down
load the file from s3 bucket to local
aws s3 rb s3://mhr-demo-hr-project --force

-------------------

## IAM( Identitiy Access Amanagment)
 - 1)Autenticatio
 - 2) Authenrizaion


- Two types of users access
 - console access
   - it used to access aws  resources through console
 - programatic access
   - it is used to access aws resources through CLI and aws SDK
   - it is used to connect form one service(ec2) to other service (s3 ) 










































