#!/bin/bash

#mongodump -d forms -o `date +%F_%H%M_Survey_Database`

mongodump -d forms --excludeCollection=service_req --excludeCollection=log -o `date +%F_%H%M_Survey_Database_SHORT`

#mongodump -d forms -c pages -o `date +%F_%H%M_Survey_Database_pages`

#mongodump -d forms -c forms -o `date +%F_%H%M_Survey_Database_forms`

#mongodump -d forms -c services -o `date +%F_%H%M_Survey_Database_services`
