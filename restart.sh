#!/bin/bash
sudo service nginx stop
sudo stop puma-manager
sudo service nginx start
sudo start puma-manager
