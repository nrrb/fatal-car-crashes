#!/bin/bash
for year in {1975..2012}; do
    # Some files end in 'dbf'...
    for dbf_filename in `ls $year/*.dbf`; do
        python dbf_to_csv.py $dbf_filename $dbf_filename.csv
    done
    # and some other files end in 'DBF'.
    for dbf_filename in `ls $year/*.DBF`; do
        python dbf_to_csv.py $dbf_filename $dbf_filename.csv
    done
done
