-- Use the sysadmin role
USE ROLE sysadmin;

-- Use the specified database
USE DATABASE LIBRARY_CARD_CATALOG;

-- Create a new sequence for BOOK_UID
CREATE OR REPLACE SEQUENCE "LIBRARY_CARD_CATALOG"."PUBLIC"."SEQ_BOOK_UID" 
START 1 
INCREMENT 1 
COMMENT = 'Use this to fill in the BOOK_UID everytime you add a row';

-- Create the BOOK table with BOOK_UID using the sequence as default
CREATE OR REPLACE TABLE BOOK (
    BOOK_UID NUMBER DEFAULT SEQ_BOOK_UID.nextval,
    TITLE VARCHAR(50),
    YEAR_PUBLISHED NUMBER(4,0)
);

-- Insert records into the BOOK table
INSERT INTO BOOK (TITLE, YEAR_PUBLISHED)
VALUES
    ('Food', 2001),
    ('Food', 2006),
    ('Food', 2008),
    ('Food', 2016),
    ('Food', 2015);

-- Create the BOOK_TO_AUTHOR table
CREATE OR REPLACE TABLE BOOK_TO_AUTHOR (
    BOOK_UID NUMBER,
    AUTHOR_UID NUMBER
);

-- Insert rows into the BOOK_TO_AUTHOR table
INSERT INTO BOOK_TO_AUTHOR (BOOK_UID, AUTHOR_UID)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6);

-- Create the AUTHOR table and insert sample data
CREATE OR REPLACE TABLE AUTHOR (
    AUTHOR_UID NUMBER,
    FIRST_NAME VARCHAR(50),
    MIDDLE_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50)
);

-- Insert sample authors into the AUTHOR table
INSERT INTO AUTHOR (AUTHOR_UID, FIRST_NAME, MIDDLE_NAME, LAST_NAME)
VALUES
    (1, 'Fiona', '', 'Macdonald'),
    (2, 'Gian', 'Paulo', 'Faleschini'),
    (3, 'Some', 'Random', 'Author'),
    (4, 'Another', '', 'Author'),
    (5, 'John', 'Doe', ''),
    (6, 'Jane', '', 'Smith');

-- Check your work by joining the 3 tables together
-- This should give you 1 row for every author associated with each book
SELECT * 
FROM BOOK_TO_AUTHOR ba 
JOIN AUTHOR a ON ba.AUTHOR_UID = a.AUTHOR_UID 
JOIN BOOK b ON b.BOOK_UID = ba.BOOK_UID;
