-- Знайти які курси читає певний викладач.


SELECT 
    t.fullname AS teacher_name,
    subj.subject_name AS course_name
FROM 
    teachers AS t
JOIN 
    subjects AS subj ON t.id = subj.teacher_id
WHERE 
    t.fullname = 'Paul George';


-- Знайти який курс читає кажен викладач.


SELECT 
	t.id,
	t.fullname,
	s.id,
	s.subject_name 
FROM 
    subjects AS s
JOIN 
    teachers AS t ON t.id = s.teacher_id 
    