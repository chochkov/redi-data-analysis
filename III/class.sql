-- In addition to the script.sql, we run the following queries in class.

-- 1. Report the number of sales and the total revenue grouped by name of product, region and month.

SELECT
  products.name AS product_name,
  customers.region,
  date_trunc('month', customers.signup_date) AS month_of_sale,
  count(*) AS sales_count,
  sum(products.price * orders.quantity) AS sales_revenue
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id
GROUP BY products.name, customers.region, date_trunc('month', customers.signup_date)
ORDER BY product_name, region, month_of_sale;

-- 2. Similar report to the above, but we filter for cities that are weak-performers. Note the HAVING clause in this query,
-- which excludes the groups having less than 500$ revenue.
SELECT
  customers.city,
  date_trunc('year', customers.signup_date) AS year_of_sale,
  count(*) AS sales_count,
  sum(products.price * orders.quantity) AS sales_revenue
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id
WHERE products.name = 'watch'
GROUP BY customers.city, date_trunc('year', customers.signup_date)
HAVING sum(products.price * orders.quantity) < 500
ORDER BY city, year_of_sale;

-- 2. Report the revenue development per month for products whiskey and book. Note how in this case we only need to
-- join data from tables orders and products
SELECT date_trunc('month', orders.order_date) as month, sum(products.price * orders.quantity) as revenue
FROM orders
JOIN products ON products.id = orders.product_id
WHERE products.name IN ('whiskey', 'book')
GROUP BY date_trunc('month', orders.order_date)
ORDER BY month;
