-- Write an initial query that retrieves all bookings along with the user
-- details, property details, and payment details
EXPLAIN ANALYZE SELECT
    b.*,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;


-- Optimized query: Select only needed columns, ensure indexes exist, and use WHERE/AND clauses for filtering

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
  AND p.location = 'New York'
  AND pay.amount > 100;