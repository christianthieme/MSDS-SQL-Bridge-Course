-- Week 3 Assignment SQL Bridge
-- 1/18/2020
-- Christian Thieme

-- -------------------- CREATION AND POPULATIONS OF TABLES AND LINK TABLES -----------------------------------------------------

-- Creation and population of employee table to hold the employee id, name, and the department id that each employee belongs to
CREATE TABLE key_card.employee (
employee_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
emp_name VARCHAR (200) NOT NULL, 
dept_id INT
);

INSERT INTO key_card.employee 
(emp_name, dept_id)
VALUES 
('Modesto', 1),
('Ayine', 1),
('Chrisopher', 2), 
('Cheong woo', 2), 
('Salut', 3), 
('Heidy', NULL);

-- Creation and population of the department table holding the department id and and department names of all departments
CREATE TABLE key_card.department (
department_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
dept_name VARCHAR (200) NOT NULL
);

INSERT INTO key_card.department 
(dept_name)
VALUES 
('I.T.'),
('Sales'),
('Administration'), 
('Operations');

-- Creation and population of rooms table holding the room id and the room name of all available rooms
CREATE TABLE key_card.rooms (
room_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
room_name VARCHAR (200) NOT NULL
);

INSERT INTO key_card.rooms 
(room_name)
VALUES 
('101'),
('102'),
('Auditorium A'), 
('Auditorium B');

-- Creation and population of dept_room_access table which will be the linking table between department
-- and rooms for the many to many relationship
CREATE TABLE key_card.dept_room_access (
dept_ac_id INT NOT NULL, 
room_ac_id INT
);

INSERT INTO key_card.dept_room_access 
(dept_ac_id, room_ac_id)
VALUES 
(1,1),
(1,2),
(2,2), 
(2,3); 

-- ------------------------------------- Completing Challenges -----------------------------------------------------------------
--  Write a SELECT statement that provides all groups, and the users in each group. 
-- A group should appear even if there are no users assigned to the group.
SELECT 
d.dept_name as "Group",
e.emp_name as "User"
FROM key_card.department d 
LEFT JOIN key_card.employee e ON d.department_id = e.dept_id;


--  Write a SELECT statement that provides all rooms, and the groups assigned to each room. 
-- The rooms should appear even if no groups have been assigned to them.
SELECT 
r.room_name as "Room",
d.dept_name as "Group"
FROM key_card.rooms r 
LEFT JOIN key_card.dept_room_access da ON r.room_id = da.room_ac_id
LEFT JOIN key_card.department d ON da.dept_ac_id = d.department_id;


--  Write a SELECT statement that provides a list of users, the groups that they belong to, and the rooms to which they are assigned. 
-- This should be sorted alphabetically by user, then by group, then by room.
SELECT 
e.emp_name as "User", 
d.dept_name as "Group", 
r.room_name as "Room"
FROM key_card.employee e
LEFT JOIN key_card.department d ON e.dept_id = d.department_id
LEFT JOIN key_card.dept_room_access da ON d.department_id = da.dept_ac_id
LEFT JOIN key_card.rooms r ON da.room_ac_id = r.room_id
ORDER BY e.emp_name, d.dept_name, r.room_name ASC




