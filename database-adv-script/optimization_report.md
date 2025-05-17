-- Optimized query: Select only needed columns, ensure indexes exist, and use WHERE/AND clauses for filtering

-- Recommended indexes (run once, not part of the SELECT query):
-- CREATE INDEX idx_booking_user_id ON Booking(user_id);
-- CREATE INDEX idx_booking_property_id ON Booking(property_id);
-- CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

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