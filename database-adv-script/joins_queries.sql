-- query using an INNER JOIN to retrieve all bookings
-- and the respective users who made those bookings.
SELECT * FROM Booking  b 
INNER JOIN User  u
ON b.user_id = u.user_id;


-- query using aLEFT JOIN to retrieve all properties 
-- and their reviews, including properties that have no reviews.

SELECT * FROM Property p 
LEFT JOIN Review r 
ON p.property_id = r.property_id ORDER BY p.name;



-- query using a FULL OUTER JOIN to retrieve all users and
--  all bookings, even if the user has no booking or a booking is not linked to a user.

SELECT * FROM User u
FULL OUTER JOIN Booking b
ON u.user_id = b.user_id
ORDER BY u.email