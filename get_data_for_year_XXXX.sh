#!/bin/bash

# Create a directory for the year
year=$1
case "$year" in
    1975|1976|1977|1978|1979|1980|1981|1982|1983|1984|1985|1986|1987|1988|1989|1990|1991|1992|1993|1994|1995|1996|1997|1998|1999|2000|2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012)
        if [ ! -d "$year" ]; then
            echo "Creating a directory."
            mkdir -p $year
        fi
        ;;
    *)
        echo "Use a year between 1975 and 2012 (inclusive) as your argument."
        exit
        ;;
esac

# Download the data
if [ ! -f "$year/FARS$year.zip" ]; then
    echo "Downloading the data from the NHTSA FARS FTP site. (phew, that's a lot of acronyms!)"
    case "$year" in
        1975|1976|1977|1978|1979|1980|1981|1982|1983|1984|1985|1986|1987|1988|1989|1990|1991|1992|1993|2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012)
            wget ftp://ftp.nhtsa.dot.gov/FARS/$year/DBF/FARS$year.zip -O $year/FARS$year.zip
            ;;
        1994|1995|1996|1997|1998|1999|2000)
            wget ftp://ftp.nhtsa.dot.gov/FARS/$year/DBF/FARSDBF${year:2:2}.zip -O $year/FARS$year.zip
            ;;
    esac
fi

# Unzip the data
if [ -f "$year/FARS$year.zip" ]; then
    echo "Unzipping the downloaded data."
    unzip $year/FARS$year.zip -d $year/
fi
