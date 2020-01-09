#!/bin/bash

#-----------------------------------------
echo "Installing Dev"
#-----------------------------------------
#echo $(tmp=(
sudo apt-get install -y $(tmp=(
#Pacs=""
#Pacs="${Pacs} "$(tmp=(

    # General
    build-essential
    libssl-dev

    # Terminal
    terminator
    #screen
    #tux

    # Source Management
    git
    gitk

    # Text Editing
    vim-gtk3
    #vim-gtk
    #vim-gnome
    ctags

    # TODO: REVIEW:
    #devscripts  # Scripts to make the life of a Debian Package maintainer easier

    # C > Dev

        # C > Dev > Helpers
            gdb            # GNU Debugger
            gdb-doc        # GNU Debugger Info Docs
            pkg-config
            autoconf
            automake
            libtool

        # C > Dev > Libs

            # General
                libglib2.0-dev
                    libglib2.0-doc  # Documentation files for the GLib library

                    # TODO: REVIEW
                        #libglib2.0-cil       # CLI binding for the GLib utility library 2.12
                        #libglib2.0-cil-dev   # CLI binding for the GLib utility library 2.12
                        #libglib2.0-data      # Common files for GLib library
                        #libglib2.0-tests     # GLib library of C routines - installed tests

            # Libuv
                libuv1              # Async Event Notification
                libuv1-dev
                    sphinx-doc          # Doc System Used by them

            # C-Dev > Lua
                liblua5.3-dev
                lua-luv-dev

            # DB
                libmongoc-dev       # MongoDB
                    libmongoc-doc
                    libmongoc-1.0-0
                libhiredis-dev      # Redis
                libsqlite3-dev      # SQLite3
                    sqlite3-doc
                    # TODO:
                    #libsqlite3-mod-impexp - SQLite3 extension module for SQL script, XML, JSON and CSV import/export

            # Parsing
                flex                # Flex
                    flex-doc
                bison               # Bison
                   bison-doc
                libbson-dev         # BSON
                    libbson-doc
                    libbson-1.0-0
                libxml2-dev
                    libxml2-doc   # Documentation for the GNOME XML library
                    libxml2-dbg   # Debugging symbols for the GNOME XML library
                    libxml2-utils # XML utilities
                # TODO: Moved to ~/src/repo/cJSON
                libcjson-dev  # Ultralightweight JSON parser in ANSI C
                    libcjson1
                lua-cjson-dev # JSON parser/encoder for Lua, development files
                    lua-cjson     # JSON parser/encoder for Lua

            # GUI
                libgtk-3-dev     # development files for the GTK library
                    libgtk-3-doc            # documentation for the GTK graphical user interface library
                    # TODO: REVEIW (These and many others)
                        libgtkextra-3.0     # useful set of widgets for creating GUI's for GTK+
                        libgtkextra-3.0-doc # documentation for libgtkextra-x11-3.0
                        libgtkextra-dev     # development files for libgtkextra-x11-3.0


            #TODO: REVIEW (Installed)
            # Suggested packages:
              #doc-base
              #krb5-doc
                  #krb5-user
                  #krb5-k5tls
                  #krb5-config
              devhelp
                  libdevhelp-3-6
                  devhelp-common
              freetype2-doc
              gmp-doc
              gnutls-doc
              gnutls-bin
              libcairo2-doc
              libgcrypt20-doc
              libgmp10-doc
              libgraphite2-utils
              libice-doc
              libmpfr-dev
              libsm-doc
              libwayland-doc
              libx11-doc
              libxcb-doc
              libxext-doc

              # Suggested Additional (Randomish)
                  libamtk-5-0
                  libamtk-5-common
                  libopts25


            # 21st Century

                libgsl-dev           # GNU Scientific Library (GSL)
                    libgsl23
                    libgsl-dbg

                libcurl4-gnutls-dev  # Curl - Client-side URL transfer
                    # Provides
                        # libcurl-dev
                        # libcurl-ssl-dev
                        # libcurl3-gnutls-dev
                        # libcurl4-dev
                    # Depends
                        #libcurl3-gnutls
                    # Suggestes
                        libcurl4-doc
                        libgnutls28-dev
                        libidn11-dev
                        libkrb5-dev
                        libldap2-dev
                        librtmp-dev
                        libssh2-1-dev
                        #pkg-config
                    # Other Flavors
                        # libcurl4-openssl-dev
                        # libcurl4-nss-dev
                    # TODO: REVIEW
                        # libcurl4
                        # zlib1g-dev"


    # Other Tools
        texinfo-doc-nonfree   # Info > Docs etc.
        info2man              # Converts Info-files to Man-files (Haven't tried yet)
        dia
        sqlitebrowser

); echo ${tmp[@]})


#-----------------------------------------
# Install
#-----------------------------------------
#echo $Pacs
#sudo apt-get install -y $Pacs
