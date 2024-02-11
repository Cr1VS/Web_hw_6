-- Середній бал, який певний викладач ставить певному студентові


SELECT 
    t.fullname AS teacher_name,
    s.fullname AS student_name,
    ROUND(AVG(g.grade)) AS average_grade
FROM 
    teachers AS t
JOIN 
    subjects AS subj ON t.id = subj.teacher_id
JOIN 
    grades AS g ON subj.id = g.subject_id
JOIN 
    students AS s ON g.student_id = s.id
WHERE 
    (t.fullname = 'Shannon Malone'
    AND s.fullname = 'Amber Stephens')
GROUP BY  
    t.fullname, s.fullname;
