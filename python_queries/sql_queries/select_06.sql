-- Знайти в якій группі певний студент.


SELECT 
	s.id,
	s.fullname,
	g.id,
	g.name 
FROM 
	students AS s 
JOIN 
    groups AS g ON g.id = s.group_id 
where 
	s.fullname = 'Mitchell Garcia';


-- Знайти список усіх студентів у певній групі.


SELECT 
	s.id,
	s.fullname,
	g.id,
	g.name 
FROM 
	students AS s 
JOIN 
    groups AS g ON g.id = s.group_id 
where 
	g.name = 'Group C';


-- Знайти список усіх студентів у всіх группах.


SELECT 
	s.id,
	s.fullname,
	g.id,
	g.name 
FROM 
	students AS s 
JOIN 
    groups AS g ON g.id = s.group_id 
	