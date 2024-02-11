-- Знайти середній бал, який ставить певний викладач зі своїх предметів.


SELECT 
    t.fullname,
    subj.subject_name,
    ROUND(AVG(g.grade)) AS average_grade
FROM 
    teachers AS t
JOIN 
    subjects AS subj ON t.id = subj.teacher_id
JOIN 
    grades AS g ON subj.id = g.subject_id
where t.fullname  = 'Dennis Nelson'
GROUP BY  
    t.fullname, subj.subject_name
