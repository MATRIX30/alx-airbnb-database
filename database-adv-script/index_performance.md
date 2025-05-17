#### creating index to optimize database performance
#### optimize User table
CREATE INDEX idx_user_user_id ON User(user_id);
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_phone_number ON User(phone_number);
CREATE INDEX idx_user_role ON User(role);

#### optimize Booking
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_total_price ON Booking(total_price);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);

#### optimize Property
CREATE INDEX idx_property_propert_id ON Property(propert_id);
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_name ON Property(name);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);