#!/bin/bash

#Run en consola sh ./Bash.sh
# Corremos el script psql 
sudo -u postgres dropdb -i -e OurWorldInData
sudo -u postgres createdb OurWorldInData
sudo -u postgres psql -f OurWorldInData.sql