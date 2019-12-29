#!/bin/bash

echo "Installing Lua"

LUA_VER="5.3.5"
LUA_ROCKS_VER="3.2.1"

#-----------------------------------------
# Lua => luaver (Lua Version Manager)
#-----------------------------------------

# luaver Dependency
sudo apt-get install libreadline-dev

# Lua Version Manager
curl -fsSL https://raw.githubusercontent.com/dhavalkapil/luaver/master/install.sh | sh -s - -r v1.1.0

# Source luaver
. ~/.luaver/luaver

# Lua Versions
luaver install LUA_VER
luaver use LUA_VER
luaver set-default LUA_VER

# Lua Rocks
luaver install-luarocks $LUA_ROCKS_VER
luaver set-default-luarocks $LUA_ROCKS_VER
luaver set-default-luarocks $LUA_ROCKS_VER
luarocks install luacheck # TODO: REVIEW => This may not be necessary.
