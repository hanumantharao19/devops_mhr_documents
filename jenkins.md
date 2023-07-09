# yum update
# yum install wget
# wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
# rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key( if you are getting error use below command)
or
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# yum install epel-release java-11-openjdk-devel –not working
# yum install java-11-openjdk-devel

# yum install jenkins
# systemctl status jenkins
# systemctl start jenkins
# systemctl enable jenkins
# systemctl status jenkins
# netstat -ntlp
