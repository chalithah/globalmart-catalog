#!/bin/bash

# Ensure nginx is running
sudo systemctl start nginx || sudo service nginx start
sudo systemctl enable nginx || sudo chkconfig nginx on