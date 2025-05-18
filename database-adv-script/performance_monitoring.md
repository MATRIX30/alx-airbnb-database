- Use SQL commands like SHOW PROFILE or EXPLAIN ANALYZE to monitor the performance of a few of your frequently used queries.

- Identify any bottlenecks and suggest changes (e.g., new indexes, schema adjustments).

- Implement the changes and report the improvements.

#### command: showing all the users in the system with role as admin
 `select * from User where role ='admin';`
#### Performance monitoring:
    - `with show Profile:`

show profile for query 1;
+--------------------------------+----------+
| Status                         | Duration |
+--------------------------------+----------+
| starting                       | 0.000093 |
| Executing hook on transaction  | 0.001441 |
| starting                       | 0.000796 |
| checking permissions           | 0.000145 |
| Opening tables                 | 0.000202 |
| init                           | 0.000048 |
| System lock                    | 0.000062 |
| optimizing                     | 0.000030 |
| statistics                     | 0.000089 |
| preparing                      | 0.000085 |
| executing                      | 0.028281 |
| end                            | 0.000017 |
| query end                      | 0.000005 |
| waiting for handler commit     | 0.000012 |
| closing tables                 | 0.000009 |
| freeing items                  | 0.000037 |
| cleaning up                    | 0.000012 |
+--------------------------------+----------+
17 rows in set, 1 warning (0.00 sec)
    - `with explain analyze:`
 explain analyze select * from User where role = 'admin';
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                                                                                                                                   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| -> Filter: (`User`.`role` = 'admin')  (cost=2044 rows=6467) (actual time=0.0724..13.4 rows=6579 loops=1)
    -> Table scan on User  (cost=2044 rows=19400) (actual time=0.0683..11.2 rows=20000 loops=1)
 |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.03 sec)
#### Identified bottleneck and possible suggestions
 - takes toomuch time at the level of query execution
 - we propose indexing the role column
 - partition Users by role
Below are the results obtained

show profile for query 18;
+--------------------------------+----------+
| Status                         | Duration |
+--------------------------------+----------+
| starting                       | 0.000092 |
| Executing hook on transaction  | 0.000006 |
| starting                       | 0.000007 |
| checking permissions           | 0.000004 |
| Opening tables                 | 0.000032 |
| init                           | 0.000005 |
| System lock                    | 0.000010 |
| optimizing                     | 0.000013 |
| statistics                     | 0.000028 |
| preparing                      | 0.000029 |
| executing                      | 0.020001 |
| end                            | 0.000014 |
| query end                      | 0.000004 |
| waiting for handler commit     | 0.000009 |
| closing tables                 | 0.000011 |
| freeing items                  | 0.000044 |
| cleaning up                    | 0.000013 |
+--------------------------------+----------+
17 rows in set, 1 warning (0.00 sec)

This shows an improvement in query execution time from `0.028281` to `0.020001`


-- explain analyze 
------------------------------------------------------------------------------------------------------+
| -> Filter: (Users.`role` = 'admin')  (cost=2006 rows=6445) (actual time=0.0339..15.5 rows=6579 loops=1)
    -> Table scan on Users  (cost=2006 rows=19335) (actual time=0.0293..13.4 rows=20000 loops=1)
 |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.02 sec)

This shows of actual execution time from `0.0683..11.2` to `0.0293..13.4`

this all show major improvements and optimizations 