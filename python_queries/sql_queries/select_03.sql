-- Знайти середній бал у групах з певного предмета.


SELECT 
    grou.id, 
    grou.name, 
    subj.subject_name, 
    ROUND(AVG(g.grade)) AS avg_grade
FROM 
    grades AS g
JOIN 
    students AS s ON g.student_id = s.id 
JOIN 
    groups AS grou ON s.group_id = grou.id
JOIN 
    subjects AS subj ON g.subject_id = subj.id
WHERE 
    subj.subject_name = 'Mathematics'
GROUP BY  
    grou.id, grou.name, subj.subject_name
ORDER BY 
    avg_grade DESC;


-- Знайти середній бал у групах з усіх предметів.


SELECT 
    grou.id, 
    grou.name, 
    subj.subject_name, 
    ROUND(AVG(g.grade)) AS avg_grade
FROM 
    grades AS g
JOIN 
    students AS s ON g.student_id = s.id 
JOIN 
    groups AS grou ON s.group_id = grou.id
JOIN 
    subjects AS subj ON g.subject_id = subj.id
GROUP BY  
    grou.id, grou.name, subj.subject_name
ORDER BY 
    avg_grade DESC;
