-- Write an initial query that retrieves all bookings along with the user
-- details, property details, and payment details
SELECT
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
