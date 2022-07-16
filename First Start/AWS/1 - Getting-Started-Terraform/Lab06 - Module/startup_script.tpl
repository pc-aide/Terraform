#! /bin/bash
# Install nginx1
sudo amazon-linux-extras install -y nginx1

# Service
sudo service nginx start

# cp website to s3 bucket
aws s3 cp s3://${s3_bucket_name}/website/index.html /home/ec2-user/index.html
aws s3 cp s3://${s3_bucket_name}/website/Globo_logo_Vert.svg /home/ec2-user/Globo_logo_Vert.svg

# Remove default index.html
sudo rm /usr/share/nginx/html/index.html

# Custom index.html
sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
sudo cp /home/ec2-user/Globo_logo_Vert.svg /usr/share/nginx/html/Globo_logo_Vert.svg
