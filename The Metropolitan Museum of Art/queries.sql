 --1. What are the column names?

 SELECT * FROM met 
 LIMIT 10;

 --2. How many pieces are in the American Decorative Art collection?
 SELECT COUNT(*)
 FROM met;

 --3. Count the number of pieces where the category includes ‘celery’.

 SELECT DISTINCT category, COUNT(*)
FROM met
WHERE category LIKE '%celery%';

--4. Find the title and medium of the oldest piece(s) in the collection.
SELECT date, title , medium
FROM met
GROUP BY date
ORDER BY date ASC;

--5. Find the top 10 countries with the most pieces in the collection.
SELECT country, COUNT(*)
FROM met
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 10;

--6. Find the categories HAVING more than 100 pieces. 
SELECT category, COUNT(*)
FROM met
GROUP BY 1
HAVING COUNT(*)>100;
--7 Count the number of pieces where the medium contains ‘gold’ or ‘silver’.

SELECT medium, COUNT(*)
FROM met
WHERE medium LIKE '%gold%'
   OR medium LIKE '%silver%'
GROUP BY 1
ORDER BY 2 DESC;
