# HW9_Transactions_Isolations_Locks

## Setup
Run command ```docker-compose up -d```

After run 
```docker exec -i percona mysql -u root -proot -D test_db < install.sql``` for creating users table.

### 1) Testing lost update
   
a) Run command ```docker exec -i percona mysql -u root -proot -D test_db < lost_update_1.sql```

b) Run command ```docker exec -i percona mysql -u root -proot -D test_db < lost_update_2.sql```
We can see a result with old username.

### 2) Testing dirty read 

Creates a transaction to update a value. Use sleep for 10 seconds and roll back the changes.

a) Run command ```docker exec -i percona mysql -u root -proot -D test_db < dirty_read_1.sql``` 

Creates a transaction to read a value. Returns an updated value and commits the result of select;
b) Run command ```docker exec -i percona mysql -u root -proot -D test_db < dirty_read_2.sql```

### 3) Testing non-repeatable read

Creates a transaction to execute a selection and pauses for 10 seconds. Executes the same selection that returns a different value for the same query because a second transaction has made an update.

a) Run command ```docker exec -i percona mysql -u root -proot -D test_db < non_repeatable_read_1.sql```

Creates a transaction to update a value;

b) Run command ```docker exec -i percona mysql -u root -proot -D test_db < non_repeatable_read_2.sql```
And we have results username = 'Testing users name'

### 4) Testing phantom read

Creates a transaction to perform a selection and sleeps 10 seconds. Performs the same select that returns different values for the same query because the second transaction made an insert;

a) Run command ```docker exec -i percona mysql -u root -proot -D test_db < phantom_read_1.sql```

Create a transaction to insert a value;

b) Run command ```docker exec -i percona mysql -u root -proot -D test_db < phantom_read_2.sql```

And we have results "User Test", Users Test 1", "Users Test 2"
