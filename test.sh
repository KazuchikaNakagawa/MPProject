#!/bin/bash

cd soft
cp $1 test.c
make clean
make
cd ../hard
make clean
make
make program
cd ../
