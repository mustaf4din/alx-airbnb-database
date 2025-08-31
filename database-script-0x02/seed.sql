-- =====================================================
-- AirBnB Database Sample Data
-- Realistic SQL INSERT Statements for All Tables
-- =====================================================

-- =====================================================
-- 1. SAMPLE USERS (Guests, Hosts, Admin)
-- =====================================================

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
-- Hosts
('550e8400-e29b-41d4-a716-446655440001', 'John', 'Smith', 'john.smith@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0101', 'host', '2023-01-15 10:30:00'),
('550e8400-e29b-41d4-a716-446655440002', 'Sarah', 'Johnson', 'sarah.johnson@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0102', 'host', '2023-02-20 14:15:00'),
('550e8400-e29b-41d4-a716-446655440003', 'Michael', 'Brown', 'michael.brown@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0103', 'host', '2023-03-10 09:45:00'),
('550e8400-e29b-41d4-a716-446655440004', 'Emma', 'Wilson', 'emma.wilson@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+44-20-7946-0958', 'host', '2023-04-05 16:20:00'),
('550e8400-e29b-41d4-a716-446655440005', 'Carlos', 'Rodriguez', 'carlos.rodriguez@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+34-91-123-4567', 'host', '2023-05-12 11:00:00'),

-- Guests
('550e8400-e29b-41d4-a716-446655440010', 'Alice', 'Cooper', 'alice.cooper@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0110', 'guest', '2023-06-01 08:30:00'),
('550e8400-e29b-41d4-a716-446655440011', 'Bob', 'Davis', 'bob.davis@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0111', 'guest', '2023-06-15 12:45:00'),
('550e8400-e29b-41d4-a716-446655440012', 'Lisa', 'Martinez', 'lisa.martinez@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0112', 'guest', '2023-07-03 15:20:00'),
('550e8400-e29b-41d4-a716-446655440013', 'David', 'Lee', 'david.lee@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0113', 'guest', '2023-07-20 13:10:00'),
('550e8400-e29b-41d4-a716-446655440014', 'Sophie', 'Taylor', 'sophie.taylor@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+44-161-123-4567', 'guest', '2023-08-05 10:15:00'),
('550e8400-e29b-41d4-a716-446655440015', 'James', 'Anderson', 'james.anderson@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0115', 'guest', '2023-08-18 17:30:00'),

-- Admin
('550e8400-e29b-41d4-a716-446655440099', 'Admin', 'User', 'admin@airbnb.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-800-AIRBNB', 'admin', '2023-01-01 00:00:00');

-- =====================================================
-- 2. SAMPLE PROPERTIES
-- =====================================================

INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
-- John Smith's Properties
('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'Cozy Downtown Apartment', 'Beautiful 2-bedroom apartment in the heart of downtown with modern amenities, close to restaurants and shopping. Perfect for business travelers and couples.', 'New York, NY, USA', 150.00, '2023-01-20 11:00:00', '2023-01-20 11:00:00'),
('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Brooklyn Loft Studio', 'Spacious loft studio with exposed brick walls and large windows. Located in trendy Brooklyn neighborhood with easy subway access to Manhattan.', 'Brooklyn, NY, USA', 120.00, '2023-02-01 14:30:00', '2023-02-01 14:30:00'),

-- Sarah Johnson's Properties
('660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440002', 'Beachfront Villa', 'Stunning 4-bedroom villa with private beach access, pool, and panoramic ocean views. Perfect for families and groups looking for a luxury getaway.', 'Malibu, CA, USA', 500.00, '2023-02-25 16:45:00', '2023-02-25 16:45:00'),
('660e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 'Hollywood Hills House', 'Modern 3-bedroom house in the Hollywood Hills with city views, pool, and hot tub. Close to attractions and nightlife.', 'Los Angeles, CA, USA', 300.00, '2023-03-05 12:20:00', '2023-03-05 12:20:00'),

-- Michael Brown's Properties  
('660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', 'Mountain Cabin Retreat', 'Rustic 3-bedroom cabin in the mountains with fireplace, hot tub, and hiking trails nearby. Perfect for nature lovers and winter sports enthusiasts.', 'Aspen, CO, USA', 250.00, '2023-03-15 09:30:00', '2023-03-15 09:30:00'),
('660e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440003', 'Denver City Condo', 'Modern 1-bedroom condo downtown Denver with gym access and rooftop terrace. Walking distance to restaurants, bars, and cultural attractions.', 'Denver, CO, USA', 180.00, '2023-04-01 13:15:00', '2023-04-01 13:15:00'),

-- Emma Wilson's Properties (UK)
('660e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440004', 'London Victorian Flat', 'Charming 2-bedroom Victorian flat in Central London. Original features with modern updates. Close to tube stations and major attractions.', 'London, UK', 200.00, '2023-04-10 15:40:00', '2023-04-10 15:40:00'),
('660e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440004', 'Countryside Cottage', 'Peaceful 3-bedroom cottage in the English countryside. Beautiful gardens, village pub nearby, perfect for relaxing getaway from city life.', 'Cotswolds, UK', 175.00, '2023-05-01 10:25:00', '2023-05-01 10:25:00'),

-- Carlos Rodriguez's Properties (Spain)
('660e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440005', 'Barcelona Beach Apartment', 'Stylish 2-bedroom apartment just 2 blocks from the beach. Modern kitchen, balcony with sea views, walking distance to restaurants and nightlife.', 'Barcelona, Spain', 140.00, '2023-05-20 14:50:00', '2023-05-20 14:50:00'),
('660e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440005', 'Madrid City Center Loft', 'Industrial-style loft in the heart of Madrid. High ceilings, exposed beams, near Puerta del Sol and major museums. Perfect for culture enthusiasts.', 'Madrid, Spain', 160.00, '2023-06-10 11:35:00', '2023-06-10 11:35:00');

-- =====================================================
-- 3. SAMPLE BOOKINGS
-- =====================================================

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status, created_at) VALUES
-- Confirmed Bookings
('770e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440010', '2024-03-15', '2024-03-18', 'confirmed', '2024-02-01 10:30:00'),
('770e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440011', '2024-04-01', '2024-04-07', 'confirmed', '2024-02-15 14:20:00'),
('770e8400-e29b-41d4-a716-446655440003', '660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440012', '2024-05-10', '2024-05-15', 'confirmed', '2024-03-01 16:45:00'),
('770e8400-e29b-41d4-a716-446655440004', '660e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440013', '2024-06-20', '2024-06-25', 'confirmed', '2024-04-10 09:15:00'),
('770e8400-e29b-41d4-a716-446655440005', '660e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440014', '2024-07-01', '2024-07-10', 'confirmed', '2024-05-01 12:30:00'),
('770e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440015', '2024-08-15', '2024-08-20', 'confirmed', '2024-06-01 15:10:00'),

-- Pending Bookings
('770e8400-e29b-41d4-a716-446655440007', '660e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440010', '2024-09-01', '2024-09-05', 'pending', '2024-07-15 11:20:00'),
('770e8400-e29b-41d4-a716-446655440008', '660e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440011', '2024-10-12', '2024-10-18', 'pending', '2024-08-01 13:45:00'),

-- Canceled Booking
('770e8400-e29b-41d4-a716-446655440009', '660e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440012', '2024-11-01', '2024-11-05', 'canceled', '2024-08-15 10:00:00'),

-- Past Bookings (for reviews)
('770e8400-e29b-41d4-a716-446655440010', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440013', '2023-12-20', '2023-12-23', 'confirmed', '2023-11-01 14:30:00'),
('770e8400-e29b-41d4-a716-446655440011', '660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440014', '2023-11-15', '2023-11-22', 'confirmed', '2023-10-01 16:20:00'),
('770e8400-e29b-41d4-a716-446655440012', '660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440015', '2023-10-05', '2023-10-10', 'confirmed', '2023-09-01 12:15:00');

-- =====================================================
-- 4. SAMPLE PAYMENTS
-- =====================================================

INSERT INTO Payment (payment_id, booking_id, amount, payment_method, payment_date) VALUES
-- Payments for confirmed bookings
('880e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440001', 450.00, 'credit_card', '2024-02-01 11:00:00'),
('880e8400-e29b-41d4-a716-446655440002', '770e8400-e29b-41d4-a716-446655440002', 3000.00, 'stripe', '2024-02-15 14:45:00'),
('880e8400-e29b-41d4-a716-446655440003', '770e8400-e29b-41d4-a716-446655440003', 1250.00, 'paypal', '2024-03-01 17:10:00'),
('880e8400-e29b-41d4-a716-446655440004', '770e8400-e29b-41d4-a716-446655440004', 1000.00, 'credit_card', '2024-04-10 09:45:00'),
('880e8400-e29b-41d4-a716-446655440005', '770e8400-e29b-41d4-a716-446655440005', 1260.00, 'stripe', '2024-05-01 12:55:00'),
('880e8400-e29b-41d4-a716-446655440006', '770e8400-e29b-41d4-a716-446655440006', 600.00, 'credit_card', '2024-06-01 15:30:00'),

-- Payments for past bookings
('880e8400-e29b-41d4-a716-446655440010', '770e8400-e29b-41d4-a716-446655440010', 450.00, 'credit_card', '2023-11-01 15:00:00'),
('880e8400-e29b-41d4-a716-446655440011', '770e8400-e29b-41d4-a716-446655440011', 3500.00, 'paypal', '2023-10-01 16:45:00'),
('880e8400-e29b-41d4-a716-446655440012', '770e8400-e29b-41d4-a716-446655440012', 1250.00, 'stripe', '2023-09-01 12:40:00');

-- =====================================================
-- 5. SAMPLE REVIEWS
-- =====================================================

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
-- Reviews for past stays
('990e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440013', 5, 'Amazing apartment in perfect location! John was a great host, very responsive and helpful. The apartment was exactly as described - clean, modern, and well-equipped. Would definitely stay here again!', '2023-12-24 10:15:00'),

('990e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440014', 5, 'Absolutely stunning beachfront villa! The views were breathtaking and the private beach access was incredible. Sarah thought of everything - the place was spotless and had all the amenities we needed. Perfect for our family vacation!', '2023-11-23 14:30:00'),

('990e8400-e29b-41d4-a716-446655440003', '660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440015', 4, 'Great mountain retreat! The cabin was cozy and well-maintained. Hot tub was perfect after hiking all day. Only minor issue was the WiFi was a bit spotty, but that actually helped us disconnect and enjoy nature. Michael was very helpful with local recommendations.', '2023-10-11 16:45:00'),

-- Additional reviews for variety
('990e8400-e29b-41d4-a716-446655440004', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440011', 4, 'Really nice place in downtown NYC. Clean, comfortable, and great location for exploring the city. John responded quickly to all our questions. Only downside was some street noise at night, but that is expected in the city.', '2024-01-15 11:20:00'),

('990e8400-e29b-41d4-a716-446655440005', '660e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440012', 5, 'Lovely Victorian flat in an excellent London location! Emma was the perfect host - very welcoming and provided great local tips. The flat had beautiful period features but with all modern conveniences. Highly recommend!', '2024-02-10 13:45:00'),

('990e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440010', 5, 'Perfect Barcelona location! Just steps from the beach and tons of great restaurants nearby. Carlos gave us excellent recommendations and the apartment was exactly as pictured. Will definitely book again on our next trip to Barcelona!', '2024-03-05 09:30:00'),

('990e8400-e29b-41d4-a716-446655440007', '660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440015', 4, 'Beautiful villa with amazing ocean views! The pool area was fantastic and the beach access was so convenient. Sarah was great to work with. Only minor issue was the air conditioning in one bedroom, but overall an excellent stay.', '2023-09-20 15:10:00');

-- =====================================================
-- 6. SAMPLE MESSAGES
-- =====================================================

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
-- Pre-booking inquiries
('aa0e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440001', 'Hi John, I am interested in booking your downtown apartment for March 15-18. Is it available? Also, is there parking available?', '2024-01-30 14:20:00'),

('aa0e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440010', 'Hi Alice! Yes, the apartment is available for those dates. There is a parking garage next door for $20/night. The apartment has everything you need for a comfortable stay. Would you like to proceed with the booking?', '2024-01-30 15:45:00'),

('aa0e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440001', 'Perfect! Yes, I would like to book it. Just sent the booking request. Looking forward to my stay!', '2024-01-30 16:10:00'),

-- Booking-related messages
('aa0e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440002', 'Hi Sarah, we are so excited about our upcoming stay at your beachfront villa! Could you please send check-in instructions? Also, is the pool heated?', '2024-03-25 10:30:00'),

('aa0e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440011', 'Hi Bob! So glad you are excited! I will send detailed check-in instructions 2 days before your arrival. Yes, the pool is heated year-round. Can not wait to host you and your family!', '2024-03-25 12:15:00'),

-- Check-in assistance
('aa0e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440003', 'Hi Michael, we just arrived at the cabin but can not find the key lockbox. Could you help us?', '2024-05-10 16:30:00'),

('aa0e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440012', 'Hi Lisa! The lockbox is around the back of the cabin, on the right side of the back door. The code is 1234. Sorry for the confusion! Let me know if you need anything else.', '2024-05-10 16:45:00'),

('aa0e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440003', 'Found it! Thank you so much. The cabin is beautiful, we love it already!', '2024-05-10 17:00:00'),

-- Post-stay follow-up
('aa0e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440013', 'Hi David, thank you so much for staying at my London flat! I hope you had a wonderful time. Would you mind leaving a review? It really helps other guests discover the property.', '2024-06-26 10:00:00'),

('aa0e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440004', 'Hi Emma! We had an absolutely fantastic stay! Your flat is beautiful and the location was perfect. I will definitely leave a 5-star review. Thank you for being such a wonderful host!', '2024-06-26 14:30:00');

-- =====================================================
-- 7. VERIFY SAMPLE DATA WITH QUERIES
-- =====================================================

-- Query to verify data insertion
-- SELECT 'Users' as Table_Name, COUNT(*) as Record_Count FROM User
-- UNION ALL
-- SELECT 'Properties', COUNT(*) FROM Property  
-- UNION ALL
-- SELECT 'Bookings', COUNT(*) FROM Booking
-- UNION ALL  
-- SELECT 'Payments', COUNT(*) FROM Payment
-- UNION ALL
-- SELECT 'Reviews', COUNT(*) FROM Review
-- UNION ALL
-- SELECT 'Messages', COUNT(*) FROM Message;

-- Query to test BookingWithPrice view
-- SELECT 
--     booking_id,
--     property_name,
--     guest_name,
--     start_date,
--     end_date,
--     nights_booked,
--     price_per_night,
--     total_price,
--     status
-- FROM BookingWithPrice 
-- ORDER BY start_date;

-- =====================================================
-- SAMPLE DATA INSERTION COMPLETE
-- Total Records: 12 Users, 10 Properties, 12 Bookings, 
--                9 Payments, 7 Reviews, 10 Messages
-- =====================================================
