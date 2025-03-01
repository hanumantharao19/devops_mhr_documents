
# Ins
    2  sudo yum update -y
    3  sudo yum install wget
    4  wget -q -O gpg.key https://rpm.grafana.com/gpg.key
    5  sudo rpm --import gpg.key
    6  sudo vi /etc/yum.repos.d/grafana.repo
    7  sudo yum install grafana
    8  sudo systemctl enable grafana-server
    9  sudo systemctl start grafana-server
   10  sudo systemctl status grafana-server
   11  history


http://18.217.58.12:3000/login
