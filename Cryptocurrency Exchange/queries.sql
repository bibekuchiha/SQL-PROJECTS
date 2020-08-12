--1. Let’s start by checking out the whole transactions table:
 SELECT *
FROM transactions;

--2. What is the total money_in in the table?
SELECT SUM(money_in)
FROM transactions;

--3. What is the total money_out in the table?
SELECT SUM(money_out)
FROM transactions;

--4.a How many money_in transactions are in this table?
SELECT COUNT(money_in)
FROM transactions;

--4.b How many money_in transactions are in this table where ‘BIT’ is the currency?
SELECT COUNT(money_in)
FROM transactions
WHERE currency = 'BIT';

-- 5. What was the largest transaction in this whole table? 
--Was it money_in or money_out?
SELECT MAX(money_in) ,MAX(money_out)
FROM transactions; 

--6. What is the average money_in in the table for the currency Ethereum (‘ETH’)?
SELECT AVG(money_in)
FROM transactions
WHERE currency = 'ETH';

--7. Select date, average money_in, and average money_out from the table.And group everything by date.

SELECT date, ROUND(AVG(money_in),2),ROUND(AVG(money_out),2)
FROM transactions
GROUP BY date;
