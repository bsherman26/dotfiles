#!/bin/bash

echo "Installing Node.js"

NODE_PROD="8.11.4"

#-----------------------------------------
# Node.js => nvm (Node Version Manager)
#-----------------------------------------

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

# Source nvm
. ${HOME}/.config/nvm/nvm.sh

# Node.js Latest Version
nvm install node    # Latest

# Global Modules
#. ${HOME}/.config/nvm/nvm.sh # Source NVM
npm install -g jshint
npm install -g jsonlint
npm install -g grunt
#npm install -g node-inspector
#npm install -g cordova
#npm install -g Haraka

# Node.js Current Production Version
nvm install $NODE_PROD
nvm use $NODE_PROD
npm install -g nodemon   # Move to Package Dev???
