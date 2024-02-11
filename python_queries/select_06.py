from tabulate import tabulate


from connect import create_connection_to_postgre, custome_logger
from select_01 import get_sql_query, select_sql


path_to_sql_query = "sql_queries/select_06.sql"


if __name__ == "__main__":
    try:
        with create_connection_to_postgre() as conn:
            if conn is not None:
                try:
                    sql_query = get_sql_query(path_to_sql_query)
                    top_students = select_sql(conn, sql_query)

                    table_data = [[student[1], student[3]] for student in top_students]

                    headers = ["Student name", "Gtoup name"]

                    table = tabulate(table_data, headers=headers, tablefmt="grid")

                    custome_logger.log(table)
                except Exception as e:
                    custome_logger.log(f"Error executing SQL query: {str(e)}", level=40)
            else:
                custome_logger.log(
                    "Error! cannot create the database connection.", level=40
                )
    except RuntimeError as e:
        custome_logger.log(e, level=40)
