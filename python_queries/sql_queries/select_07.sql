--  Знайти оцінки усіх студентів у всіх группах з усіх предметів предмета.


SELECT 
    s.fullname,
    gr.name,
    subj.subject_name,
    g.grade
FROM 
    students AS s
JOIN 
    grades AS g ON s.id = g.student_id
JOIN 
    subjects AS subj ON g.subject_id = subj.id
JOIN 
    groups AS gr ON s.group_id = gr.id
ORDER BY 
	g.grade DESC;


--  Знайти оцінки студентів у окремій групі з певного предмета.


SELECT 
    s.fullname,
    gr.name,
    subj.subject_name,
    g.grade
FROM 
    students AS s
JOIN 
    grades AS g ON s.id = g.student_id
JOIN 
    subjects AS subj ON g.subject_id = subj.id
JOIN 
    groups AS gr ON s.group_id = gr.id
where 
	(gr.name = 'Group A'
    AND subj.subject_name = 'Physics')
ORDER BY 
	g.grade DESC;
    