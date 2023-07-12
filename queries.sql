-- owners
-- id | first_name | last_name

-- vehicles
-- id |  make  |  model  | year |  price   | owner_id

-- first query
SELECT *
  FROM owners
  JOIN vehicles
    ON owners.id = vehicles.owner_id;

-- SELECT * FROM owners o 
--   FULL OUTER JOIN vehicles v 
--     ON o.id=v.owner_id;

-- second query
SELECT first_name, last_name, COUNT(*) as count
  FROM owners
  JOIN vehicles
    ON owners.id = vehicles.owner_id
  GROUP BY first_name, last_name
  ORDER BY count;

-- SELECT first_name, last_name, 
--   COUNT(owner_id) FROM owners o 
--   JOIN vehicles v on o.id=v.owner_id 
--   GROUP BY (first_name, last_name) 
-- ORDER BY first_name;

-- third query
SELECT owners.first_name, owners.last_name, ROUND(AVG(vehicles.price)) AS average_price, COUNT(*) AS count
FROM owners
JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.first_name, owners.last_name
HAVING COUNT(*) > 1 AND AVG(vehicles.price) > 10000
ORDER BY owners.first_name DESC;

-- SELECT 
--   first_name, last_name, 
--   ROUND(AVG(price)) as average_price, 
--   COUNT(owner_id) 
-- FROM owners o 
-- JOIN vehicles v on o.id=v.owner_id 
-- GROUP BY 
--   (first_name, last_name) 
-- HAVING 
--   COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
-- ORDER BY first_name DESC;
