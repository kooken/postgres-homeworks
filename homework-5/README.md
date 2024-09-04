# Database best practices. Homework

## Task description

Write a program that will:
- create a new database with data from the file `fill_db.sql`
- add a table `suppliers` to the database with data from the file `suppliers.json`
- add a link to the table `suppliers` to the table with products

> You can use the structure in the file `main.py` or implement everything yourself.

Create a `database.ini` configuration file with your database connection parameters.
</br>
Example file contents:
```ini
[postgresql]
host=localhost
user=postgres
password=12345
port=5432
```