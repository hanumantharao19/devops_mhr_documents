  ## Install nexus in AWS ec2 instance(Redhat linux)
  ## Step1) update the packages and install wget
  ```
  sudo yum update -y
  sudo yum install wget -y

  ```
  ## step2) Install Open JDK
  ```
  sudo yum install java-17-openjdk -y
  ```
  ## Step3) Create a directory named app and cd into the directory
  ```
  sudo mkdir /app && cd /app
  ```
  ## step4) Down load the latest nexus with wget command
  ```
  sudo wget -O nexus.tar.gz https://download.sonatype.com/nexus/3/latest-unix.tar.gz
  ```
  ## step5)  Extract the download nexus file
  ```
  sudo tar -xvzf nexus.tar.gz
  ```

  ## step6) rename the extract file with nexus
  ```
  sudo mv nexus-3* nexus
  ```
  ## step7) Create nexus user
  ```
  sudo useradd nexus

  ```
  ## step8) Change the ownership of nexus files and nexus data directory to nexus user
  ```
  sudo chown -R nexus:nexus /app/nexus
  sudo chown -R nexus:nexus /app/sonatype-work
  ```
  ## Step9) Open /app/nexus/bin/nexus.rc file and uncomment run_as_user parameter and set it as following
  ```
  sudo vi  /app/nexus/bin/nexus.rc
  run_as_user="nexus"
  ```
  ## step10) update -Xms vlaue to 1024m and -Xmx vlaue to 1024m in the below file
  ```
sudo vi /app/nexus/bin/nexus.vmoptions
-Xms1024m
-Xmx1024m
-XX:MaxDirectMemorySize=2703m
-XX:+UnlockDiagnosticVMOptions
-XX:+UnsyncloadClass
-XX:+LogVMOutput
-XX:LogFile=../sonatype-work/nexus3/log/jvm.log
-XX:-OmitStackTraceInFastThrow
-Djava.net.preferIPv4Stack=true
-Dkaraf.home=.
-Dkaraf.base=.
-Dkaraf.etc=etc/karaf
-Djava.util.logging.config.file=etc/karaf/java.util.logging.properties
-Dkaraf.data=/nexus/nexus-data
-Djava.io.tmpdir=../sonatype-work/nexus3/tmp
-Dkaraf.startLocalConsole=false
```
 ## step11)  Create /etc/systemd/system/nexus.service file add the below content
```
sudo vi /etc/systemd/system/nexus.service
```
 ```
[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/app/nexus/bin/nexus start
ExecStop=/app/nexus/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
```
## step 12) Execute the following command to add nexus service to boot.
```
sudo chkconfig nexus on
```
## step 13) Start the nexus service with below command
```
sudo systemctl start nexus
```
## step14) Add a SELinux policy to allow Systemd to access the nexus binary in path /app/nexus/bin/nexus using the following command.

```
sudo chcon -R -t bin_t /app/nexus/bin/nexus

```
## Step15) deafult user name is admin and password available in the bleow location
```

You can find the default admin password in /app/sonatype-work/nexus3/admin.password 
```

