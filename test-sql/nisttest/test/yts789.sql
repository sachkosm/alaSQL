-- MODULE  YTS789  

-- SQL Test Suite, V6.0, Interactive SQL, yts789.sql
-- 59-byte ID
-- TEd Version #

-- AUTHORIZATION CTS1              

   SELECT USER FROM HU.ECCO;
-- RERUN if USER value does not match preceding AUTHORIZATION comment
   ROLLBACK WORK;

-- date_time print

-- TEST:7523 CREATE CHAR SET in schema def, COLLATION FROM DEFAULT!

   CREATE SCHEMA CTSC

         CREATE CHARACTER SET CST GET SQL_TEXT
                COLLATION FROM DEFAULT

         CREATE TABLE Tab 
                (Col1  CHARACTER(3) CHARACTER SET CST);
-- PASS:7523 If schema created successfully?

   COMMIT WORK;

   SELECT COUNT(*) 
     FROM INFORMATION_SCHEMA.CHARACTER_SETS WHERE 
     CHARACTER_SET_SCHEMA = 'CTSC'
     AND CHARACTER_SET_NAME = 'CST';
-- PASS:7523 If COUNT = 1?

   SELECT FORM_OF_USE, NUMBER_OF_CHARACTERS,
     DEFAULT_COLLATE_CATALOG, DEFAULT_COLLATE_SCHEMA,
     DEFAULT_COLLATE_NAME 
     FROM INFORMATION_SCHEMA.CHARACTER_SETS
     WHERE CHARACTER_SET_SCHEMA = 'CTSC'
     AND CHARACTER_SET_NAME = 'CST';
-- PASS:7523 If selected values = the values of the next SELECT?

   SELECT FORM_OF_USE, NUMBER_OF_CHARACTERS,
     DEFAULT_COLLATE_CATALOG, DEFAULT_COLLATE_SCHEMA,
     DEFAULT_COLLATE_NAME 
     FROM INFORMATION_SCHEMA.CHARACTER_SETS
     WHERE CHARACTER_SET_SCHEMA = 'INFORMATION_SCHEMA'
     AND CHARACTER_SET_NAME = 'SQL_TEXT';
-- PASS:7523 If selected values = the values of the previous SELECT?

   INSERT INTO CTSC.Tab VALUES (_CTSC.CST 'f');
-- PASS:7523 If 1 row inserted successfully?

   SELECT COUNT (*) FROM CTSC.Tab;
-- PASS:7523 If COUNT = 1?

   ROLLBACK WORK;

   DROP SCHEMA CTSC CASCADE;
-- PASS:7523 If drop completed successfully?

   COMMIT WORK;

-- END TEST >>> 7523 <<< END TEST
-- *********************************************
-- *************************************************////END-OF-MODULE
