-- Assume the Booking table is large 
-- and query performance is slow. Implement partitioning on the Booking
-- table based on the start_date column. Save the query in a file partitioning.sql
-- Booking Table with range partition
CREATE TABLE IF NOT EXISTS Booking (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_booking_id (booking_id),
    PRIMARY KEY(booking_id, start_date)
    -- FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    -- FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
) PARTITION BY RANGE (YEAR(start_date))(
    PARTITION P0 VALUES LESS THAN(2023),
    PARTITION P1 VALUES LESS THAN(2024),
    PARTITION P2 VALUES LESS THAN(2025),
    PARTITION P3 VALUES LESS THAN(2026)
);