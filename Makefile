#----------------------------------
# Variables > Init
#----------------------------------
SHELL:=/bin/bash

LIBS = $$(tmp=( \
	glib-2.0 \
	libuv \
	lua5.3 \
	lua5.3-luv \
	libmongoc-1.0 \
	hiredis \
	sqlite3 \
	libbson-1.0 \
	libxml-2.0 \
	libcurl \
); echo $${tmp[@]})

CFLAGS = $$(pkg-config --cflags ${LIBS}) -g -W -Wall -O3
LDLIBS = $$(pkg-config --libs ${LIBS})

CC     = cc


#-----------------------------------------
# Recipe (Standard)
#-----------------------------------------
$(P): $(OBJECTS)


#-----------------------------------------
# DEBUG: Check Variables
#-----------------------------------------
#all:
	#@echo $(SHELL)
	#@echo $(LIBS)
	#@echo $(P)
	#@echo $(OBJECTS)
	#@echo $(Custom_Path)
	#@echo $(C_INCLUDE_PATH)
	#@echo $(LIBRARY_PATH)
	#@echo $(CFLAGS)
	#@echo $(LDLIBS)
	#@echo $(CC)


#-----------------------------------------
# NOTES:
#-----------------------------------------

#glib-2.0

#libuv

#lua5.3
#lua5.3-luv

#libmongoc-1.0
#libmongoc-ssl-1.0

#hiredis

#sqlite3

#libbson-1.0
#libxml-2.0

#libcurl

#gsl
#libssh2
#libssl

#gtk+-3.0

#cJSON => Moved to ~/src/repo/cJSON
