 --1. Start by getting a feel for the orders table:
 SELECT *
 FROM orders
 LIMIT 10;

--2. How recent is this data?

 SELECT DISTINCT order_date 
 FROM orders
 ORDER BY order_date DESC;

--3. write a query that selects only the special_instructions column. Limit the result to 20 rows.

SELECT special_instructions
FROM orders 
LIMIT 20;

--4. edit the query so that we are only returning the special instructions that are not empty?

SELECT special_instructions
FROM orders 
WHERE special_instructions IS NOT NULL;
--5.Let’s go even further and sort the instructions in alphabetical order (A-Z).

SELECT special_instructions
FROM orders
WHERE special_instructions IS NOT NULL
ORDER BY special_instructions asc;

--6. Let’s search for special instructions that have the word ‘sauce’.

SELECT special_instructions 
FROM orders
WHERE special_instructions LIKE '%sauce%';

--7. Let’s search for special instructions that have the word ‘door’.
SELECT special_instructions 
FROM orders
WHERE special_instructions LIKE '%door%';

--8.Let’s search for special instructions that have the word ‘box’.
SELECT special_instructions 
FROM orders
WHERE special_instructions LIKE '%box%';

--9. Instead of just returning the special instructions, also return their order ids.

--For more readability:

  --  Rename id as ‘#’
    --Rename special_instructions as ‘Notes’

SELECT id AS '#',
   special_instructions AS 'Notes'
FROM orders
WHERE special_instructions LIKE '%box%';
