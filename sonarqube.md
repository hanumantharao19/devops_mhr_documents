- Step 1: Update the Linux packages:
```
sudo yum update -y
```
- Step 2: Install wget and unzip 
```
sudo yum install wget unzip -y
```

- step 3: Install Java 11 by the following command:
```
$ sudo yum install java-11-openjdk-devel -y
```

- step 4: Install the PostgreSQL Repository
```
$ sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

```
- step 5 Install the PostgreSQL 15 database server
```
$ sudo yum -y install postgresql15 postgresql15-server --nogpgcheck
```
- Step 6: Initialize the Postgres database.
```
$ sudo /usr/pgsql-14/bin/postgresql-15-setup initdb

```
- Step 7: Start and Enable the PostgreSQL Database server to start automatically after the system reboot.
```
sudo systemctl enable --now postgresql-14
```
- Step 8: Change the default password for the PostgreSQL user.
```
$ sudo passwd postgres
```

- Step 9: Switch to the Postgres user.
```
$ sudo su - postgres
```
- step 10: Create the sonar user by the following command:
```
createuser sonar
```
- Step 10: Switch to the PostgreSQL shell.
```
psql

```
- Step 11: Set a password for the sonar user for the SonarQube database.
```
ALTER USER sonar WITH ENCRYPTED password 'sonar';
```
- Step 12: Create a new database for PostgreSQL database by running:
```
CREATE DATABASE sonarqube OWNER sonar;
```
- step 13: Grant all privileges to the sonar user on sonarqube Database.
```
GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar; 
```
- Step 13: Exit from the psql shell.
```
\q
```
- Step 15: Switch back to the sudo user by the following command:
```
$ exit
```

- Step 16: Create a user for the sonarqube
```
$ sudo useradd sonar
```
- Step 17: Set password for the user:
```
$ sudo passwd sonar
```

- Step 18: Download the sonaqube binary files To download the latest version go to the SonarQube download page.
```
$ cd /opt
$ sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.1.0.47736.zip
```
- Step 19 :Unzip the archive file by the following command:
```
$ sudo unzip sonarqube-9.1.0.47736.zip
```
- Step 20: Change the sonarqube extracted directory name to sonarqube.
```
$ sudo mv sonarqube-9.1.0.47736 sonarqube
```
- Step 21: Create a group name sonar
```
$ sudo groupadd sonar
```
- Step 22: Give ownership permission to the sonar user and group.
```
$ sudo chown -R sonar:sonar /opt/sonarqube
```
- Step 23: Open the SonarQube configuration file in the vim editor.
```
$ sudo vi /opt/sonarqube/conf/sonar.properties
```
- Step 24: Find the following lines uncomment and type the PostgreSQL Database username and password which we have created in the above steps.
```
sonar.jdbc.username=sonar
sonar.jdbc.password=sonar
```
- Step 25: Edit the sonar script file and set RUN_AS_USER
```
$ sudo vi /opt/sonarqube/bin/linux-x86-64/sonar.sh
RUN_AS_USER=sonar
```
- Step 26: Create a systemd service file for SonarQube to run as System Startup.
```
  $ sudo vi /etc/systemd/system/sonar.service
```
```

[Unit] 
Description=SonarQube service 
After=syslog.target network.target 
[Service] 
Type=forking 
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start 
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop 
User=sonar 
Group=sonar 
Restart=always 
[Install] 
WantedBy=multi-user.target

```
- Step 27: Restart the daemon services to load the sonar service.
```
$ sudo systemctl daemon-reload

```

- step 28: Start and enable the Sonarqube service to automatically run at the boot time:
```
$ sudo systemctl enable --now sonar
```
- step 29: To check if the sonarqube service is running, run the following command:
```
$ sudo systemctl status sonar
```
- step 30: Access SonarQube
http://server_IP:9000 OR http://localhost:9000