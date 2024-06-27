-- Set the sequence increment by session parameter to 1
ALTER SESSION SET SEQUENCE_INCREMENT_BY = 1;

-- Use the correct role
USE ROLE sysadmin;

-- Drop the existing sequence if it exists
DROP SEQUENCE IF EXISTS SEQ_AUTHOR_UID;

-- Create the sequence with the correct increment
CREATE SEQUENCE SEQ_AUTHOR_UID
    START = 1
    INCREMENT = 1
    COMMENT = 'Use this to fill in AUTHOR_UID';


