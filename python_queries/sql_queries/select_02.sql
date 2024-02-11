-- Знайти студента із найвищим середнім балом з певного предмета.


SELECT 
    s.id, s.fullname, subj.subject_name, ROUND(AVG(g.grade)) AS avg_grade
FROM 
    students AS s 
JOIN 
    grades AS g ON s.id = g.student_id
JOIN 
    subjects AS subj ON g.subject_id  = subj.id 
WHERE 
    subj.subject_name = 'Mathematics'
GROUP BY 
    s.id, s.fullname, subj.subject_name
ORDER BY 
    avg_grade DESC 
LIMIT 
    1;


-- Знайти студента із найвищим середнім балом з кожного предмета.


WITH ranked_students AS (
    SELECT 
        s.id AS student_id, 
        s.fullname AS student_name, 
        subj.subject_name AS subject_name,
        ROUND(AVG(g.grade)) AS avg_grade,
        ROW_NUMBER() OVER (PARTITION BY subj.subject_name ORDER BY AVG(g.grade) DESC) AS row_num
    FROM 
        students AS s
    JOIN 
        grades AS g ON s.id = g.student_id
    JOIN 
        subjects AS subj ON g.subject_id = subj.id
    GROUP BY 
        s.id, s.fullname, subj.subject_name
    ORDER BY 
        avg_grade DESC 
)
SELECT 
    student_id, student_name, subject_name, avg_grade
FROM 
    ranked_students
WHERE 
    row_num = 1;
