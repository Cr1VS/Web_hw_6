-- Оцінки студентів у певній групі з певного предмета на останньому занятті.


SELECT 
    s.fullname,
    g.grade,
    g.grade_date
FROM 
    students AS s
JOIN 
    grades AS g ON s.id = g.student_id
JOIN 
    subjects AS subj ON g.subject_id = subj.id
JOIN 
    groups AS grp ON s.group_id = grp.id
WHERE 
    subj.subject_name = 'Mathematics'
    AND grp.name = 'Group C'
    AND g.grade_date = (SELECT MAX(grade_date) FROM grades WHERE subject_id = subj.id);
    