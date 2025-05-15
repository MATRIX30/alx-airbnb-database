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
