SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

USE test_db;
SET autocommit=0;

START TRANSACTION;
SELECT name FROM users WHERE id = 1;

DO SLEEP(10);

SELECT name FROM users WHERE id = 1;
COMMIT;