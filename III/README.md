#### Exercises for class III.

* Revisit last example from II/.
* All revenue by region for product `whiskey`
* All revenue by city for a list of given regions: Brandenburg, Lower Saxony and Baden
* All revenue by month
  - using `extract(month from order_date)` (see I./)
  - using `date_trunc('month', order_date)` - Oh! What an output!
  - introduce the date functions from the Docs:
    https://www.postgresql.org/docs/current/static/functions-datetime.html
* All revenue by quarter using `extract(quarter from order_date)`
* All revenue by a cube `(region, quarter)` (but without the `CUBE` keyword!)
* Group orders by `(product, quantity)`

  ```SQL
  SELECT products.name, orders.quantity, COUNT(*)
  FROM orders JOIN products ON products.id = orders.product_id
  GROUP BY (products.name, orders.quantity)
  ORDER BY (products.name, COUNT(*))
  ```
