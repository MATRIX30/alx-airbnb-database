-- subqueries
-- query to find all properties where the average rating is
-- greater than 4.0 using a subquery.

SELECT * FROM Property p
WHERE (
    SELECT AVG(r.rating)
    FROM Review r
    WHERE r.property_id = p.property_id
) > 4.0 ;

-- correlated subquery to find users who have made
-- more than 3 bookings.
SELECT * FROM User u
WHERE u.user_id IN (
    SELECT b.user_id
    FROM Booking b
    GROUP BY b.user_id
    HAVING COUNT(b.booking_id) > 3
)
