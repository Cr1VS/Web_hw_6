from python_queries.connect import create_connection_to_postgre, custome_logger
from datetime import datetime
import random


from psycopg2 import DatabaseError
from faker import Faker


fake = Faker()


def create_table(conn, sql_expression: str):
    """create a table from the create_table_sql statement
    :param sql_expression:
    :param conn: Connection object
    :return:
    """
    c = conn.cursor()
    try:
        c.execute(sql_expression)
        conn.commit()
        custome_logger.log("Table created successfully")
    except DatabaseError as e:
        custome_logger.log(f"Error occurred while creating table: {e}", level=40)
        conn.rollback()
    finally:
        c.close()


def insert_data(conn, sql_expression: str, data):
    """insert data to the table
    :param data:
    :param conn:
    :return:
    """
    c = conn.cursor()
    try:
        c.executemany(sql_expression, data)
        conn.commit()
        custome_logger.log("Data inserted successfully")
    except DatabaseError as e:
        custome_logger.log(f"Error occurred while inserting data: {e}", level=40)
        conn.rollback()
    finally:
        c.close()


if __name__ == "__main__":
    sql_create_groups_table = """
    drop table if exists groups;
    CREATE TABLE groups (
     id SERIAL PRIMARY KEY,
     name VARCHAR(70) NOT NULL
    );
    """

    sql_create_students_table = """
    drop table if exists students;
    CREATE TABLE students (
      id SERIAL PRIMARY KEY,
      fullname VARCHAR(70) NOT NULL,
      group_id INTEGER REFERENCES groups(id)
      on delete cascade
    );
    """

    sql_create_teachers_table = """
    drop table if exists teachers;
    CREATE TABLE teachers (
     id SERIAL PRIMARY KEY,
     fullname VARCHAR(70) NOT NULL
    );
    """

    sql_create_subjects_table = """
    drop table if exists subjects;
    CREATE TABLE subjects (
     id SERIAL PRIMARY KEY,
     name VARCHAR(100) NOT NULL,
     teacher_id INTEGER REFERENCES teachers(id)
     on delete cascade
    );
    """

    sql_create_grades_table = """
    drop table if exists grades;
    CREATE TABLE grades (
     id SERIAL PRIMARY KEY,
     student_id INTEGER REFERENCES students(id),
     subject_id INTEGER REFERENCES subjects(id),
     grade INTEGER CHECK (grade >= 0 AND grade <= 100),
     grade_date DATE NOT NULL
    );
    """

    try:
        with create_connection_to_postgre() as conn:
            if conn is not None:
                create_table(conn, sql_create_groups_table)
                create_table(conn, sql_create_students_table)
                create_table(conn, sql_create_teachers_table)
                create_table(conn, sql_create_subjects_table)
                create_table(conn, sql_create_grades_table)

                groups = ["Group A", "Group B", "Group C"]
                for group_name in groups:
                    insert_data(
                        conn, "INSERT INTO groups (name) VALUES (%s)", [(group_name,)]
                    )

                teachers = [fake.name() for _ in range(8)]
                for teacher_name in teachers:
                    insert_data(
                        conn,
                        "INSERT INTO teachers (fullname) VALUES (%s)",
                        [(teacher_name,)],
                    )

                subjects = [
                    "Mathematics",
                    "Physics",
                    "Chemistry",
                    "Biology",
                    "History",
                    "Geograph",
                    "Literature",
                    "Computer Science",
                ]
                for teacher_id in range(1, 9):
                    insert_data(
                        conn,
                        "INSERT INTO subjects (name, teacher_id) VALUES (%s, %s)",
                        [(subjects[teacher_id - 1], teacher_id)],
                    )

                for _ in range(50):
                    student_name = fake.name()
                    group_id = random.randint(1, len(groups))
                    insert_data(
                        conn,
                        "INSERT INTO students (fullname, group_id) VALUES (%s, %s)",
                        [(student_name, group_id)],
                    )

                for student_id in range(1, 51):
                    for subject_id in range(1, 9):
                        for _ in range(3):
                            grade = random.randint(60, 100)
                            date = datetime(
                                2023, random.randint(1, 12), random.randint(1, 27)
                            ).date()
                            insert_data(
                                conn,
                                "INSERT INTO grades (student_id, subject_id, grade, grade_date) VALUES (%s, %s, %s, %s)",
                                [(student_id, subject_id, grade, date)],
                            )
            else:
                custome_logger.log(
                    "Error! cannot create the database connection.", level=40
                )
    except RuntimeError as e:
        custome_logger.log(e, level=40)
