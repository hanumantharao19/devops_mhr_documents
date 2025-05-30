Step 1: Update the yum package repositories.

sudo yum update -y
Step 3: Download the source using curl, untar it, and rename the extracted folder to prometheus-files.

curl -LO url -LO https://github.com/prometheus/prometheus/releases/download/v2.22.0/prometheus-2.22.0.linux-amd64.tar.gz
tar -xvf prometheus-2.22.0.linux-amd64.tar.gz
mv prometheus-2.22.0.linux-amd64 prometheus-files

Step 4: Create a Prometheus user, required directories, and make Prometheus the user as the owner of those directories.

sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus


Step 5: Copy prometheus and promtool binary from prometheus-files folder to /usr/local/bin and change the ownership to prometheus user.

sudo cp prometheus-files/prometheus /usr/local/bin/
sudo cp prometheus-files/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

Step 6: Move the consoles and console_libraries directories from prometheus-files to /etc/prometheus folder and change the ownership to prometheus user.

sudo cp -r prometheus-files/consoles /etc/prometheus
sudo cp -r prometheus-files/console_libraries /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries

Step 1: Create the prometheus.yml file.

sudo vi /etc/prometheus/prometheus.yml
Step 2: Copy the following contents to the prometheus.yml file.

global:
  scrape_interval: 10s

scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']
Step 3: Change the ownership of the file to prometheus user.

sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml

Step 1: Create a prometheus service file.

sudo vi /etc/systemd/system/prometheus.service

Step 2: Copy the following content to the file.

[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target

Step 3: Reload the systemd service to register the prometheus service and start the prometheus service.

sudo systemctl daemon-reload
sudo systemctl start prometheus
Check the prometheus service status using the following command.

sudo systemctl status prometheus

Now you will be able to access the prometheus UI on 9090 port of the prometheus server.

http://<prometheus-ip>:9090/graph
