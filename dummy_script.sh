#!/bin/bash
if [ $# -gt 0 ]; then
   echo "Hello $@!";
else
   echo "Hello World!";
fi
