-- Таблицю груп

drop table if exists groups;
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(70) NOT NULL
)

-- Таблиця студентів

drop table if exists students;
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(70) NOT NULL,
    group_id INTEGER REFERENCES groups(id)
    on delete cascade
);

-- Таблицю викладачів

drop table if exists teachers;
CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(70) NOT NULL
);

-- Таблицю предметів із вказівкою викладача, який читає предмет

drop table if exists subjects;
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    teacher_id INTEGER REFERENCES teachers(id)
    on delete cascade
);

-- Таблицю, де у кожного студента є оцінки з предметів із зазначенням коли оцінку отримано

drop table if exists grades;
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    subject_id INTEGER REFERENCES subjects(id),
    grade INTEGER CHECK (grade >= 0 AND grade <= 100),
    grade_date DATE NOT NULL
);
