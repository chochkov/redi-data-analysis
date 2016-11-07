-- This script loads three tables with data in the database. The data is
-- generated randomly and represents a basic E-Commerce database:
--
--    `customers` table contains personal data for each customer.
--    `products` table contains descriptions for the products on sale.
--    `orders` table contains the history of all products that customers bought.
--
-- Our target for this class would be to introduce the concept the SQL
-- JOIN, GROUP BY and ORDER BY concepts. We'd also introduce the aggregation
-- function `SUM` from SQL.
--
-- Once we've done this, we can answer the question 'What is the total revenue
-- from the orders our customers created grouped by region in Germany.'
--
-- To execute this script, simply paste it into your PostgreSQL console (PGAdmin or psql).
--
-- ---
--
-- I. At first we define the table structures and insert some random data.
--
CREATE TABLE IF NOT EXISTS customers (
  id          integer,
  name        text,
  city        text,
  region      text,
  signup_date date
);
TRUNCATE TABLE customers;

INSERT INTO customers (id, name, city, region, signup_date)
(VALUES
  (1,'Donovan Melton','Berlin','Berlin','2017-08-27'),
  (2,'Jamal Tran','Pinneberg','Saarland','2017-03-27'),
  (3,'Lani Bowen','Erlangen','Bavaria','2015-04-04'),
  (4,'Carissa Scott','Berlin','Berlin','2017-02-10'),
  (5,'Cyrus Crawford','Hamburg','Hamburg','2016-07-24'),
  (6,'Burke Hendrix','Bremen','Bremen','2016-09-20'),
  (7,'Elizabeth Reilly','Peine','Lower Saxony','2015-10-19'),
  (8,'Nell Newman','Nordhorn','Lower Saxony','2016-11-26'),
  (9,'Rama Floyd','Göppingen','Baden','2015-08-31'),
  (10,'Galvin Wooten','Hamburg','Hamburg','2016-10-09'),
  (11,'Hilda Cannon','Hamburg','Hamburg','2017-04-16'),
  (12,'MacKensie Underwood','Offenburg','Baden','2015-09-04'),
  (13,'Laurel Logan','Berlin','Berlin','2017-07-11'),
  (14,'Lenore Grant','Berlin','Berlin','2016-01-13'),
  (15,'Slade Acosta','Berlin','Berlin','2015-10-13'),
  (16,'Martena Little','Passau','Bavaria','2017-11-14'),
  (17,'Timon Carpenter','Hamburg','Hamburg','2017-05-19'),
  (18,'Josiah Campos','Hamburg','Hamburg','2016-07-15'),
  (19,'Justin Gutierrez','Fulda','Hesse','2016-07-18'),
  (20,'Latifah Reid','Bremerhaven','Bremen','2016-07-17'),
  (21,'Amethyst Barnett','Bremen','Bremen','2015-11-13'),
  (22,'Kay Walsh','Leipzig','Saxony','2015-09-18'),
  (23,'Erasmus Harris','Limburg a.d. Lahn','Hesse','2017-03-29'),
  (24,'Nichole Bullock','Hamburg','Hamburg','2017-08-15'),
  (25,'Serina Washington','Bremen','Bremen','2017-10-04'),
  (26,'Colleen Kaufman','Eberswalde-Finow','Brandenburg','2015-04-30'),
  (27,'Hilary Arnold','Schweinfurt','Bavaria','2015-04-14'),
  (28,'Diana Workman','Berlin','Berlin','2017-05-01'),
  (29,'Elizabeth Calhoun','Berlin','Berlin','2017-11-11'),
  (30,'Darius William','Hamburg','Hamburg','2016-08-26'),
  (31,'Latifah Clay','Bremerhaven','Bremen','2017-09-15'),
  (32,'Chancellor Shaw','Hamburg','Hamburg','2016-03-15'),
  (33,'Caldwell Newton','Berlin','Berlin','2015-04-21'),
  (34,'Iona Keller','Hamburg','Hamburg','2017-11-25'),
  (35,'Winter Brown','Hamburg','Hamburg','2015-09-12'),
  (36,'Beck Leach','Berlin','Berlin','2015-02-25'),
  (37,'Julian Bowen','Berlin','Berlin','2017-11-28'),
  (38,'Owen Mcclain','Berlin','Berlin','2015-03-24'),
  (39,'Jaquelyn Melendez','Hamburg','Hamburg','2015-10-01'),
  (40,'Xandra Wilcox','Hamburg','Hamburg','2016-03-04'),
  (41,'Igor Nolan','Berlin','Berlin','2015-08-16'),
  (42,'Gil Brown','Völklingen','Saarland','2015-02-19'),
  (43,'Brielle Bright','Berlin','Berlin','2016-07-18'),
  (44,'Whilemina Bell','Berlin','Berlin','2017-09-16'),
  (45,'Bell Barber','Berlin','Berlin','2015-09-04'),
  (46,'Warren Skinner','Bremen','Bremen','2016-05-08'),
  (47,'Alice Franklin','Berlin','Berlin','2015-06-29'),
  (48,'Hillary Park','Bremen','Bremen','2015-10-05'),
  (49,'Hilary Colon','Worms','Rhineland-Palatinate','2016-03-30'),
  (50,'Graham Singleton','Hamburg','Hamburg','2015-03-31'),
  (51,'Charity Pena','Aachen','North Rhine-Westphalia','2015-01-03'),
  (52,'Judah Ochoa','Berlin','Berlin','2017-10-08'),
  (53,'Medge Jackson','Hamburg','Hamburg','2017-07-25'),
  (54,'Jermaine Holland','Sulzbach','Saarland','2015-03-26'),
  (55,'Daria Lester','Bremen','Bremen','2016-12-02'),
  (56,'Tamara Greene','Wuppertal','North Rhine-Westphalia','2016-08-01'),
  (57,'Kellie Forbes','Berlin','Berlin','2015-04-13'),
  (58,'Chava Galloway','Berlin','Berlin','2016-08-23'),
  (59,'Graiden Barry','Taunusstein','Hesse','2015-05-05'),
  (60,'Emery Coffey','Hamburg','Hamburg','2016-03-26'),
  (61,'Malachi Holman','Quickborn','Saarland','2015-04-04'),
  (62,'Cora Giles','Hamburg','Hamburg','2016-01-21'),
  (63,'Libby Walsh','Bottrop','North Rhine-Westphalia','2017-01-14'),
  (64,'Hamish Beck','Hamburg','Hamburg','2017-05-26'),
  (65,'Halla Greer','Hamburg','Hamburg','2015-12-02'),
  (66,'Imelda Blair','Hamburg','Hamburg','2016-05-07'),
  (67,'Petra Wong','Berlin','Berlin','2015-11-12'),
  (68,'Dara Weber','Solingen','North Rhine-Westphalia','2017-11-08'),
  (69,'Jenna Petty','Bremerhaven','Bremen','2015-05-11'),
  (70,'Georgia Schultz','Bremen','Bremen','2016-01-09'),
  (71,'Camille Owen','Bad Kreuznach','Rhineland-Palatinate','2016-11-12'),
  (72,'Burke Barlow','Flensburg','Saarland','2015-01-07'),
  (73,'Rhona Hickman','Bremerhaven','Bremen','2017-08-04'),
  (74,'Cedric Conway','Berlin','Berlin','2016-05-10'),
  (75,'Josephine Rowland','Baden-Baden','Baden','2015-07-16'),
  (76,'Vivien Dickerson','Völklingen','Saarland','2016-03-14'),
  (77,'Cassady Brown','Hamburg','Hamburg','2015-04-29'),
  (78,'Valentine Mills','Hamburg','Hamburg','2017-03-24'),
  (79,'Lani Duncan','Geesthacht','Saarland','2016-09-08'),
  (80,'Mark Trujillo','Berlin','Berlin','2016-12-02'),
  (81,'Brennan Carroll','Bremerhaven','Bremen','2017-12-26'),
  (82,'Irma Browning','Berlin','Berlin','2017-08-18'),
  (83,'Tyrone Mays','Geesthacht','Saarland','2015-07-31'),
  (84,'Candace Hines','Leipzig','Saxony','2015-11-30'),
  (85,'Jason Fletcher','Berlin','Berlin','2015-11-06'),
  (86,'Vanna Ferrell','Aalen','Baden','2016-06-07'),
  (87,'Ava Griffin','Hamburg','Hamburg','2015-12-18'),
  (88,'Jamalia Guerrero','Berlin','Berlin','2015-05-22'),
  (89,'Donovan Dalton','Berlin','Berlin','2016-02-28'),
  (90,'Perry Mcfarland','Freiburg','Baden','2016-06-05'),
  (91,'Deacon Small','Konstanz','Baden','2015-02-16'),
  (92,'Emerson Lane','Bremerhaven','Bremen','2015-08-08'),
  (93,'Alec Joseph','Hamburg','Hamburg','2017-01-27'),
  (94,'Ulysses Hoover','Berlin','Berlin','2017-11-05'),
  (95,'Carl Beasley','Bremen','Bremen','2017-07-31'),
  (96,'Tatyana Turner','Berlin','Berlin','2016-03-26'),
  (97,'Jael Cervantes','Hamburg','Hamburg','2017-09-28'),
  (98,'Remedios Taylor','Staßfurt','Saxony-Anhalt','2016-01-26'),
  (99,'Erica Rocha','Hamburg','Hamburg','2016-11-25'),
  (100,'Joelle Rodgers','Eckernförde','Saarland','2017-01-22')
);

