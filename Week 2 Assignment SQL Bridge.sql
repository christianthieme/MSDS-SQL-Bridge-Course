-- Week 2 Assignment SQL Bridge
-- 1/06/2020
-- Christian Thieme


-- 1. Creating and populate the videos table: 
CREATE TABLE sql_how_to.videos (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
title VARCHAR (200) NOT NULL, 
length FLOAT, 
url VARCHAR(400) NOT NULL
);

INSERT INTO sql_how_to.videos 
(title, length, url)
VALUES 
('SQL: Combining Multiple Tables', 4.30, 'https://www.youtube.com/watch?v=WrPnAByl7d0&feature=youtu.be'),
('Databases - Episode 6 - Joining Tables', 5.65, 'https://www.youtube.com/watch?v=79EBoVPUzkE&feature=youtu.be'),
('OneToMany', 4.95, 'https://www.youtube.com/watch?v=tX4_j-74lPQ&feature=youtu.be');

-- 2. Create and populate Reviewers table: 
CREATE TABLE sql_how_to.reviewers (
reviewer_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
video_id INT NOT NULL, 
user_name VARCHAR (50) NOT NULL, 
rating INT NOT NULL, 
comments VARCHAR(200) NOT NULL
);

INSERT INTO sql_how_to.reviewers 
(video_id, user_name, rating, comments)
VALUES 
(1, 'charmanderslug45', 5, 'absolutely the best video ive ever seen hands down!'),
(1, 'sharkbait74', 1, 'absolutely the worst video ever made - skip this!'),
(2, 'pimpleeater', 2, 'this video is meh...'),
(2, 'canopenerface', 3, 'luke warm video - where is the passion?!'),
(3, 'pizzparty93', 5, 'Better than Star Wars!'),
(3, 'cantonesemeatpie58', 1, 'About as good as a chick flic...');

-- 3. Report on Video Reviews
SELECT 
r.reviewer_id, 
r.user_name,
r.video_id, 
v.title, 
r.rating,
r.comments,
v.length, 
v.url
FROM sql_how_to.reviewers r
LEFT JOIN sql_how_to.videos v ON r.video_id = v.id
ORDER BY r.video_id





