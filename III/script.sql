-- This script solves the `SELECT` exercises from class III/ based on the
-- database from class II/.
--

--------------------------------------------
-- I. All revenue by region for product `whiskey`
--
--   * The only change to the query from last course would be that we apply
--   filtering (include only some of the rows). We do this by adding the
--   `WHERE`.
SELECT region, SUM(price * quantity) AS revenue
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id
WHERE products.name = 'whiskey'
GROUP BY region
ORDER BY revenue DESC;
--
--         region         | revenue
--------------------------+---------
-- Hamburg                | 4890.60
-- Berlin                 | 4062.96
-- Saarland               | 2558.16
-- Bremen                 | 1956.24
-- Baden                  | 1053.36
-- Bavaria                |  827.64
-- Hesse                  |  677.16
-- North Rhine-Westphalia |  601.92
-- Saxony-Anhalt          |  150.48
--------------------------------------------

--------------------------------------------
-- II. All revenue by city for a list of given regions: Bavaria, Saarland and Baden
--
--   * 2 changes - one in the grouping (`GROUP BY`) and one in the filtering (`WHERE`).
SELECT city, SUM(price * quantity) AS revenue
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id
WHERE customers.region IN ('Bavaria', 'Saarland', 'Baden')
GROUP BY city
ORDER BY revenue DESC;
--    city     | revenue
---------------+---------
-- Völklingen  | 2092.64
-- Geesthacht  | 1531.26
-- Schweinfurt |  817.08
-- Aalen       |  765.05
-- Passau      |  677.16
-- Flensburg   |  624.99
-- ... (more rows omitted)
--------------------------------------------

--------------------------------------------
-- III. All revenue by city, and region for a list of given regions: Bavaria, Saarland and Baden
--
--   * Now we only need to add a second grouping argument. Notice we have to add it both
--   on the `GROUP BY` clause and on the `SELECT` clause.
--   * However now we have more attributes on the result (we added region) and
--   we'd better change the `ORDER BY` accordingly.
SELECT region, city, SUM(price * quantity) AS revenue
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id
WHERE customers.region IN ('Bavaria', 'Saarland', 'Baden')
GROUP BY (region, city)
ORDER BY region, revenue DESC;
--
--  region  |    city     | revenue
------------+-------------+---------
-- Baden    | Aalen       |  765.05
-- Baden    | Baden-Baden |  616.97
-- Baden    | Konstanz    |  524.30
-- Baden    | Göppingen   |  255.85
-- Baden    | Freiburg    |  225.74
-- Bavaria  | Schweinfurt |  817.08
-- Bavaria  | Passau      |  677.16
-- Bavaria  | Erlangen    |  171.30
-- ...
--------------------------------------------

--------------------------------------------
-- IV. ALL revenue by month:
--
--  * Using `extract(month from order_date)`
--  * Using `date_trunc('month', order_date)` - just the extract with date_trunc!
--  * Notice that date_trunc is better because if the data ranges over multiple
--  years, you probably want the months for *all* years to appear separately.
SELECT extract(month from order_date) AS month_number, SUM(price * quantity) AS revenue
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id
GROUP BY month_number
ORDER BY month_number DESC;
--
-- month_number | revenue
----------------+---------
--           12 | 5789.61
--           11 | 5292.01
--           10 | 5064.18
-- ...
--------------------------------------------

--------------------------------------------
-- V. All revenue grouped by a pair of attributes `(region, quarter)`
--
SELECT region, extract(quarter from order_date) AS quarter, SUM(price * quantity) AS revenue
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id
GROUP BY region, quarter
ORDER BY region, quarter ASC;
--
--         region         | quarter | revenue
--------------------------+---------+---------
-- Baden                  |       2 | 1530.12
-- Baden                  |       3 |  782.55
-- Baden                  |       4 |   75.24
-- Bavaria                |       1 |  333.30
-- Bavaria                |       2 |  848.46
-- Bavaria                |       3 |  150.48
-- Bavaria                |       4 |  333.30
-- Berlin                 |       1 | 2340.41
-- Berlin                 |       2 | 4696.66
-- Berlin                 |       3 | 4522.99
-- Berlin                 |       4 | 4976.10
--------------------------------------------

--------------------------------------------
-- VI. Number of orders by product name and quantity of the order - i.e. `(products.name, orders.quantity)`
--
--   * Notice how the `ASC` and `DESC` clauses in `ORDER BY` are applied per
--   attribute. Below we order ascending by product_name but descending by
--   number_of_orders, because we're interested in the orders most
--   quantity per product.
--   * Notice the new `COUNT` aggregation function - it counts the number of
--   rows (i.e. records) per group.
--
SELECT products.name AS product_name, quantity, COUNT(*) AS number_of_orders
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id
GROUP BY (products.name, quantity)
ORDER BY product_name ASC, number_of_orders DESC;
--
-- product_name | quantity | number_of_orders
----------------+----------+------------------
-- book         |        2 |               24
-- book         |        6 |               20
-- book         |        4 |               14
-- book         |        1 |               13
-- book         |        3 |               12
-- book         |        5 |               12
-- book         |        8 |               11
-- book         |        7 |                9
-- book         |        9 |                8
-- book         |       10 |                5
-- watch        |        8 |               12
-- watch        |        4 |               11
-- watch        |        6 |               11
-- ...
