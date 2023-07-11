shell scripts

shell scripts are used to automate the regular tasks or repeted task
shell script executed commands in sequence which are mentioned in shell
script
usually all scripts files end .sh for esay identification
Every shell script start with #!/bin/bash(shebang shell) line

script1
------
#!/bin/bash
 pwd
 ls
 ls -lrt | wc -l
 mkdir hanu


script2
-----
#!/bin/bash
date
mkdir ramesh
cd ramesh
touch text{1..100}.txt

script3( how to install httpd we server with shell script)
-----

#!/bin/bash
yum install net-tools -y
yum install httpd -y
systemctl start httpd
systemctl status httpd
systemctl enable httpd
cd /var/www/html
echo "this is hanu from guntur" > index.html


------------
script4) how to take the inputs from the user while executing the script

#!/bin/bash
echo "please provide your name"
read name
echo "$name directory going to create"
mkdir $name


script5)how to store the values in the variables

#!/bin/bash
name=ramana
surname=medikonda
echo "my name is $name"
echo "$name going to hyd"
echo " company is giving promotion to $name" > $name.txt









