#!/bin/bash
BLACKBOX_EXPORTER_VERSION="0.25.0"

# Download and extract
wget https://github.com/prometheus/blackbox_exporter/releases/download/v${BLACKBOX_EXPORTER_VERSION}/blackbox_exporter-${BLACKBOX_EXPORTER_VERSION}.linux-amd64.tar.gz
tar -xzvf blackbox_exporter-${BLACKBOX_EXPORTER_VERSION}.linux-amd64.tar.gz
cd blackbox_exporter-${BLACKBOX_EXPORTER_VERSION}.linux-amd64
cp blackbox_exporter /usr/local/bin

# Create user
useradd --no-create-home --shell /bin/false blackbox_exporter

# Set permissions
chown blackbox_exporter:blackbox_exporter /usr/local/bin/blackbox_exporter

# Create systemd service
echo '[Unit]
Description=Blackbox Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=blackbox_exporter
Group=blackbox_exporter
Type=simple
ExecStart=/usr/local/bin/blackbox_exporter --config.file=/etc/blackbox_exporter.yml

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/blackbox_exporter.service

# Create default config file
echo 'modules:
  http_2xx:
    prober: http
    timeout: 5s
    http:
      valid_status_codes: []  # Accept all 2xx
      method: GET' > /etc/blackbox_exporter.yml
      
# Enable and start service
systemctl daemon-reload
systemctl start blackbox_exporter
systemctl enable blackbox_exporter
