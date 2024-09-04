# Introduction to DB. Homework

### Installing Postgres

- [Download](https://www.postgresql.org/download/) and installing Postgres locally

### Creating a DB

- Connect to Postgres from the command line
- Create a DB named `north`

### Creating tables

- Review the data in the `north_data` folder
- Create three tables using the `query tool` in pgAdmin
- `employees`
- `customers`
- `orders`
- Define the columns for the tables and the relationships between the tables yourself
- Copy the Sql code for creating the tables to the `create_tables.sql` file

### Filling the tables with data

- Write a script in `main.py` that will fill the created tables with data from `north_data`
- Use the `psycopg2` library to connect to the DB
- Log in to pgAdmin and make sure that there is data in the tables
