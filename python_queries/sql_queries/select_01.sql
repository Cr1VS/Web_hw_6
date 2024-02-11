-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.


SELECT 
    s.id, s.fullname, round(avg(g.grade)) AS avg_grade
FROM 
    students AS s
JOIN 
    grades AS g ON s.id = g.student_id
GROUP BY
    s.id, s.fullname
ORDER BY
    avg_grade DESC
LIMIT 
    5;
    