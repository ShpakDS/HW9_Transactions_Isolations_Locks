SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
UPDATE users
SET name = 'User B'
WHERE id = 1;

DO SLEEP(10);

ROLLBACK;