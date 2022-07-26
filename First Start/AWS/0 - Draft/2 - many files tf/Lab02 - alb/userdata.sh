#! /bin/bash
# Install nginx1
sudo amazon-linux-extras install -y nginx1

# Service
sudo service nginx start

# Remove default index.html
sudo rm /usr/share/nginx/html/index.html

# Custom index.html
echo '<html><head><title>Test</title></head><body><p><span>This is a test</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
