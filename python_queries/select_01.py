from connect import create_connection_to_postgre, custome_logger
from typing import List, Any


from psycopg2 import DatabaseError
from tabulate import tabulate


path_to_sql_query = "sql_queries/select_01.sql"


# SQL-Request
def get_sql_query(file: str) -> str:
    """
    Retrieve SQL query from file.

    This function reads an SQL query from a file and returns it as a string.

    :param file: Path to file SQL format (query).
    Returns:
        str: The SQL query read from the file.

    Raises:
        FileNotFoundError: If the file containing the SQL query is not found.
        IOError: If there is an error reading the file.
    """
    try:
        with open(file, "r") as fh:
            sql_query = fh.read()
        return sql_query
    except FileNotFoundError:
        raise FileNotFoundError("SQL query file not found.")
    except IOError:
        raise IOError("Error reading SQL query file.")


# Function for performing SQL-Request
def select_sql(conn, sql_expression: str) -> List[tuple[Any]]:
    """
    Executes an SQL query and returns the result as a list of tuples.

    :param conn: Connection to the database.
    :param sql_expression: SQL query to execute.
    :return: List of tuples containing the query results.
    """
    c = conn.cursor()
    try:
        c.execute(sql_expression)
        top_students = c.fetchall()
        custome_logger.log("Query successfully!")
        return top_students
    except DatabaseError as e:
        custome_logger.log(f"Error occurred while executing SQL query: {e}", level=40)
        conn.rollback()
        raise
    finally:
        c.close()


if __name__ == "__main__":
    try:
        with create_connection_to_postgre() as conn:
            if conn is not None:
                try:
                    sql_query = get_sql_query(path_to_sql_query)
                    top_students = select_sql(conn, sql_query)

                    table_data = [[student[1], student[2]] for student in top_students]

                    headers = ["Student Name", "Average Grade"]

                    table = tabulate(table_data, headers=headers, tablefmt="grid")

                    custome_logger.log(table)
                except Exception as e:
                    custome_logger.log(f"Error executing SQL query: {e}", level=40)
            else:
                custome_logger.log(
                    "Error! cannot create the database connection.", level=40
                )
    except RuntimeError as e:
        custome_logger.log(e, level=40)
