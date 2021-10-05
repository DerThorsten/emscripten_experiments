#!/bin/bash

# build a
g++ -c -fpic package_a/a.cpp -Ipackage_a -shared -o liba.so

# build b
g++ -c -fpic package_b/b.cpp -Ipackage_a -Ipackage_b -shared -o libb.so


export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH



# build main
g++  -Ipackage_a -Ipackage_b  -o  main main.cpp -la -lb -L$(pwd)