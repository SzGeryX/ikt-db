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

