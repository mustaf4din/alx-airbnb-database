# AirBnB Database Normalization Analysis - Achieving 3NF

## Executive Summary

This document analyzes the original AirBnB database schema for normalization compliance and identifies minimal adjustments needed to achieve Third Normal Form (3NF). The analysis focuses on the exact schema provided without over-engineering.

## Normalization Forms Review

### First Normal Form (1NF)
- Each table cell contains atomic values
- Each record is unique
- No repeating groups

### Second Normal Form (2NF) 
- Must be in 1NF
- All non-key attributes fully depend on the primary key
- No partial dependencies

### Third Normal Form (3NF)
- Must be in 2NF
- No transitive dependencies
- Non-key attributes depend only on the primary key

## Original Schema Analysis

### 1. User Table ✅ **Already in 3NF**
```sql
User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
```
- **1NF**: ✅ All attributes atomic
- **2NF**: ✅ All attributes depend on user_id  
- **3NF**: ✅ No transitive dependencies
- **Status**: No changes needed

### 2. Property Table ✅ **Already in 3NF**
```sql  
Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
```
- **1NF**: ✅ All attributes atomic
- **2NF**: ✅ All attributes depend on property_id
- **3NF**: ✅ No transitive dependencies
- **Status**: No changes needed

### 3. Booking Table ❌ **3NF Violation Found**
```sql
Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
```
- **1NF**: ✅ All attributes atomic
- **2NF**: ✅ All attributes depend on booking_id
- **3NF**: ❌ **VIOLATION** - `total_price` is a derived attribute

**Issue**: `total_price` can be calculated from:
- `property.price_per_night` (via property_id)  
- `DATEDIFF(end_date, start_date)` (booking duration)

This creates a transitive dependency: `booking_id → property_id → price_per_night`

### 4. Payment Table ✅ **Already in 3NF**
```sql
Payment (payment_id, booking_id, amount, payment_date, payment_method)
```
- **Status**: No changes needed

### 5. Review Table ✅ **Already in 3NF**
```sql
Review (review_id, property_id, user_id, rating, comment, created_at)
```
- **Status**: No changes needed

### 6. Message Table ✅ **Already in 3NF**  
```sql
Message (message_id, sender_id, recipient_id, message_body, sent_at)
```
- **Status**: No changes needed

## 3NF Solution - Minimal Changes

### Modified Booking Table (3NF Compliant)
```sql
Booking (
    booking_id,
    property_id, 
    user_id,
    start_date,
    end_date,
    -- REMOVE: total_price (derived attribute)
    status,
    created_at
)
```

### View for Total Price Calculation
```sql
CREATE VIEW BookingWithPrice AS
SELECT 
    b.*,
    p.price_per_night,
    (DATEDIFF(b.end_date, b.start_date) * p.price_per_night) AS total_price
FROM Booking b
JOIN Property p ON b.property_id = p.property_id;
```

## Normalization Steps Applied

### Step 1: Identify 3NF Violations
- **Found**: Only one violation in Booking table
- **Issue**: `total_price` is a derived/calculated attribute
- **Root Cause**: Creates transitive dependency through property_id

### Step 2: Remove Derived Attribute  
- **Action**: Remove `total_price` column from Booking table
- **Rationale**: Price can be calculated when needed
- **Benefit**: Eliminates data redundancy and update anomalies

### Step 3: Maintain Functionality
- **Solution**: Create view `BookingWithPrice` for calculated total
- **Benefit**: Applications can still access total_price seamlessly
- **Impact**: Minimal - just change table name in SELECT queries

## Updated Schema (3NF Compliant)

```sql
-- All tables remain the same EXCEPT:

CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    -- total_price REMOVED
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT pk_booking PRIMARY KEY (booking_id),
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Add calculated view
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
```

## Benefits of 3NF Compliance

### 1. Data Integrity
- **Eliminates Update Anomalies**: No risk of total_price becoming inconsistent
- **Single Source of Truth**: Price comes from Property table only
- **Automatic Consistency**: Calculated values always current

### 2. Storage Efficiency  
- **Reduced Redundancy**: No duplicate price information
- **Space Savings**: One less column per booking record
- **Cleaner Data**: No risk of stale calculated values

### 3. Maintenance Benefits
- **Price Updates**: Change price_per_night once, affects all calculations
- **Simpler Logic**: No need to recalculate stored totals
- **Fewer Bugs**: Eliminates sync issues between stored and calculated values

## Migration Strategy

### For Existing Data
```sql
-- Verify data consistency before migration
SELECT COUNT(*) FROM Booking b
JOIN Property p ON b.property_id = p.property_id  
WHERE b.total_price != (DATEDIFF(b.end_date, b.start_date) * p.price_per_night);

-- Drop total_price column after verification
ALTER TABLE Booking DROP COLUMN total_price;
```

### For Applications  
- **Change**: Replace `SELECT * FROM Booking` with `SELECT * FROM BookingWithPrice`
- **Impact**: Minimal code changes required
- **Benefit**: Seamless transition with better data integrity

## Conclusion

The original AirBnB schema was already well-designed and mostly 3NF compliant. Only **one simple change** was needed:

- ✅ **Removed**: `total_price` from Booking table (derived attribute)
- ✅ **Added**: `BookingWithPrice` view for calculated totals
- ✅ **Result**: Full 3NF compliance with minimal impact

The schema now guarantees:
- **1NF**: All attributes atomic ✅
- **2NF**: No partial dependencies ✅  
- **3NF**: No transitive dependencies ✅

This simple normalization maintains the original design's simplicity while ensuring proper database normalization principles.
