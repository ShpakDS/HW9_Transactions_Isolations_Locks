SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

USE test_db;
SET autocommit = 0;

START TRANSACTION;
UPDATE users
SET name = 'Testing users name'
WHERE id = 1;
COMMIT;