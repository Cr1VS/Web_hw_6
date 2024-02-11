-- Список курсів, які певному студенту читає певний викладач.


SELECT 
    s.fullname,
    g.name,
    subj.subject_name,
    t.fullname
FROM 
    students AS s
JOIN 
    groups AS g ON s.group_id = g.id
JOIN 
    subjects AS subj ON g.id = subj.id
JOIN 
    teachers AS t ON subj.teacher_id = t.id
WHERE 
    (s.fullname = 'Richard Shea'
    AND t.fullname = 'Sharon Johnson');
    