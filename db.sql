CREATE DATABASE mystery CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

use mystery;

CREATE TABLE detective (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    experience int,
    birthYear int,
    imgPath VARCHAR(255)
);


CREATE TABLE suspect (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    age int,
    height int,
    hairColor VARCHAR(255),
    eyeColor VARCHAR(255),
    married BOOLEAN,
    imgPath VARCHAR(255)
);

CREATE TABLE question (
    id int PRIMARY KEY AUTO_INCREMENT,
    questioner int,
    questionee int,
    FOREIGN KEY (questioner) REFERENCES detective(id),
    FOREIGN KEY (questionee) REFERENCES suspect(id)
);

INSERT INTO suspect VALUES
(1, 'John Doe', 34, 180, 'Brown', 'Blue', FALSE, "https://cdn.discordapp.com/attachments/1100152653201281044/1376267683032596480/0C8305A3-237E-40F5-A285-872B02918F7E.jpg?ex=6834b4a9&is=68336329&hm=41a8c62e8b3c07c4c572812be404e66bfd7e86d8188b4041e135297bd8f2d82d&"),
(2, 'Jane Smith', 28, 165, 'Blonde', 'Green', TRUE, null),
(3, 'Carlos Ruiz', 41, 175, 'Black', 'Brown', TRUE, null),
(4, 'Emily Chen', 30, 160, 'Black', 'Hazel', FALSE, null),
(5, 'Ahmed Hassan', 36, 170, 'Brown', 'Black', TRUE, null),
(6, 'Lara Novak', 25, 168, 'Red', 'Blue', FALSE, null),
(7, 'Victor Ivanov', 45, 185, 'Grey', 'Green', TRUE, null),
(8, 'Amina Yusuf', 32, 158, 'Black', 'Brown', FALSE, null),
(9, 'Brian Thompson', 39, 182, 'Blonde', 'Blue', TRUE, null),
(10, 'Sophia Rossi', 27, 162, 'Brown', 'Hazel', FALSE, null),
(11, 'Rober Jefferson', 27, 162, 'Blue', 'Green', FALSE, null);


INSERT INTO detective VALUES
(1, 'Alice Monroe', 12, 1983, null),
(2, 'David Kim', 8, 1987, null),
(3, 'Maria Gonzalez', 15, 1980, null),
(4, 'Liam O\'Connor', 5, 1992, null),
(5, 'Chen Wei', 20, 1975, null),
(6, 'Peter Bale', 1, 2000, null);

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
