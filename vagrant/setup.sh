#!/bin/bash

chsh -s /bin/bash vagrant

aptitude update

aptitude -y full-upgrade

aptitude -y install ruby bundler build-essential libsqlite3-dev
