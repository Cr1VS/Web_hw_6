-- Знайти середній бал на потоці (по всій таблиці оцінок).


SELECT 
    ROUND(AVG(grade)) AS avg_grade
FROM 
    grades;


-- Знайти середній бал на для кожноЇ группи.


SELECT 
	grou.id,
	grou.name,
	ROUND(AVG(g.grade)) AS avg_grade
FROM 
    grades AS g
JOIN 
    students AS s ON g.student_id = s.id 
JOIN 
    groups AS grou ON s.group_id = grou.id
GROUP BY  
    grou.id, grou.name
ORDER BY
    avg_grade DESC;
    