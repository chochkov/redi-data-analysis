#### Exercises for class III.

* Revisit last example from II/.
* All revenue by region for product `whiskey`
* All revenue by city for a list of given regions: Bavaria, Saarland and Baden
* All revenue by city, and region for a list of given regions: Bavaria, Saarland and Baden
* All revenue by month
  - using `extract(month from order_date)` (see I./)
  - using `date_trunc('month', order_date)` - Oh! What an output!
  - introduce the date functions from the Docs:
    https://www.postgresql.org/docs/current/static/functions-datetime.html
* All revenue grouped by a pair of attributes `(region, quarter)`
* Number of orders by product name and quantity of the order - i.e. `(products.name, orders.quantity)`
