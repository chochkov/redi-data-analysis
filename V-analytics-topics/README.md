# Frequent problems to solve when doing analytics

The idea here is to outline some problems that are common, that we give them
names and we identify solutions that are applicable on more general datasets.

## Top N in groups

This is the problem of selecting say the top 5 selling products by country. This
problem appears *all the time* and I encourage you to look a solution up on
Internet in your favourite technology.

## Duplications (identify and delete)

Look at this dataset - it has duplicated records. How to delete them?

| order_date | product_id | market |
| -----------|---------|--------|
| 2016-01-01 | A       | de     |
| 2016-01-01 | A       | de     |
| 2016-01-01 | A       | uk     |
| 2016-01-01 | A       | ru     |
| 2016-01-01 | A       | ru     |
| 2016-01-02 | A       | uk     |
| 2016-01-01 | B       | uk     |
| 2016-01-01 | B       | de     |
| 2016-01-02 | C       | ru     |

The example below is using `data.table` in `R`.

```R
library(data.table)
dat <- data.table::fread('data.csv')
dat[, duplicated:=.N > 1, by=.(order_date, product_id, market)]
dat <- dat[duplicated == 1]
dat[, duplicated:=NULL]
```

And now the same in SQL.

```sql
drop table if exists orders;
create table orders (order_date date, product_id text, market text);

insert into orders (
  values
('2016-01-01', 'A', 'de'),
('2016-01-01', 'A', 'de'),
('2016-01-01', 'A', 'uk'),
('2016-01-01', 'A', 'ru'),
('2016-01-01', 'A', 'ru'),
('2016-01-02', 'A', 'uk'),
('2016-01-01', 'B', 'uk'),
('2016-01-01', 'B', 'de'),
('2016-01-02', 'C', 'ru')
);

delete from orders where exists (
  select order_date, product_id, market from (
    select *, row_number() over (partition by order_date, product_id, market) as rank
    from orders
  ) temp
  where rank > 1
  and orders.order_date = temp.order_date
  and orders.product_id = temp.product_id
  and orders.market = temp.market
);

select * from orders;
```

After applying the above SQL the resulting table is cleared from duplicates.

|order_date | product_id | market |
|-----------|------------|-------- |
|2016-01-01 | A          | uk |
|2016-01-02 | A          | uk |
|2016-01-01 | B          | uk |
|2016-01-01 | B          | de |
|2016-01-02 | C          | ru |

NOTE: Both of these examples are advanced subjects. Don't worry if you don't
understand them, the idea of this class is to give you an illustration common
solutions applied to identical problems.

NOTE: The above SQL uses Window Functions from Postgres, namely the
`row_number() over (...)` part. You are encouraged to learn more about Window
Functions here
https://www.postgresql.org/docs/current/static/tutorial-window.html

## Count of counts

The data below is denormalized and could be the result from joining of
normalized tables. This is however a typical dataset that we might be working on
in memory. In this case the dataset represents the orders of products per day
and market.

| date       | prod_id | market |
| -----------|---------|-------- |
| 2016-01-01 | A       | de      |
| 2016-01-01 | A       | uk      |
| 2016-01-01 | A       | ru      |
| 2016-01-02 | A       | uk      |
| 2016-01-02 | A       | ru      |
| 2016-01-01 | B       | us      |
| 2016-01-01 | B       | uk      |
| 2016-01-01 | B       | de      |
| 2016-01-01 | B       | ru      |
| 2016-01-02 | C       | de      |
| 2016-01-02 | C       | ru      |

We can arrive at the dataset below by counting number of markets per date and
product.

| prod_id | date       | number_of_markets |
| --------|------------|------- |
| B       | 2016-01-01 | 4      |
| A       | 2016-01-01 | 3      |
| A       | 2016-01-02 | 2      |
| C       | 2016-01-02 | 2      |

Now let's get the final report like:

| number_of_markets | date       | number_of_products |
| -------------|------------|----------------|
| 2            | 2016-01-02 | 2              |
| 3            | 2016-01-01 | 1              |
| 4            | 2016-01-01 | 1              |

We read this so: On `2016-01-01` we have 2 products appearing on 2 markets and
1 product appearing on 1 market. On `2016-01-02` we have 1 product appearing
in 4 markets.

Now we could plot this dataset and visualize the spread of our products with the
growth of sales. Note that we could apply the top-N in group solution from above
to get the top, say, 5 pairs per day and visualize the development of the growth
over time with annimated movement of each of the top 5 colours over time.

The full SQL illustrating this is below.

```sql
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (order_date date, product_id text, market text);

INSERT INTO orders (
  VALUES
  ('2016-01-01', 'A', 'de'),
  ('2016-01-01', 'A', 'uk'),
  ('2016-01-01', 'A', 'ru'),
  ('2016-01-02', 'A', 'uk'),
  ('2016-01-02', 'A', 'ru'),
  ('2016-01-01', 'B', 'us'),
  ('2016-01-01', 'B', 'uk'),
  ('2016-01-01', 'B', 'de'),
  ('2016-01-01', 'B', 'ru'),
  ('2016-01-02', 'C', 'de'),
  ('2016-01-02', 'C', 'ru')
);

SELECT number_of_markets, order_date, count(*) AS number_of_products
FROM (
  SELECT product_id, order_date, count(*) AS number_of_markets
  FROM orders
  GROUP BY order_date, product_id
  ORDER BY number_of_markets DESC, product_id ASC
) tbl_name
GROUP BY number_of_markets, order_date
```

## TODO: Aggregate & unnest - order in aggregate functions - PG specific
https://www.postgresql.org/docs/current/static/sql-expressions.html#SYNTAX-AGGREGATES
