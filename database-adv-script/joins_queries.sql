-- query using an INNER JOIN to retrieve all bookings
-- and the respective users who made those bookings.
SELECT * FROM Booking  b 
INNER JOIN User  u
ON b.user_id = u.user_id;
