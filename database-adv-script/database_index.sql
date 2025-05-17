-- creating index to optimize database performance



EXPLAIN ANALYZE SELECT * FROM User WHERE user_id = 123;
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'test@example.com';
EXPLAIN ANALYZE SELECT * FROM User WHERE phone_number = '1234567890';
EXPLAIN ANALYZE SELECT * FROM User WHERE role = 'host';

-- Booking table
EXPLAIN ANALYZE SELECT * FROM Booking WHERE status = 'confirmed';
EXPLAIN ANALYZE SELECT * FROM Booking WHERE total_price > 1000;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id = 42;
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;

-- Property table
EXPLAIN ANALYZE SELECT * FROM Property WHERE propert_id = 99;
EXPLAIN ANALYZE SELECT * FROM Property WHERE host_id = 77;
EXPLAIN ANALYZE SELECT * FROM Property WHERE name = 'Cozy Apartment';
EXPLAIN ANALYZE SELECT * FROM Property WHERE pricepernight < 200;
-- optimize User table
CREATE INDEX idx_user_user_id ON User(user_id);
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_phone_number ON User(phone_number);
CREATE INDEX idx_user_role ON User(role);

-- optimize Booking
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_total_price ON Booking(total_price);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- optimize Property
CREATE INDEX idx_property_propert_id ON Property(propert_id);
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_name ON Property(name);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);