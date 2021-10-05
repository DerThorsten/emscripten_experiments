#!/bin/bash

# build a
echo "BUILD A"
em++ -c -fpic package_a/a.cpp -s SIDE_MODULE=1 -s EXPORT_ALL=1  -s LLD_REPORT_UNDEFINED -Ipackage_a -shared -o liba.wasm

# build b
echo "BUILD B"
em++ -c -fpic package_b/b.cpp -s SIDE_MODULE=1 -s EXPORT_ALL=1  -s LLD_REPORT_UNDEFINED -Ipackage_a -Ipackage_b -shared -o libb.wasm


export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH



# build main
echo "BUILD Main"
em++  -Ipackage_a -Ipackage_b  -s MAIN_MODULE=1 -s EXPORT_ALL=1 -s LLD_REPORT_UNDEFINED  -o  main.html main.cpp -L$(pwd) \
    liba.wasm libb.wasm
