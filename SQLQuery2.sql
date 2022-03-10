--STEP 1:
SELECT * 
FROM Grade

--STEP 2: 
SELECT *
FROM Emotion

--STEP 3:
SELECT COUNT(Poem.Id) as numPoems
FROM Poem;

--STEP 4:
SELECT TOP 76 Name
FROM Author
ORDER BY Author.Name;

--STEP 5:
SELECT TOP 76 a.Name, g.name
FROM Author a
Join Grade g ON a.GradeId = g.Id;

--STEP 6:
SELECT TOP 76 a.Name, g.name, gen.Name
FROM Author a
Join Grade g ON a.GradeId = g.Id
JOIN Gender gen ON a.GenderId = gen.Id
ORDER BY a.Name;

--STEP 7:
SELECT SUM(WordCount) as totalWords
FROM Poem;

--STEP 8:
SELECT TOP(1) Title, CharCount
FROM Poem
ORDER BY Poem.CharCount;

--STEP 9:
SELECT COUNT(Author.Id) as numAuthors
FROM Author
Join Grade g ON Author.GradeId = g.Id
WHERE g.Name = '3rd Grade';

--STEP 10:
SELECT COUNT(Author.Id) as numAuthors
FROM Author
Join Grade g ON Author.GradeId = g.Id
WHERE g.Name = '1st Grade' OR g.Name = '2nd Grade' OR g.Name = '3rd Grade';

--STEP 11:
SELECT COUNT(Poem.Id) as PoemCount, g.Name
FROM Author
JOIN Poem ON Author.Id = Poem.AuthorId
JOIN Grade g ON Author.GradeId = g.Id
WHERE g.Name = '4th Grade';

--STEP 12:
SELECT COUNT(Poem.Id) as PoemCount, g.Name
FROM Author
JOIN Poem ON Author.Id = Poem.AuthorId
JOIN Grade g ON Author.GradeId = g.Id
GROUP BY g.Name, g.Id;

--STEP 13:
SELECT COUNT(Author.Id) as AuthorCount, g.Name
FROM Author
JOIN Grade g ON Author.GradeId = g.Id
GROUP BY g.Name

--STEP 14:
SELECT TOP(1) Title, WordCount
FROM Poem
ORDER BY WordCount DESC

--STEP 15:
SELECT TOP(10) a.Name, a.Id, COUNT(p.Id) as PoemCount
FROM Author a
JOIN Poem p ON a.Id = p.AuthorId
GROUP BY a.Id, a.Name
ORDER BY PoemCount DESC;

--STEP 16:
SELECT COUNT(p.Id) PoemCount, e.Name
FROM PoemEmotion pe
JOIN Poem p ON pe.PoemId = p.Id
JOIN Emotion e ON pe.EmotionId = e.Id
WHERE e.Name = 'sadness'
GROUP BY e.Name;

--STEP 17:
SELECT COUNT(p.Id) PoemCount
FROM PoemEmotion pe
RIGHT JOIN Poem p ON pe.PoemId = p.Id
WHERE pe.EmotionId IS NULL

--STEP 18:
SELECT TOP(1) e.Name, COUNT(p.Id) as PoemCount
FROM PoemEmotion pe
JOIN Poem p ON pe.PoemId = p.Id
JOIN Emotion e ON pe.EmotionId = e.Id
GROUP BY e.Name
ORDER BY COUNT(p.Id) DESC;

--STEP 19:
SELECT TOP(1) g.Name, e.name, COUNT(p.Id) as PoemCount
FROM Poem p
JOIN PoemEmotion pe ON p.Id = pe.PoemId
JOIN Emotion e ON pe.EmotionId = e.Id
JOIN Author ON p.AuthorId = Author.Id
JOIN Grade g ON Author.GradeId = g.Id
WHERE e.Name = 'Joy'
GROUP BY g.Name, e.Name
ORDER BY COUNT(p.Id) DESC;

--STEP 20:
SELECT TOP(1) g.Name, e.name, COUNT(p.Id) as PoemCount
FROM Poem p
JOIN PoemEmotion pe ON p.Id = pe.PoemId
JOIN Emotion e ON pe.EmotionId = e.Id
JOIN Author ON p.AuthorId = Author.Id
JOIN Gender g ON Author.GenderId = g.Id
WHERE e.Name = 'Fear'
GROUP BY g.Name, e.Name
ORDER BY COUNT(p.Id);