import psycopg2

from config import config


def main():
    script_file = 'fill_db.sql'
    json_file = 'suppliers.json'
    db_name = 'my_new_db'

    params = config()
    conn = None

    create_database(params, db_name)
    print(f"Database {db_name} successfully created")

    params.update({'dbname': db_name})
    try:
        with psycopg2.connect(**params) as conn:
            with conn.cursor() as cur:
                execute_sql_script(cur, script_file)
                print(f"Database {db_name} successfully filled with data")

                create_suppliers_table(cur)
                print("Table suppliers successfully created")

                suppliers = get_suppliers_data(json_file)
                insert_suppliers_data(cur, suppliers)
                print("Data successfully added to suppliers")

                add_foreign_keys(cur, json_file)
                print(f"FOREIGN KEY successfully added")

    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()


def create_database(params, db_name) -> None:
    """New database creation"""
    pass


def execute_sql_script(cur, script_file) -> None:
    """Executes a script from a file to populate the database with data."""
    pass


def create_suppliers_table(cur) -> None:
    """Creates the suppliers table."""
    pass


def get_suppliers_data(json_file: str) -> list[dict]:
    """Extracts supplier data from a JSON file and returns a list of dictionaries with the relevant information."""
    pass


def insert_suppliers_data(cur, suppliers: list[dict]) -> None:
    """Adds data from suppliers to the suppliers table."""
    pass


def add_foreign_keys(cur, json_file) -> None:
    """Adds a foreign key with a reference to supplier_id to the products table."""
    pass


if __name__ == '__main__':
    main()
