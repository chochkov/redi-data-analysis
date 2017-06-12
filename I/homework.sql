-- In the script https://github.com/chochkov/redi-data-analysis/blob/master/I/script.sql replace the INSERT SQL statement with the one below:

INSERT INTO users (name, email, signup_date) (
  VALUES
  ('Mechelle','Cras@AliquamnislNulla.ca','2016-08-14'),
  ('Reese','ultrices@Quisquepurussapien.com','2017-09-12'),
  ('Anne','Phasellus@dolorsitamet.edu','2017-01-17'),
  ('Cyrus','Crawford@gmail.com','2016-07-24'),
  ('Burke','Hendrix@gmail.com','2016-09-20'),
  ('Elizabeth','Reilly@gmail.com','2015-10-19'),
  ('Nell','Newman@gmail.com','2016-11-26'),
  ('Rama','Floyd@gmail.com','2015-08-31'),
  ('Galvin','Wooten@gmail.com','2016-10-09'),
  ('Hilda','Cannon@gmail.com','2017-04-16'),
  ('MacKensie','Underwood@gmail.com','2015-09-04'),
  ('Laurel','Logan@gmail.com','2017-07-11'),
  ('Lenore','Grant@gmail.com','2016-01-13'),
  ('Slade','Acosta@gmail.com','2015-10-13'),
  ('Martena','Little@gmail.com','2017-11-14'),
  ('Timon','Carpenter@gmail.com','2017-05-19'),
  ('Josiah','Campos@gmail.com','2016-07-15'),
  ('Justin','Gutierrez@gmail.com','2016-07-18'),
  ('Latifah','Reid@gmail.com','2016-07-17'),
  ('Amethyst','Barnett@gmail.com','2015-11-13'),
  ('Kay','Walsh@gmail.com','2015-09-18'),
  ('Erasmus','Harris@gmail.com','2017-03-29'),
  ('Nichole','Bullock@gmail.com','2017-08-15'),
  ('Serina','Washington@gmail.com','2017-10-04'),
  ('Colleen','Kaufman@gmail.com','2015-04-30'),
  ('Hilary','Arnold@gmail.com','2015-04-14'),
  ('Diana','Workman@gmail.com','2017-05-01'),
  ('Elizabeth','Calhoun@gmail.com','2017-11-11'),
  ('Darius','William@gmail.com','2016-08-26'),
  ('Latifah','Clay@gmail.com','2017-09-15'),
  ('Chancellor','Shaw@gmail.com','2016-03-15'),
  ('Caldwell','Newton@gmail.com','2015-04-21'),
  ('Iona','Keller@gmail.com','2017-11-25'),
  ('Winter','Brown@gmail.com','2015-09-12'),
  ('Beck','Leach@gmail.com','2015-02-25'),
  ('Julian','Bowen@gmail.com','2017-11-28'),
  ('Owen','Mcclain@gmail.com','2015-03-24'),
  ('Whitney','Nunc.mauris@Aliquamrutrumlorem.net','2017-04-30')
);

-- Go through the script from the class and make sure it makes sense to you.

-- Task 1. Select all users whose signup_date is a Saturday or a Sunday
-- Hint: https://www.postgresql.org/docs/current/static/functions-datetime.html

-- Task 2. In the script from the lecture we looked at two possible ways to get
-- signups in Q3. Look at the second option then go through the documentation from Task 1
-- and see if there is an even more straighforward way to rewrite the condition in the query.

-- Task 3. Consider the following SQL query. It returns the number of records in the users table.

SELECT count(*) FROM users;

-- Extend the query above and return the number of records in the users table who have name Latifah, Elizabeth or Diana

-- Task 4. Use this documentation
-- https://www.postgresql.org/docs/9.6/static/functions-string.html and the query
-- from Task 3 to find the number of users whose names start with the letters L, E or D

-- Task 5. Use the same documentation from Task 4 and select all information
-- (SELECT *...) for users whose names are exactly 5 characters long.
