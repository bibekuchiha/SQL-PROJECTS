--1. What are the top five stories with the highest scores?

 SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;
--2. find the total score of all the stories.
SELECT SUM(score)
FROM hacker_news;

--3. Find the individual users who have gotten combined scores of more than 200, and their combined scores.

SELECT user,SUM(score)
 FROM hacker_news
GROUP BY user
HAVING sum(score) > 200 
ORDER BY 2 DESC;
--4. So, is Hacker News dominated by these users?
SELECT (517 + 309 + 304 + 282) / 6366.0;

--5. The url of the video is:

--https://www.youtube.com/watch?v=dQw4w9WgXcQ

--How many times has each offending user posted this link?
SELECT user,
   COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY user
ORDER BY COUNT(*) DESC;

--6. Which of these sites feed Hacker News the most:

--_GitHub, Medium, or New York Times?_
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
    WHEN url LIKE '%medium.com%' THEN 'Medium'
    WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
    ELSE 'other'
  END AS 'Source'
FROM hacker_news;

--7. Add a column for the number of stories from each URL using COUNT().

--Also, GROUP BY the CASE statement.

---Remember that you can refer to a column in GROUP BY using a number.
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
    WHEN url LIKE '%medium.com%' THEN 'Medium'
    WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
    ELSE 'other'
  END AS 'Source',
  COUNT(*)
FROM hacker_news
GROUP BY 1;

--8. What’s the best time of the day to post a story on Hacker News?

--Before we get started, let’s run this query and take a look at the timestamp column:
SELECT timestamp
FROM hacker_news
LIMIT 10;

--9.SQLite comes with a strftime() function - a very powerful function that allows you to return a formatted date. 
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

--10.  Let’s write a query that returns three columns:

----    The hours of the timestamp
 --   The average score for each hour
   -- The count of stories for each hour

SELECT strftime('%H', timestamp),
   AVG(score),
   COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 1
;

--11. What are the best hours to post a story on Hacker News?
SELECT strftime('%H', timestamp) AS 'Hour',
   ROUND(AVG(score),1) AS 'AVG SCORE',
   COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 1
;

