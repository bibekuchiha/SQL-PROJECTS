-- This is the first query:

SELECT DISTINCT year FROM population_years;

-- Add your additional queries below:

--What is the largest population size fOR Gabon in this dataset?:

SELECT * FROM population_years
WHERE country = 'Gabon';

--What were the 10 lowest population countries in 2005?

SELECT * FROM population_years
WHERE year = '2005'
ORDER BY population ASC
LIMIT 10;

--What are all the DISTINCT countries with a population of over 100 million in the year 2010?

SELECT DISTINCT country FROM population_years
WHERE year = '2010'
AND population > 100;

--How many countries in this dataset have the wORd “IslANDs” in their name?

SELECT * FROM population_years
WHERE country LIKE '%IslAND%';

--What is the difference in population between 2000 AND 2010 in Indonesia? Note: it’s okay to figure out the difference by hAND after pulling the cORrect data.

SELECT * FROM population_years
WHERE country = 'Indonesia'
AND year = 2000
OR country = 'Indonesia'
AND year = 2010;