CREATE TABLE IF NOT EXISTS products (
  id    integer,
  name  text,
  price numeric
);
TRUNCATE TABLE products;

INSERT INTO products (id, name, price) (
  VALUES
  (1, 'watch', 55.55),
  (2, 'book', 15.05),
  (3, 'whiskey', 75.24)
);

CREATE TABLE IF NOT EXISTS orders (
  id          integer,
  order_date  date,
  quantity    integer,
  customer_id integer,
  product_id  integer
);
TRUNCATE TABLE orders;

INSERT INTO orders (id, customer_id, product_id, quantity, order_date) (
  VALUES
    (1,85,3,1,'2015-05-04'),
    (2,83,2,5,'2015-10-12'),
    (3,30,2,3,'2015-06-27'),
    (4,27,1,6,'2015-02-12'),
    (5,62,3,9,'2015-12-05'),
    (6,29,2,2,'2015-01-15'),
    (7,3,1,2,'2015-06-14'),
    (8,17,3,8,'2015-04-19'),
    (9,57,1,5,'2015-09-27'),
    (10,81,2,8,'2015-12-28'),
    (11,44,1,7,'2015-09-30'),
    (12,75,2,1,'2015-09-17'),
    (13,73,2,8,'2015-03-23'),
    (14,41,2,3,'2015-03-31'),
    (15,9,2,8,'2015-07-24'),
    (16,33,2,2,'2015-12-26'),
    (17,20,3,6,'2015-12-13'),
    (18,6,2,1,'2015-07-07'),
    (19,35,2,9,'2015-12-29'),
    (20,94,2,8,'2015-01-20'),
    (21,98,3,2,'2015-11-23'),
    (22,38,1,3,'2015-11-21'),
    (23,95,2,7,'2015-08-22'),
    (24,89,2,8,'2015-03-07'),
    (25,74,1,8,'2015-04-14'),
    (26,79,3,4,'2015-03-09'),
    (27,30,2,7,'2015-11-12'),
    (28,63,1,1,'2015-04-04'),
    (29,89,2,8,'2015-10-21'),
    (30,29,2,10,'2015-02-16'),
    (31,52,2,8,'2015-03-20'),
    (32,13,3,4,'2015-01-27'),
    (33,41,2,9,'2015-01-21'),
    (34,24,2,5,'2015-10-02'),
    (35,59,2,3,'2015-07-06'),
    (36,80,1,5,'2015-03-16'),
    (37,66,2,2,'2015-03-14'),
    (38,52,2,7,'2015-11-27'),
    (39,72,1,8,'2015-05-19'),
    (40,67,3,4,'2015-04-19'),
    (41,39,1,1,'2015-10-06'),
    (42,89,2,3,'2015-10-22'),
    (43,33,1,7,'2015-05-23'),
    (44,70,2,5,'2015-11-16'),
    (45,9,2,8,'2015-07-16'),
    (46,86,3,5,'2015-08-09'),
    (47,90,2,10,'2015-08-09'),
    (48,49,2,4,'2015-10-01'),
    (49,79,1,9,'2015-11-21'),
    (50,96,2,5,'2015-03-06'),
    (51,96,2,7,'2015-12-06'),
    (52,6,2,7,'2015-11-05'),
    (53,60,3,10,'2015-11-13'),
    (54,60,2,4,'2015-02-22'),
    (55,28,1,8,'2015-09-18'),
    (56,17,2,2,'2015-10-12'),
    (57,83,2,4,'2015-12-14'),
    (58,51,3,8,'2015-05-23'),
    (59,1,1,5,'2015-08-15'),
    (60,76,1,6,'2015-02-03'),
    (61,45,2,4,'2015-10-29'),
    (62,54,3,3,'2015-07-05'),
    (63,50,3,10,'2015-03-03'),
    (64,58,2,1,'2015-12-05'),
    (65,27,1,6,'2015-12-06'),
    (66,84,2,3,'2015-04-17'),
    (67,36,2,6,'2015-12-21'),
    (68,80,2,4,'2015-04-12'),
    (69,5,2,2,'2015-05-07'),
    (70,61,2,2,'2015-07-18'),
    (71,43,2,6,'2015-10-03'),
    (72,37,3,2,'2015-12-26'),
    (73,66,2,2,'2015-09-01'),
    (74,65,1,4,'2015-04-05'),
    (75,55,1,1,'2015-01-25'),
    (76,17,1,4,'2015-07-08'),
    (77,42,1,2,'2015-07-09'),
    (78,24,1,9,'2015-12-18'),
    (79,5,1,8,'2015-12-26'),
    (80,39,2,4,'2015-07-03'),
    (81,34,1,2,'2015-09-07'),
    (82,91,1,7,'2015-06-30'),
    (83,43,2,6,'2015-09-12'),
    (84,34,1,6,'2015-05-29'),
    (85,6,2,2,'2015-04-19'),
    (86,3,2,4,'2015-06-23'),
    (87,74,1,7,'2015-11-01'),
    (88,53,3,6,'2015-04-15'),
    (89,33,1,3,'2015-04-24'),
    (90,59,1,7,'2015-03-10'),
    (91,70,2,10,'2015-07-03'),
    (92,13,2,6,'2015-10-24'),
    (93,100,1,6,'2015-02-06'),
    (94,58,3,10,'2015-11-24'),
    (95,78,2,6,'2015-12-04'),
    (96,50,2,9,'2015-08-02'),
    (97,37,2,2,'2015-08-12'),
    (98,45,2,1,'2015-03-22'),
    (99,24,2,5,'2015-07-10'),
    (100,19,3,3,'2015-10-04'),
    (101,8,1,2,'2015-03-29'),
    (102,30,1,8,'2015-08-26'),
    (103,15,1,7,'2015-03-03'),
    (104,77,1,4,'2015-12-30'),
    (105,25,3,8,'2015-11-25'),
    (106,98,1,8,'2015-01-26'),
    (107,35,2,7,'2015-09-11'),
    (108,19,1,6,'2015-07-18'),
    (109,60,2,10,'2015-10-16'),
    (110,33,1,5,'2015-05-16'),
    (111,37,3,5,'2015-10-31'),
    (112,38,2,2,'2015-12-20'),
    (113,59,1,8,'2015-08-09'),
    (114,28,2,2,'2015-07-05'),
    (115,92,3,2,'2015-06-22'),
    (116,37,1,9,'2015-03-22'),
    (117,40,1,2,'2015-05-26'),
    (118,4,3,7,'2015-12-19'),
    (119,45,1,6,'2015-09-14'),
    (120,84,1,5,'2015-07-03'),
    (121,4,2,5,'2015-07-16'),
    (122,66,1,5,'2015-09-10'),
    (123,10,1,3,'2015-12-10'),
    (124,18,2,9,'2015-04-05'),
    (125,84,2,4,'2015-12-25'),
    (126,71,2,6,'2015-05-10'),
    (127,85,3,1,'2015-05-04'),
    (128,30,1,9,'2015-02-05'),
    (129,50,1,5,'2015-08-11'),
    (130,73,2,1,'2015-08-29'),
    (131,78,2,2,'2015-06-27'),
    (132,5,2,6,'2015-06-21'),
    (133,75,3,8,'2015-04-24'),
    (134,15,1,8,'2015-11-05'),
    (135,33,2,7,'2015-04-16'),
    (136,53,2,1,'2015-03-23'),
    (137,81,2,5,'2015-12-30'),
    (138,8,1,4,'2015-12-22'),
    (139,6,2,2,'2015-06-28'),
    (140,10,3,3,'2015-04-11'),
    (141,35,2,4,'2015-08-31'),
    (142,66,2,5,'2015-01-25'),
    (143,4,2,6,'2015-09-14'),
    (144,16,3,9,'2015-04-21'),
    (145,74,3,2,'2015-05-19'),
    (146,44,2,1,'2015-02-02'),
    (147,99,2,5,'2015-06-14'),
    (148,14,3,6,'2015-06-24'),
    (149,65,1,4,'2015-12-15'),
    (150,19,2,6,'2015-08-11'),
    (151,96,1,8,'2015-06-22'),
    (152,5,1,4,'2015-03-14'),
    (153,30,2,2,'2015-07-16'),
    (154,86,1,7,'2015-05-15'),
    (155,60,1,6,'2015-07-03'),
    (156,59,3,6,'2015-10-02'),
    (157,33,3,4,'2015-11-21'),
    (158,15,2,2,'2015-02-27'),
    (159,88,3,2,'2015-11-07'),
    (160,72,2,1,'2015-03-22'),
    (161,40,3,4,'2015-10-01'),
    (162,21,2,1,'2015-09-02'),
    (163,10,1,6,'2015-03-16'),
    (164,74,1,7,'2015-07-08'),
    (165,49,2,6,'2015-07-09'),
    (166,36,1,10,'2015-09-14'),
    (167,62,2,3,'2015-09-08'),
    (168,60,1,2,'2015-03-18'),
    (169,83,1,1,'2015-09-11'),
    (170,35,1,9,'2015-09-03'),
    (171,68,2,7,'2015-02-28'),
    (172,76,1,8,'2015-09-19'),
    (173,30,2,3,'2015-03-17'),
    (174,10,2,2,'2015-02-25'),
    (175,80,2,2,'2015-07-18'),
    (176,23,1,7,'2015-02-03'),
    (177,25,1,4,'2015-07-22'),
    (178,40,2,5,'2015-04-14'),
    (179,41,1,9,'2015-10-07'),
    (180,81,3,10,'2015-12-11'),
    (181,22,1,4,'2015-03-16'),
    (182,22,1,3,'2015-12-17'),
    (183,95,2,7,'2015-01-28'),
    (184,87,3,1,'2015-06-03'),
    (185,65,2,6,'2015-07-27'),
    (186,58,2,5,'2015-08-07'),
    (187,15,1,9,'2015-05-22'),
    (188,40,2,2,'2015-05-15'),
    (189,20,2,4,'2015-07-05'),
    (190,83,1,4,'2015-10-07'),
    (191,43,3,6,'2015-08-05'),
    (192,70,2,2,'2015-11-05'),
    (193,69,1,10,'2015-08-15'),
    (194,11,2,4,'2015-05-21'),
    (195,47,1,6,'2015-07-26'),
    (196,69,2,6,'2015-05-14'),
    (197,14,2,4,'2015-11-08'),
    (198,36,1,10,'2015-06-15'),
    (199,49,1,7,'2015-10-14'),
    (200,91,2,9,'2015-04-30'),
    (201,9,2,1,'2015-04-25'),
    (202,61,3,5,'2015-10-23'),
    (203,95,2,2,'2015-09-24'),
    (204,90,3,1,'2015-11-13'),
    (205,11,2,3,'2015-07-28'),
    (206,11,1,4,'2015-07-23'),
    (207,68,2,9,'2015-10-03'),
    (208,52,1,1,'2015-09-23'),
    (209,26,2,1,'2015-07-15'),
    (210,59,2,9,'2015-05-26'),
    (211,40,2,8,'2015-02-25'),
    (212,60,3,9,'2015-10-18'),
    (213,27,3,2,'2015-07-21'),
    (214,43,2,9,'2015-10-09'),
    (215,98,1,6,'2015-03-03'),
    (216,67,2,2,'2015-08-20'),
    (217,42,3,7,'2015-11-01'),
    (218,32,2,2,'2015-10-22'),
    (219,14,1,8,'2015-05-03'),
    (220,23,2,3,'2015-07-09'),
    (221,83,1,2,'2015-12-10'),
    (222,77,2,4,'2015-10-30'),
    (223,79,1,1,'2015-04-25'),
    (224,83,2,10,'2015-08-30'),
    (225,72,3,1,'2015-02-23'),
    (226,53,2,8,'2015-09-18'),
    (227,35,2,2,'2015-06-03'),
    (228,95,2,3,'2015-05-11'),
    (229,61,2,6,'2015-04-30'),
    (230,52,2,3,'2015-05-24'),
    (231,55,2,6,'2015-10-26'),
    (232,32,2,1,'2015-08-06'),
    (233,2,3,5,'2015-02-08'),
    (234,11,2,6,'2015-05-25'),
    (235,44,2,1,'2015-02-23'),
    (236,65,2,2,'2015-12-08'),
    (237,72,2,6,'2015-03-09'),
    (238,65,3,5,'2015-09-12'),
    (239,76,3,9,'2015-04-18'),
    (240,44,2,6,'2015-04-08'),
    (241,93,2,6,'2015-06-19'),
    (242,51,1,4,'2015-09-24'),
    (243,82,2,3,'2015-06-10'),
    (244,58,2,4,'2015-10-03'),
    (245,80,1,8,'2015-07-28'),
    (246,41,2,8,'2015-08-24'),
    (247,29,2,5,'2015-04-07'),
    (248,37,2,6,'2015-10-19'),
    (249,82,2,6,'2015-10-04'),
    (250,7,1,3,'2015-09-01')
);

