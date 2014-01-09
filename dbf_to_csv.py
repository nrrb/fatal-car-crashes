import csv
import sys
from dbfpy import dbf

def dbf_to_csv(dbf_path, csv_path):
    with open(dbf_path, 'rb') as dbf_file:
        database = dbf.Dbf(dbf_file, readOnly=True)
        with open(csv_path, 'wb') as csv_file:
            dict_writer = csv.DictWriter(csv_file, fieldnames=sorted(database[0].asDict().keys()))
            dict_writer.writeheader()
            for record_number, record in enumerate(database):
                dict_writer.writerow(record.asDict())
            print 'Converted {n} rows of DBF file {f}'.format(n=record_number, f=dbf_path)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print "Here's how you run me:"
        print "{0} path/to/somedata.dbf path/to/output.csv".format(__file__)
        sys.exit(1)

    dbf_to_csv(sys.argv[1], sys.argv[2])
