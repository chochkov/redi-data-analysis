-- I. Make sure the table is cleaned up before execution using the SQL verb `DROP`
DROP TABLE IF EXISTS users;

-- II. Create the table definition using the SQL verb `CREATE`
CREATE TABLE users (
  id          serial,
  name        text,
  email       text,
  signup_date date
);

-- III. Using SQL verb `INSERT`, we insert some data into the newly created table
INSERT INTO users (id, name, email, signup_date) (
  VALUES
  (1,'Mechelle','Cras@AliquamnislNulla.ca','2016-08-14'),
  (2,'Reese','ultrices@Quisquepurussapien.com','2017-09-12'),
  (3,'Anne','Phasellus@dolorsitamet.edu','2017-01-17'),
  (4,'Whitney','Nunc.mauris@Aliquamrutrumlorem.net','2017-04-30')
);

-- IV. Using `SELECT` we print all the records (data) from the table
SELECT * FROM users;

-- V. Using `SELECT WHERE` we print only the records created on Q3 in 2016 or
-- 2017
SELECT name, signup_date
FROM users
WHERE signup_date BETWEEN '2016-07-01' AND '2016-09-30'
OR    signup_date BETWEEN '2017-07-01' AND '2017-09-30';

-- VI. I didn't show you this example in class, but it simplifies the above
-- query. `extract(month from signup_date)` takes only the month from the
-- `signup_date` and selects records with month between 7 and 9 (for Q3).
-- The result is the same as V. Try it out! :)
SELECT name, signup_date
FROM users
WHERE extract(month from signup_date)
BETWEEN 7 AND 9;

-- NOTE: with query VI. we are guaranteed to get the data for any year and not
-- only 2016 or 2017!
