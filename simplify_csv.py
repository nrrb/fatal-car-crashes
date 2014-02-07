import csv
import sys
import os


FIELDS = ('MINUTE', 'HOUR', 'DAY', 'MONTH', 'LATITUDE', 'LONGITUD', 'FATALS')

def simplify_csv_file(csv_read_path, csv_write_path):
    with open(csv_write_path, 'wb') as f_out:
        dict_writer = csv.DictWriter(f_out, fieldnames=FIELDS)
        dict_writer.writeheader()
        with open(csv_read_path, 'rb') as f_in:
            for row in csv.DictReader(f_in):
                dict_writer.writerow({field: row[field] for field in FIELDS})

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print 'Syntax:'
        print 'python {0} complicated.csv simplified.csv'.format(__file__)
        sys.exit(1)

    _, csv_read_path, csv_write_path = sys.argv[:3]
    if not os.path.exists(csv_read_path):
        print 'Error! {0} is a mirage.'.format(csv_read_path)
        sys.exit(1)

    simplify_csv_file(csv_read_path, csv_write_path)
