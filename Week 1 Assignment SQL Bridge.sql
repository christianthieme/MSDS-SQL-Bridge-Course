-- Question 1: Which destination is furthest distance away? 
-- Answer 1: dest = "HNL" which is Honolulu International Airport (SQL below):
SELECT * 
FROM flights.flights
ORDER BY distance DESC
LIMIT 1;

-- --------------------------------------------------------------------------------------------------

-- Question 2a: What are the different numbers of engines in the planes table? 
-- Answer 2a: Based on the below query, there are planes with 1,2,3 and 4 engines.
SELECT 
DISTINCT(engines)
FROM flights.planes;

-- Question 2b: For each number of engines from the above query, which aircraft (model) has the most number of seats?
-- Answer 2b.1: OTTER DHC-3, 16 seats
SELECT 
*
FROM flights.planes
WHERE engines = 1
ORDER BY seats DESC
LIMIT 1;

-- Answer 2b.2: Model 777-222 (whole 200 series), 400 seats
SELECT 
*
FROM flights.planes
WHERE engines = 2
ORDER BY seats DESC
LIMIT 1;

-- Answer 2b.3: Model A330-223, 379 seats
SELECT 
*
FROM flights.planes
WHERE engines = 3
ORDER BY seats DESC
LIMIT 1;

-- Answer 2b.4: Model 747-451, 450 seats
SELECT 
*
FROM flights.planes
WHERE engines = 4
ORDER BY seats DESC
LIMIT 1;

-- ----------------------------------------------------------------------------------------------------

-- Question 3: Show the total number of flights: 
-- Answer 3: The total number of flights is 336,776 given by the below query
SELECT COUNT(*) 
FROM flights.flights; 

-- ----------------------------------------------------------------------------------------------------

-- Question 4: Show the total number of flights by carrier: 
-- Answer 4: The total number of flights by carrier is given by the following query:
SELECT 
carrier, 
COUNT(*) as flight_count
FROM flights.flights 
GROUP by carrier;

-- ----------------------------------------------------------------------------------------------------

-- Question 5: Show all of the airlines, ordered by number of flights in descending order 
-- Answer 5: The total number of flights by carrier in DESC order is given by the following query

SELECT 
carrier, 
COUNT(*) as flight_count
FROM flights.flights 
GROUP by carrier
ORDER by flight_count DESC;

-- ----------------------------------------------------------------------------------------------------

-- Question 6: Show only top 5 airlines, by number of flights, ordered by number of flights in descending order
-- Answer 6: Given by the following query:

SELECT 
carrier, 
COUNT(*) as flight_count
FROM flights.flights 
GROUP by carrier
ORDER by flight_count DESC
LIMIT 5;

-- ------------------------------------------------------------------------------------------------------------

-- Question 7: Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
-- flights in descending order
-- Answer 7: Given by the following query: 

SELECT 
carrier, 
COUNT(*) as flight_count
FROM flights.flights 
WHERE distance > 1000
GROUP by carrier
ORDER by flight_count DESC
LIMIT 5;

-- ------------------------------------------------------------------------------------ 
-- Question 8: Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
-- write down both the question, and the query that answers the question.

-- My question: Which plane (tailnum) completed the most flights (ignoring nulls)? 
-- Answer from query: N725MQ
-- Query to answer: 

SELECT  
tailnum, 
COUNT(*) as num_flights 
from flights.flights
WHERE tailnum <> ''
GROUP BY tailnum 
ORDER BY num_flights DESC
LIMIT 1;


-- -----------------------------------------------------------------------------------------
