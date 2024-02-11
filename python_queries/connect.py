from contextlib import contextmanager
from CustomLogger import CustomLogger
from typing import Generator


import psycopg2


custome_logger = CustomLogger("Error.log")


@contextmanager
def create_connection_to_postgre() -> Generator[psycopg2.connect, None, None]:
    """
    Context manager for creating a connection to a PostgreSQL database.

    Yields:
        psycopg2.connection: A connection to the PostgreSQL database.

    Raises:
        RuntimeError: If failed to create a database connection.
    """
    try:
        conn = psycopg2.connect(
            host="localhost", database="test", user="postgres", password="11223344"
        )
        custome_logger.log("Successfully connected to PostgreSQL")
        yield conn
        conn.close()
    except psycopg2.OperationalError as e:
        raise RuntimeError(f"Failed to create database connection {e}")


if __name__ == "__main__":
    custome_logger.log("It's module for connection to PostgreSQL")
