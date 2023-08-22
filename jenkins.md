## Jenkins
 - Jenkins in CI/CD Tools
 - other alternative tools for jenkins are 
   -  GIT HUB Actions
   -  Git LAB ,
   -  Circle CI, 
   -  Bambo
- Jenkins can install in server, in local laptop and container

   




- yum update
-  yum install wget
-  wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
-  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
- yum install epel-release java-11-openjdk-devel –not working
- yum install java-17-openjdk-devel
-  yum install jenkins
- systemctl status jenkins
-  systemctl start jenkins
-  systemctl enable jenkins
-  systemctl status jenkins
## Jenkins installation as per offical document###
```
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install java-17-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

```
- Reference link
  https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos


## frist sample jenkins pipeline job
```
pipeline {
    agent any
    
    stages {
        stage('frist stage') {
            steps {
              echo "this is my frist stage"  
            }
            
        }
        stage('second stage') {
            steps {
                echo "this is my second stage"
            }
        }
        
        stage('thrid stage') {
            steps {
                echo "this is my third stage"
            }
        }
        
        
        
    }
    
    
}
```
## second sample jenkins pipeline job
```
pipeline {
    agent any
    
    stages {
        stage('crete hr directory') {
            steps {
                sh 'rm -rf ramesh'
                sh 'mkdir ramesh'
            }
        }
        
        stage('create file in hr directory'){
            steps {
                dir('ramesh') {
                    sh 'touch text{1..10}.txt'
                    
                }

                
            }
        }
    }
}
```