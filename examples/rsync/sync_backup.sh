#!/bin/bash

sudo rsync -rlptvzh --stats -e "ssh -i /home/brian/.ssh/id_rsa -p16463" brian@34.234.188.2:/home/brian/logs/ ./ 
#sudo rsync -rlptvzh --stats --exclude-from=exclude.txt -e "ssh -i /home/brian/.ssh/id_rsa -p16463" brian@34.234.188.2:/home/brian/mongodb_backup/ ./ 
#sudo rsync -rlptvzh --stats --exclude-from=exclude.txt -e "ssh -i /home/brian/.ssh/id_rsa -p16463" brian@54.209.199.182:/home/brian/mongodb_backup/ ./ 
#sudo rsync --dry-run -rlptvzh --stats --exclude-from=exclude.txt -e "ssh -i /home/brian/.ssh/id_rsa -p16463" brian@54.209.199.182:/home/brian/mongodb_backup/ ./ 
#sudo rsync -rlptvzh --delete --stats --exclude-from=prod_exclude.txt -e "ssh -i /home/brian/.ssh/id_rsa -p16463" ./ app@54.209.199.182:/home/app/src/
