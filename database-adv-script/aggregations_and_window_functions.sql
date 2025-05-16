-- query to find the total number of bookings made by each user, 
-- using the COUNT function and GROUP BY clause.

SELECT user_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY user_id;