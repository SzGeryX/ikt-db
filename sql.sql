CREATE DATABASE mystery CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

use mystery;

CREATE TABLE detective (
    id int PRIMARY KEY,
    name VARCHAR(255),
    experience int,
    birthYear int
);

CREATE TABLE suspect (
    id int PRIMARY KEY,
    name VARCHAR(255),
    age int,
    height int,
    hairColor VARCHAR(255),
    eyeColor VARCHAR(255),
    married BOOLEAN
);

CREATE TABLE question (
    id int PRIMARY KEY,
    questioner int,
    questionee int,
    FOREIGN KEY (questioner) REFERENCES detective(id),
    FOREIGN KEY (questionee) REFERENCES suspect(id)
);

INSERT INTO suspect VALUES
(1, 'John Doe', 34, 180, 'Brown', 'Blue', FALSE),
(2, 'Jane Smith', 28, 165, 'Blonde', 'Green', TRUE),
(3, 'Carlos Ruiz', 41, 175, 'Black', 'Brown', TRUE),
(4, 'Emily Chen', 30, 160, 'Black', 'Hazel', FALSE),
(5, 'Ahmed Hassan', 36, 170, 'Brown', 'Black', TRUE),
(6, 'Lara Novak', 25, 168, 'Red', 'Blue', FALSE),
(7, 'Victor Ivanov', 45, 185, 'Grey', 'Green', TRUE),
(8, 'Amina Yusuf', 32, 158, 'Black', 'Brown', FALSE),
(9, 'Brian Thompson', 39, 182, 'Blonde', 'Blue', TRUE),
(10, 'Sophia Rossi', 27, 162, 'Brown', 'Hazel', FALSE),
(11, 'Rober Jefferson', 27, 162, 'Blue', 'Green', FALSE);

INSERT INTO detective VALUES
(1, 'Alice Monroe', 12, 1983),
(2, 'David Kim', 8, 1987),
(3, 'Maria Gonzalez', 15, 1980),
(4, 'Liam O\'Connor', 5, 1992),
(5, 'Chen Wei', 20, 1975),
(6, 'Peter Bale', 1, 2000);

INSERT INTO question (id, questioner, questionee) VALUES
(1, 1, 3),
(2, 1, 5),
(3, 1, 7),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 3, 4),
(8, 3, 6),
(9, 3, 9),
(10, 4, 1),
(11, 4, 8),
(12, 4, 10),
(13, 5, 2),
(14, 5, 3),
(15, 5, 5),
(16, 1, 6),
(17, 2, 9),
(18, 3, 7),
(19, 5, 10),
(20, 4, 4);

#egy detektiv (Alice Monroe) altal kikerdezett gyanusitottak neve
SELECT suspect.name FROM suspect
INNER JOIN question on suspect.id = question.questionee
INNER JOIN detective on question.questioner = detective.id
WHERE detective.name = "Alice Monroe";

#egy detektiv (Alice Monroe) altal kikerdezett gyanusitottak szama
SELECT COUNT(suspect.id) FROM suspect
INNER JOIN question on suspect.id = question.questionee
INNER JOIN detective on question.questioner = detective.id
WHERE detective.name = "Alice Monroe";

#detektivenkenti kikerdezesek szama
SELECT detective.name, COUNT(suspect.id) as kikerdezettek_szama FROM suspect
INNER JOIN question on suspect.id = question.questionee
RIGHT JOIN detective on question.questioner = detective.id
GROUP BY detective.id;

#minden olyan ember aki magasabb, mint 170cm
SELECT suspect.name from suspect
WHERE height > 170;

#minden olyan ember akinek barna haja van
SELECT suspect.name from suspect
WHERE hairColor = "Brown";

#minden olyan detektiv aki legalabb ket kek szemu embert kikerdezett 
SELECT detective.name as kikerdezettek_szama FROM suspect
INNER JOIN question on suspect.id = question.questionee
INNER JOIN detective on question.questioner = detective.id
WHERE eyeColor = "Blue"
GROUP BY detective.id
HAVING COUNT(detective.id) >= 2;

#egy gyanusitottat hany detektiv kerdezett ki
SELECT suspect.name, COUNT(DISTINCT detective.id) as kikerdezo_detektivek FROM suspect
INNER JOIN question on suspect.id = question.questionee
INNER JOIN detective on question.questioner = detective.id
GROUP BY suspect.id;


