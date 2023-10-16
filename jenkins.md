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



- BUILD_NUMBER - The current build number. For example "153"
- BUILD_ID - The current build id. For example "2018-08-22_23-59-59"
- BUILD_DISPLAY_NAME - The name of the current build. For example "#153".
- JOB_NAME - Name of the project of this build. For example "foo"
- BUILD_TAG - String of "jenkins-${JOB_NAME}-${BUILD_NUMBER}".
- EXECUTOR_NUMBER - The unique number that identifies the current executor.
- NODE_NAME - Name of the "slave" or "master". For example "linux".
- NODE_LABELS - Whitespace-separated list of labels that the node is assigned.
- WORKSPACE - Absolute path of the build as a workspace.
- JENKINS_HOME - Absolute path on the master node for Jenkins to store data.
- JENKINS_URL - URL of Jenkins. For example http://server:port/jenkins/
- BUILD_URL - Full URL of this build. For example http://server:port/jenkins/job/foo/15/
- JOB_URL - Full URL of this job. For example http://server:port/jenkins/job/foo/


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
## read the text file and print the data###
```
      stage('redafile'){
            steps {
                script {
                   datainput = readFile 'Dockerfile'
                }
            }
        }
        stage('output'){
            steps {
                script {
                   echo datainput
                }
            }
        }
```
## read the properties file and grep the value###
```
      stage('readpomfile') {
            steps {
                script{
                def props = readProperties file: 'version.properties'
                def majaorVersion = props.majaorVersion
                echo majaorVersion
                }
            }
            
         }
```
## wirte the data into the file
```
       stage('write file') {
           steps {
               writeFile file: 'version.properties', text: '''this hunumantharao medikonda
                i am form hyderabad'''
           }
       }

        stage('print the data') {
           steps {
               sh 'cat version.properties'
           }
       }

Note: it will overide existing data which is there in the file
```
### maven job executed in the docker agent
```
pipeline {
      agent {
               docker { image 'maven:3.8.1-adoptopenjdk-11' }
            }
    stages {
        stage('git clone') {
            steps {
                git 'https://github.com/hanumantharao19/docker-pipeline-mhr.git'
            }
        }
        
        stage('maven build'){
          
            steps {
                sh 'mvn install'
            }
        }
        
    }
}
```
### executing for loop in the jenkins pipeline###
```
ppipeline {
    agent any
    stages {
        stage('Example') {
            steps {

                script {
                    def names = ['hanu','mahesh','ramesh', 'suresh']
                    
                    for (int i = 0; i < names.size(); ++i) {
                        
                        echo "my name is ${names[i]}"
                     
                    }
                }
            }
        }
    }
}
```



