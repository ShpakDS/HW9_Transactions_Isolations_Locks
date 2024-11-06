SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

USE test_db;
SET autocommit = 0;

START TRANSACTION;

SELECT *
FROM users as t1
WHERE t1.id = 1;

DO SLEEP(10);

SELECT *
FROM users as t1
WHERE t1.id = 1;

UPDATE users as t1
SET t1.name = CONCAT(t1.name, ' Test')
WHERE t1.id = 1;

SELECT *
FROM users as t1
WHERE t1.id = 1;

COMMIT;