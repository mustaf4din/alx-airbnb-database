-- =====================================================
-- 1. USER TABLE (No Changes - Already 3NF)
-- =====================================================

CREATE TABLE User (
    user_id CHAR(36) NOT NULL DEFAULT (UUID()),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT pk_user PRIMARY KEY (user_id),
    CONSTRAINT uq_user_email UNIQUE (email)
);

-- =====================================================
-- 2. PROPERTY TABLE (No Changes - Already 3NF)
-- =====================================================

CREATE TABLE Property (
    property_id CHAR(36) NOT NULL DEFAULT (UUID()),
    host_id CHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT pk_property PRIMARY KEY (property_id),
    CONSTRAINT fk_property_host FOREIGN KEY (host_id) REFERENCES User(user_id)
);

-- =====================================================
-- 3. BOOKING TABLE (3NF Fix: Removed total_price)
-- =====================================================

CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    -- total_price REMOVED (was derived attribute - 3NF violation)
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT pk_booking PRIMARY KEY (booking_id),
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- =====================================================
-- 4. PAYMENT TABLE (No Changes - Already 3NF)
-- =====================================================

CREATE TABLE Payment (
    payment_id CHAR(36) NOT NULL DEFAULT (UUID()),
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    
    CONSTRAINT pk_payment PRIMARY KEY (payment_id),
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- =====================================================
-- 5. REVIEW TABLE (No Changes - Already 3NF)
-- =====================================================

CREATE TABLE Review (
    review_id CHAR(36) NOT NULL DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INTEGER NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT pk_review PRIMARY KEY (review_id),
    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES User(user_id),
    CONSTRAINT chk_review_rating CHECK (rating >= 1 AND rating <= 5)
);

-- =====================================================
-- 6. MESSAGE TABLE (No Changes - Already 3NF)
-- =====================================================

CREATE TABLE Message (
    message_id CHAR(36) NOT NULL DEFAULT (UUID()),
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT pk_message PRIMARY KEY (message_id),
    CONSTRAINT fk_message_sender FOREIGN KEY (sender_id) REFERENCES User(user_id),
    CONSTRAINT fk_message_recipient FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

-- =====================================================
-- 7. VIEW FOR CALCULATED TOTAL PRICE (3NF Compliance)
-- =====================================================

CREATE VIEW BookingWithPrice AS
SELECT 
    b.booking_id,
    b.property_id,
    b.user_id,
    b.start_date,
    b.end_date,
    b.status,
    b.created_at,
    p.price_per_night,
    (DATEDIFF(b.end_date, b.start_date) * p.price_per_night) AS total_price
FROM Booking b
JOIN Property p ON b.property_id = p.property_id;

-- =====================================================
-- 8. INDEXES FOR OPTIMAL PERFORMANCE (Same as Before)
-- =====================================================

-- User table indexes
CREATE INDEX idx_user_email ON User(email);

-- Property table indexes
CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price_per_night);

-- Booking table indexes
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_booking_status ON Booking(status);

-- Payment table indexes
CREATE INDEX idx_payment_booking ON Payment(booking_id);
CREATE INDEX idx_payment_method ON Payment(payment_method);
CREATE INDEX idx_payment_date ON Payment(payment_date);

-- Review table indexes
CREATE INDEX idx_review_property ON Review(property_id);
CREATE INDEX idx_review_user ON Review(user_id);
CREATE INDEX idx_review_rating ON Review(rating);

-- Message table indexes
CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);
CREATE INDEX idx_message_sent ON Message(sent_at);
