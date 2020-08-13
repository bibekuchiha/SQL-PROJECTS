/*
Here's the first-touch query, in case you need it
*/

WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
		pv.utm_campaign
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp;

--1. How many campaigns and sources does CoolTShirts use? Which source is used for each campaign?
SELECT COUNT(DISTINCT utm_campaign)
FROM page_visits;
SELECT COUNT(DISTINCT utm_source)
FROM page_visits;
SELECT
DISTINCT utm_campaign,
utm_source
FROM page_visits;

--2. What pages are on the CoolTShirts website?
SELECT DISTINCT page_name
FROM page_visits;

--3. How many first touches is each campaign responsible for?
WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
        pv.utm_campaign,
        COUNT(utm_campaign)
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
GROUP BY utm_campaign
ORDER BY 5 DESC;

--4. How many last touches is each campaign responsible for?
WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
        pv.utm_campaign,
        COUNT(utm_campaign)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
GROUP BY utm_campaign
ORDER BY 5 DESC;

--5. How many visitors make a purchase?

------Count the distinct users who visited the page named 4 - purchase.

SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name = '4 - purchase';

--6. How many last touches on the purchase page is each campaign responsible for?
WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
      WHERE page_name = '4 - purchase'
    GROUP BY user_id)
SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
        pv.utm_campaign,
        COUNT(utm_campaign)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
GROUP BY utm_campaign
ORDER BY 5 DESC;

--7. CoolTShirts can re-invest in 5 campaigns. Given your findings in the project, which should they pick and why?


