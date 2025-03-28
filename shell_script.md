shell scripts

shell scripts are used to automate the regular tasks or repeted task
shell script executed commands in sequence which are mentioned in shell
script
usually all scripts files end .sh for esay identification
Every shell script start with #!/bin/bash(shebang shell) line

## script1
------
```
#!/bin/bash
  pwd
  ls
  ls -lrt | wc -l
  mkdir hanu
```
## script2
-----
#!/bin/bash
```date
mkdir ramesh
cd ramesh
touch text{1..100}.txt
```

## script3( how to install httpd we server with shell script)
```
#!/bin/bash
yum install net-tools -y
yum install httpd -y
systemctl start httpd
systemctl status httpd
systemctl enable httpd
cd /var/www/html
echo "this is hanu from guntur" > index.html
```
## script4) how to take the inputs from the user while executing the script
```
#!/bin/bash
name=ramana
surname=medikonda
echo "my name is $name"
echo "$name going to hyd"
echo " company is giving promotion to $name" > $name.txt
```
## script5)how to store the values in the variables
```
#!/bin/bash
echo "please provide your name"
read name
echo "$name directory going to create"
mkdir $name
```
## script6 (write script to prinit the system variables)
```
#!/bin/bash
echo my shell name is $BASH
echo my shell version name is $BASH_VERSION
echo present working directory is $PWD
echo my home directory is $HOME
```
## script7 (Add two numbers)
```
#!/bin/bash

num1=20
num2=30

result=$((num1+num2))
echo $result

result2=$( expr $num1 + $num2 )
echo $result2
```
## script 8(find the which greater)
```
#!/bin/bash
a=50
b=40
if [ $a -gt $b ]
  then
	  echo " number a is greter than number b"
  else
	  echo " number a is less then number b"
fi
```
## Script9(print 1 to 10 numbers) 
```
#!/bin/bash
for x in {1..10}
do
        echo "my number is $x"

done
```
or

```
#/bin/bash
for (( i=0; i>=10; i-- ))
do
   echo "my numbers $i"
done
```
## Script 10 (print numbers form 10 to 1)
```
#/bin/bash
for (( i=10; i>=0; i-- ))
do
   echo "my numbers $i"
done
```
# Script 11 (print names with loop)
```
#!/bin/bash
 names=" hanu mali suresh mahesh ravi haswi"
 for name in ${names};
 do
  echo "my name is ${name}
 done
```
# Script 12 pull the images form one registry and push to other registry 
```
#!/bin/bash
 images=" httpd nginx mysql openjdk"
 repo="hanumantharao1986"
 for img in ${images};
 do
  echo " image name is ${img}
  docker pull ${img}
  docker tag ${img} ${repo}/${img}
  docker push ${repo}/${img}
 done
```
## 13 to check httpd service is running or not if not running then it start the service
```
#!/bin/bash
service=httpd
status=$(systemctl is-active $service)

if [ $status == active ]

  then

    echo " $service  is up and running"
else
   echo " $service is not up and running  so we are starting service"

   systemctl start $service

   if [ "$(systemctl is-active $service)" == "active" ]
    then

     echo " $service has been successfully started"

   else
     echo " $service is not starting please check $service logs"
   fi

fi
```

# script 14 Start and stop the ec2 instances with shell script
```
InstanceID=$1
State=$2
if [ "$State" = "Start" ]
then
  aws ec2 start-instances --instance-ids $InstanceID
  echo Instance $InstanceID Started
elif [ "$State" = "Stop" ]
then
  aws ec2 stop-instances --instance-ids $InstanceID
  echo Instance $InstanceID Stopped
fi

```
## Script 15 upload the files in to s3 bucket

#!/bin/bash

BUCKET_NAME="your-bucket-name"
DIRECTORY="your-directory"

