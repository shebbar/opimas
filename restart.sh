#!/bin/bash
sudo service nginx stop
sudo stop puma-manager
sudo service postgresql stop
sudo service nginx start
sudo start puma-manager
sudo service postgresql start
