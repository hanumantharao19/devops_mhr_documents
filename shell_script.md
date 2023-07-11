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