for FILE in $DIRECTORY/*
do
  aws s3 cp $FILE s3://$BUCKET_NAME/
done


```
#!/bin/bash

# Threshold percentage for disk usage (e.g., 80%)
THRESHOLD=80

# Email address to send alerts
ALERT_EMAIL="admin@example.com"

# List of directories to monitor
DIRECTORIES=("/home" "/var" "/opt" "/tmp")

# Loop through each directory
for DIR in "${DIRECTORIES[@]}"; do
  # Get the disk usage of the directory (in percentage)
  USAGE=$(df -h "$DIR" | grep -vE '^Filesystem' | awk '{ print $5 }' | sed 's/%//')

  # Check if the usage exceeds the threshold
  if [ "$USAGE" -ge "$THRESHOLD" ]; then
    # Print alert to console
    echo "ALERT: $DIR is $USAGE% full."

    # Send email alert (uncomment the line below to activate)
    # echo "$DIR has reached $USAGE% usage." | mail -s "Disk Space Alert: $DIR" $ALERT_EMAIL
  else
    # Print normal message to console
    echo "$DIR is $USAGE% full. No alert needed."
  fi
done
```

## check instances id and start and stop ec2 instances with functions
```
# /usr/bin/bash
 
set -e  # set -e stops the execution of a script if a command or pipeline has an error
 
id=$1   # Provide the instance ID with the name of the script
 
# Checking if Instance ID provided is correct 
 
function check_ec2_instance_id () {
     
    if echo "$1" | grep -E '^i-[a-zA-Z0-9]{8,}' > /dev/null; then
           echo "Correct Instance ID provided , thank you"
           return 0
    else
          echo "Opps !! Incorrect Instance ID provided !!"
          return 1
    fi
}
 
# Function to Start the instance 
 
function ec2_start_instance ()   {
     aws ec2 start-instances --instance-ids $1
}
 
# Function to Stop the instance 
 
function ec2_stop_instance ()   {
     aws ec2 stop-instances --instance-ids $1 
}
 
# Function to Check the Status of the instance
 
function ec2_check_status ()   {
     aws ec2 describe-instances --instance-ids $1 --query "Reservations[].Instances[].State.Name" --output text
}
 
# Main Function 
 
function main ()  {
     check_ec2_instance_id $1                # First it checks the Instance ID
     echo " Instance ID provided is $1"  # Prints the message
     echo "Checking the status of $1"    # Prints the message
     ec2_check_status $1
                 # Checks the Status of Instance
    
     status=$(ec2_check_status $id)     # It stores the status of Instance
     if [ "$status" = "running" ]; then    
         echo "I am stopping the instance now"
         ec2_stop_instance $1
         echo "Instance has been stopped successfully"
     else
         echo "I am starting the instance now"
         ec2_start_instance $1
         echo "Instance has been Started successfully"
     fi
 
}
 
main $1                                 # Actual Script starts from main function
```
## start and stop the ec2 instances and check instance status
```
#!/bin/sh

function usage() {
  echo "$0 (start|stop|status)"
}

if [ $# -ne 1 ]; then
  usage
  exit 2
fi

DEBUG="echo "
DEBUG=""

INSTANCE_ID=i-XXXXXXXX
REGION=XXXXXXXX

INSTANCE_STS=`aws ec2 describe-instance-status --region $REGION --instance-ids $INSTANCE_ID | jq -r '.InstanceStatuses[].InstanceState.Name'`

echo "InstanceStatus : [$INSTANCE_STS]"

EXIT=0
if [ "$1" = "start" ]; then
  if [ "$INSTANCE_STS" = "running" ]; then
    echo "instance is already running."
  else
    echo "start instance..."
    $DEBUG aws ec2 start-instances --instance-ids $INSTANCE_ID --region $REGION
    EXIT=$?
  fi
elif [ "$1" = "stop" ]; then
  if [ "$INSTANCE_STS" = "running" ]; then
    echo "stop instance..."
    $DEBUG aws ec2 stop-instances --instance-ids $INSTANCE_ID --region $REGION
    EXIT=$?
  else
    echo "instance is already stopped."
  fi
elif [ "$1" = "status" ]; then
  echo "Status Check only."
else
  usage
  EXIT=2
fi

exit $EXIT
```
## To Start And stop ec2 instances with shell scripts

```
## upload files into the bucket
```

```
## upload the files into bucket and through error if upload is not successfull
```
BUCKET_NAME="your-bucket-name"
FILE_NAME="your-file-name"

aws s3 cp $FILE_NAME s3://$BUCKET_NAME/

if [ $? -eq 0 ]
then
  echo "File uploaded successfully."
else
  echo "File upload failed."
fi
```
## start and stop the httpd server
```
#!/bin/bash
action=$1
if [ "$action" == "start" ]
then
        systemctl $action httpd
else
        systemctl $action httpd
fi

```
## create mutiple directories
```
#!/bin/bash
for name in " hanu mahi ramesh"
do
        mkdir $name
done

```


























