- $ --> noramal user
- # root user --> root used can be used to peroform all actions
- sudo su - or sudo -i  # it used to used to switch form normal user to root user
- pwd # present working directory
- cd  # it is used to change the directory
- cd .. # it is used to go back to the directory
- cd ../../.. # is is used to go back to the three directories
- cd ~  # it used to swith to home directory of the user
## Following ways we are using to create file
## - 1) cat 
       cat is used to read the file and create and oppendn the files
       cat > filename
        write text
        ctrl+d
       cat >> filename   # to  openthe file
   - 2) vi or vim
       vim filename
       :wq!
   - 3) echo 
       echo "this is hanu" > filename
   - 4) touch 
       touch file
      Note: touch is used to create the empty file and update the timestamp of the file
- rm   # it used to remove the file with asking user permission
- rm -rf # it is used to remove the file with out asking user permission
- rm -rf *   # it used to remove the all files and directories in the present working directory

## create directories and remove the directories

- mkdir direcotry  # create a dirctory
- mkdir -p hanu/hanu1/hanu2/hanu3  # it used to create directory and sub directories
- rmdir directory  # to remvoe the empty directory
- rm -rf directory # to remvoe the dorectory which has some files and sub directories

## copy and move the files and directories form one place to other place
- cp sourcepath destinationpath  # to copy the files form one place to other palce
  Ex: cp /root/mhr.txt /opt
- cp -r  sourcepath destinationpath   # to copy directories form one place to other palce
- cp -r hanu /tmp
  or
  cp -r /root/hanu /opt
  or
  cp -r /root/hanu .

---
- mv hanu /tmp
  or
  mv /root/hanu /opt
  or
  mv /root/hanu .

## file permissions and directory permission
- r -4
- w -2
- x -1
 
  ```
   -rw-   r--    r--. 1    root   root    0 May 27 06:12 mhr.txt
  owner  group  others    owner  group 
  420    400    400
   6      4      4 
  ```


- drwx   r-x    r-x. 2     root root 57 May 28 05:13 hanu
  owner  group   others     owner  group 
  421    401     401
   7     5       5
- 644 # default permission for the file
- 755 # default permission for the directory
- chmod  --> it is used to change the file permissions
- chown  ---> it is used to change the owner of file

 ## How to add execution permission to the file
- -rw-  r--  r--. 1 root root 0 May 27 06:06 mhr.txt
  chmod +x mhr.txt
## How to add only write  permission to the file
- chmod +w mhr.txt

## How to remove execution and write  permission to the file
- -rwx  r-x r-x. 1 root root 0 May 27 06:06 mhr.txt
- chmod -x mhr.txt
- chmod +x mhr.txt
- chown username:groupname filename
  Ex; chown hanu:hanu  mhr.txt
- chown username:groupname  directory   # it used to change own of the ramesh directory only
  Ex: chown hanu:hanu  ramesh
- chown -R hanu:hanu remesh  #  it used to change own of the ramesh directory and sub directories as well

# importent linux command and thier useage
 -  yum install vim   # to install vim software
 -  yum install net-tools # to install net-tools for getting access network related commands
 -  yum list httpd  # it is used to know httpd is installed or not
 -  yum install httpd # it is used to install httpd 
 -  yum remove httpd # it is used to remove the httpd package
 -  systemctl start httpd  # it is used to start the httpd service
 -  systemctl status httpd  # it is used to know the status of the httpd
 -  systemctl restart httpd  # it is used to restart the httpd service
 -  /var/log/httpd/  # it is default location to store the httpd logs
 -  /var/www/html/ # it is default directory for web the server
 -  tail -5 access_log  # it used to list the last five line of the access_log
 -  tail -f access_log  # it is used to check the running logs
 -  ps -aux  # to list the all process in the server
 -  ps -ef | grep httpd  # it is used to find the process id of the httpd service
 -  kill -9 processid  # it is used to kill the process
 -  netstat -ntlp  # it used to know the what are the ports are running the server



