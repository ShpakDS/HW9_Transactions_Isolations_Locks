SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

USE test_db;
SET autocommit=0;

START TRANSACTION;
SELECT name FROM users WHERE id = 1;
COMMIT;