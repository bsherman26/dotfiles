#!/bin/bash

mongodump --dry-run --host mongodb://10.0.1.186:27017 -d forms -o `date +%F_%H%M_Survey_Database`
#mongodump --dry-run --host mongodb://10.0.1.186:27017 -d forms -o `date +%F_%H%M_Survey_Database`
#mongodump --dry-run --drop --host mongodb://10.0.1.186:27017 -d forms -o `date +%F_%H%M_Survey_Database`
