Write a brief report on the improvements you observed.
so before doing partitioning my query was a little slow
running the command `explain analyze select * from Booking where start_date < '2025-05-4'`
we got the following results 
-----------------------------------------------------------------------------------------------------------------+
| -> Filter: (Booking.start_date < DATE'2024-05-02')  (cost=1906 rows=6057) (actual time=19.5..19.5 rows=0 loops=1)
    -> Table scan on Booking  (cost=1906 rows=18173) (actual time=0.222..17.9 rows=20000 loops=1)

while after partitioning and running thesame command I got the following results

-------------------------------------------------------------------------------------------------------------------+
| -> Filter: (Bookings.start_date < DATE'2024-05-02')  (cost=1295 rows=4182) (actual time=11.9..11.9 rows=0 loops=1)
    -> Table scan on Bookings  (cost=1295 rows=12546) (actual time=0.173..10.8 rows=12613 loops=1)
 |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.01 sec)

Depicting a small but yet an improvement in execution time
