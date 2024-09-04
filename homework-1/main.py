"""Script for filling the Postgres database"""
import psycopg2
import csv

conn = psycopg2.connect(host='localhost', database="north", user="postgres", password="4815162342")

try:
    with conn:
        with conn.cursor() as cur:
            with open('north_data/employees_data.csv', 'r') as file:
                reader = csv.reader(file)
                next(reader)
                for data in reader:
                    cur.execute("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)", data)

            with open('north_data/customers_data.csv', 'r') as file:
                reader = csv.reader(file)
                next(reader)
                for data in reader:
                    cur.execute("INSERT INTO customers VALUES (%s, %s, %s)", data)

            with open('north_data/orders_data.csv', 'r') as file:
                reader = csv.reader(file)
                next(reader)
                for data in reader:
                    cur.execute("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)", data)

finally:
    conn.close()
