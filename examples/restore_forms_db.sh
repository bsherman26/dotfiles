#!/bin/bash

####################
# Template Example #
####################

#mongorestore --drop -d forms <DATABASE DUMP DIRECTORY>

#mongorestore -d forms <DATABASE DUMP DIRECTORY>


#################
# Full Examples #
#################

#mongorestore --drop -d forms 2018-##-##_####_Survey_Database/forms

#mongorestore -d forms 2018-##-##_####_Survey_Database/forms

#mongorestore --drop -c pages -d forms 2018-##-##_####_Survey_Database_SHORT/forms/pages.bson

#mongorestore --drop -c pages -d forms 2018-##-##_####_Survey_Database_pages/forms/pages.bson
#mongorestore --drop -c forms -d forms 2018-##-##_####_Survey_Database_forms/forms/forms.bson
#mongorestore --drop -c services -d forms 2018-##-##_####_Survey_Database_services/forms/services.bson


#######################
# With Dry Run Option #
#######################

#mongorestore --dry-run -d forms
#mongorestore --dry-run --drop -d forms
