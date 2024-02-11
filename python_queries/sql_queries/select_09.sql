-- Знайти список курсів, які відвідує студент.


SELECT 
    s.fullname,
    g.name,
    subj.subject_name
FROM 
    students AS s
JOIN 
    groups AS g ON s.group_id = g.id
JOIN 
    subjects AS subj ON g.id = subj.id;
