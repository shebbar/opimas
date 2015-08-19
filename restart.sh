#!/bin/bash
sudo service nginx stop
sudo stop puma-manager
RAILS_ENV=production rake assets:precompile
sudo service nginx start
sudo start puma-manager
rm shared/log/*