-- II. Now we have all the data inserted - it's time to start to query!

-- Let's get all the data together! This query JOINs all three table based on
-- their IDs. For example each the data from the `customers` table gets put
-- together next to the data from the `orders` table based on the
-- `customers.id` and the `orders.customer_id` attributes.
SELECT *
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id;

-- Here's a subset of the result from joining (ALL) our data together.
--
--  id  |       name        |       city        |         region         | signup_date | id  | quantity | customer_id | product_id | order_date | id |  name   | price
-- -----+-------------------+-------------------+------------------------+-------------+-----+----------+-------------+------------+------------+----+---------+-------
--    5 | Cyrus Crawford    | Hamburg           | Hamburg                | 2016-07-24  |  79 |        8 |           5 |          1 | 2015-12-26 |  1 | watch   | 55.55
--   41 | Igor Nolan        | Berlin            | Berlin                 | 2015-08-16  | 179 |        9 |          41 |          1 | 2015-10-07 |  1 | watch   | 55.55
--   74 | Cedric Conway     | Berlin            | Berlin                 | 2016-05-10  |  25 |        8 |          74 |          1 | 2015-04-14 |  1 | watch   | 55.55
-- ...
-- (more rows are omitted)
--

--
-- Finally we can reach the goal of this class and calculate the revenue per
-- region! Some notes on this query:
--
--    * We define revenue to equal price multiplied by quantity, hence the
--    expression `price * quantity`
--    * We use the `ORDER BY` clause to bring the regions with highest
--    revenue on top of our result (DESC stands for DESCENDING).
--    * The `GROUP BY` clause splits the full data by the attribute `region`.
--    This means that all rows (orders!) from the same region will fall into the
--    same group.
--    * Once we have all the region groups, the function `SUM()` applies the
--    expression `price * quantity` per row (!) then sums up the values from all
--    rows within each group.
--
SELECT region, SUM(price * quantity) AS revenue
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN products ON products.id = orders.product_id
GROUP BY region
ORDER BY revenue DESC;

--  Here's the result from this query:
--
--          region         |  revenue
-- ------------------------+------------
--  Berlin                 | 1240212.00
--  Hamburg                | 1005168.75
--  Saarland               |  426053.25
--  Bremen                 |  307413.00
--  Hesse                  |  191145.75
--  Baden                  |  179093.25
--  Bavaria                |  124915.50
--  North Rhine-Westphalia |   84035.25
--  Saxony-Anhalt          |   69613.50
--  Saxony                 |   57896.25
--  Rhineland-Palatinate   |   47223.75
--  Lower Saxony           |   37496.25
--  Brandenburg            |    1128.75
