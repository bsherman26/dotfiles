#!/bin/bash

sudo sh -c 'find /home/app/.forever -maxdepth 1 -mtime +35 -name [a-h]*.log -exec mv {} . ;'
