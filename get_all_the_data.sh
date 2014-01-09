#!/bin/bash
for year in {1975..2012}; do
    if [ ! -d "$year" ]; then
        mkdir -p $year
    fi
done
for year in {1975..1993}; do
    if [ ! -f "$year/FARS$year.zip" ]; then
        wget ftp://ftp.nhtsa.dot.gov/FARS/$year/DBF/FARS$year.zip -O $year/FARS$year.zip
    fi
done
for year in {1994..2000}; do
    if [ ! -f "$year/FARS$year.zip" ]; then
        wget ftp://ftp.nhtsa.dot.gov/FARS/$year/DBF/FARSDBF${year:2:2}.zip -O $year/FARS$year.zip
    fi
done
for year in {2001..2012}; do
    if [ ! -f "$year/FARS$year.zip" ]; then
        wget ftp://ftp.nhtsa.dot.gov/FARS/$year/DBF/FARS$year.zip -O $year/FARS$year.zip
    fi
done

for year in {1975..2012}; do
    if [ -f "$year/FARS$year.zip" ]; then
        unzip $year/FARS$year.zip -d $year/
    fi
done
