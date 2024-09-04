-- 1. Create a table named student with the following fields: student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
    student_id serial,
    first_name varchar,
    last_name varchar,
    birthday date,
    phone varchar
);

-- 2. Add a column middle_name of type varchar to the student table
ALTER TABLE student
ADD COLUMN middle_name varchar;

-- 3. Remove the middle_name column
ALTER TABLE student
DROP COLUMN middle_name;

-- 4. Rename the column birthday to birth_date
ALTER TABLE student
RENAME birthday TO birth_date;

-- 5. Change the data type of the phone column to varchar(32)
ALTER TABLE student
ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Insert any three records with auto-generated identifiers
INSERT INTO student (first_name, last_name, birth_date, phone)
VALUES ('Jackson', 'Teller', '2001-10-11', '592345'),
       ('Matthew', 'Bellamy', '1998-04-25', '645478'),
       ('James', 'Hetfield', '2005-05-31', '789210');

-- 7. Delete all data from the table and reset the identifiers to their initial state
TRUNCATE TABLE student
RESTART IDENTITY;
