### SQL timeline - 4 classes

#### I-st class:

* Introduce myself and my role at Adjust as well as Postgres's place in the
  Adjust stack (5 min). Announce that the one of the targets of this module
  would be for people to be able to listen and make sense an 5 minute concrete
  introduction to our Postgres our Postgres Architecture.

* Intro to RDBMS (10 min)
  - purpose and examples of why these things exist.
  - mention examples of RDBMS with their basic characteristics.

* Intro to the Relational data model (15 min)
  - concept of schemas, tables and attributes
  - concept of DBMS as collection of tables, a mention of the ACID guarantees
    that transactions bring;
  - teaching example of a table from a Database - e.g. orders
  - primary keys, foreign keys - references between tables in a Database

* Intro to SQL (this would be interactive - 40 min)

  Example of working with tables in a DBMS - Setup a Postgres frontend
  (apparently done already!). The idea here would be to get everybody to write
  basic SQL. In case there are some more advanced members of the class, we would
  prepare a small exercise resulting into them writing an SQL script that would
  create a table, fill in some data, perform several queries on the data and
  drop the table.

  - SQL as a frontend language to many/all RDBMS
  - create schema (Mention of DDL) `CREATE TABLE`, `DROP TABLE`
  - insert into table (Mention of DML) `INSERT INTO`
  - `SELECT` and `SELECT WHERE`

* Read data from a DB server into Excel - (also interactive - 10 min).
  - the idea is to briefly link what has been taught so far (excel skills) with
    what we're teaching now (SQL and DB).

#### II-nd class

Interactive exercise involving:

TODO: come up with good dataset for examples!

* SQL tabs http://www.sqltabs.com/?utm_source=postgresweekly&utm_medium=email for MAC os

* Show this picture http://4.bp.blogspot.com/-2IXAKJouqh4/VG9rvwmgEmI/AAAAAAAAG-Y/G7dcmCAE6L8/s1600/SQL%2BQuery%2Boverview.PNG

* Introduction to data types:
  - `INTEGER`,
  - `NUMERIC`,
  - `DATE/TIME/TIMESTAMP`,
  - `TEXT`,
  - `BOOLEAN`,
  - Create a more complex table examples involving more data types

* DDL - `ALTER TABLE`, `ALTER COLUMN`, `TRUNCATE TABLE` etc.
  - Refer to the data types to change/add column to an existing table;
* DML - `UPDATE`, `DELETE`
* Intro to table JOINs - the Cross Join, the Inner Join
  - Maybe ask people to do it on the table with two simple tables.

    products(id, price, price)
    customers (id, name, address)
    orders (id, customer_id, )

  (mention that relationship is sometimes called `1:N` or 1 to many)
  (but mention that customers to products is called `N:M` or many-to-many)

* Intro to `ORDER BY`, `LIMIT`

* TASKS:

0. Revisit the example from last time with extract month
1. order the customers by `signup_date`
2. how much revenue do we have from users who signed up in january

#### III-nd class (All interactive - emphasize on `scoping` data):

* Introduce this - https://pgexercises.com/questions/basic/

* DML
  - `SELECT/DELETE/UPDATE WHERE`
  - `SELECT/DELETE/UPDATE WHERE LIKE`
  - `SELECT/DELETE/UPDATE WHERE NOT`
  - `SELECT/DELETE/UPDATE WHERE AND/OR`
  - `SELECT/DELETE/UPDATE WHERE <>=!=`
  - `SELECT/DELETE/UPDATE WHERE BETWEEN`
  - `SELECT a+b FROM` - e.g. expressions in attributes
* Advanced table JOINs - the Outer Joins
* More examples involving data types
* More examples involving `ORDER BY`, `LIMIT`
* Intro to `GROUP BY`

#### IV-th class (All interactive - emphasize on `aggregation over groups` of
data):

* Intro to aggregation functions - e.g. `COUNT()`, `SUM()`, etc.
  - mention that this is possibly the most important aspect of SQL to a data
    analyst
* Examples involving `GROUP BY`, `ORDER BY` and aggregation functions;
* Intro to `HAVING` and example of a complex query with everything together;
* Finish the module by a 5 minute introduction to the Adjust Postgres
  architecture.

* Should we mention CUBE / ROLLUP / GROUPING SETS aggregations?
* Should we mention statistical aggregates? (e.g. ORDERED SETS)

TODO: Should we mention Normal Forms and normalization in general?
