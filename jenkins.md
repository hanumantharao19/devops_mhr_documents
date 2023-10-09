## Jenkins
 - Jenkins in CI/CD Tools
 - Other alternative tools for jenkins are 
   -  GIT HUB Actions
   -  Git LAB ,
   -  Circle CI, 
   -  Bambo
- Jenkins can install in server, in local laptop and container

## Jenkins installation as per offical document###
```
sudo yum install wget -y
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

- usermod -a -G docker jenkins --> add Jenkins user in to the docker group
- chmod 666 /var/run/docker.sock -- > for avoiding permission issue while building docker image
# importent jenkins plugins
- docker pipeline
- 

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
## thrid sample job
```
pipeline {
    agent any
    
    parameters {
    string(name: 'yourname', defaultValue: 'hanumantharao', description: 'please enter your full name')
     }
    
    stages {
        stage('dispaly my name'){
            steps {
                echo "my name is $yourname"
            }
        }
    }
}
```
### git hub cloning
```
pipeline {
    agent any
    
    tools {
        maven 'maven-3.9.4'
    }
    
    stages {
        stage('git clone') {
            steps {
                git branch: 'main', url: 'https://github.com/hanumantharao19/docker-maven-image.git'
            }
        }
        
        stage('maven build'){
            steps {
                sh 'mvn clean install'
            }
        }
        stage('docker login'){
            steps {
                sh 'docker login -u hanumantharao1986 -p Haswitha@1986'
            }
            
        }
        
        stage('docker build') {
            steps {
                sh 'docker build -t hanumantharao1986/august_java_image:v1.0 .'
            }
        }
        
        stage('docker image to docker registry') {
            steps {
                sh 'docker push hanumantharao1986/august_java_image:v1.0'
            }
        }
    }
}
```

