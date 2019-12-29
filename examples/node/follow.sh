#!/bin/bash

tail -f -n 200 `forever list | sed -n 3p | sed 's/^.*\/\(.\+\.log\).*$/.forever\/\1/'`

#tail -f -n 200 `forever list | grep '/home/app/.forever/' | sed 's/^.*\/\(.\+\.log\).*$/.forever\/\1/'`

#tail -f -lines=200 `forever list | grep '/home/app/.forever/' | sed 's/^.*\/\(.\+\.log\).*$/.forever\/\1/'`
