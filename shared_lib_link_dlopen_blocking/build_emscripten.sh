#!/bin/bash

# build a
echo "BUILD A"
emcc -c -fpic package_a/a.cpp -s SIDE_MODULE=1 -s EXPORT_ALL=1  -s LLD_REPORT_UNDEFINED -Ipackage_a -shared -o liba.so

# build b
echo "BUILD B"
emcc -c -fpic package_b/b.cpp -s SIDE_MODULE=1 -s EXPORT_ALL=1  -s LLD_REPORT_UNDEFINED -Ipackage_a -Ipackage_b -shared -o libb.so


export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH


cp liba.so asset_dir/liba.so
cp libb.so asset_dir/libb.so

# build main
echo "BUILD Main"
em++  -Ipackage_a -Ipackage_b  -s MAIN_MODULE=1 -s EXPORT_ALL=1 -s LLD_REPORT_UNDEFINED  -o  main.html main.cpp \
--embed-file asset_dir