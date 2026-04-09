/* ===================================================== */
/*           HOTEL MANAGEMENT DATABASE SETUP             */
/* ===================================================== */


/* ========================= */
/*        USERS TABLE        */
/* ========================= */
CREATE TABLE users (
    user_id VARCHAR(50),
    name VARCHAR(100),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);

/* Inserting sample data into USERS table */
INSERT INTO users VALUES
('21wrcxuy-67erfn','John Doe','97XXXXXXXX','john@example.com','XX, Street Y, ABC City'),
('23abcdef-43ecgh','Jane Smith','98XXXXXXXX','jane@example.com','PQ, Street Z, MNP City'),
('78prstyh-69gdjd','Mike Ross','95XXXXXXXX','mike@example.com','AB, Street C, YZX City');


/* ========================= */
/*       BOOKINGS TABLE      */
/* ========================= */
CREATE TABLE bookings (
    booking_id VARCHAR(50),
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50)
);

/* Inserting sample data into BOOKINGS table */
INSERT INTO bookings VALUES
('bk-09f3e-95hj','2021-09-23 07:36:48','rm-bhf9-aerjn','21wrcxuy-67erfn'),
('bk-11ab2-22kk','2021-11-10 10:15:00','rm-a1b2-c3d4','23abcdef-43ecgh'),
('bk-22cd3-33ll','2021-11-20 14:30:00','rm-x9y8-z7w6','78prstyh-69gdjd'),
('bk-q034-q4o','2021-10-05 09:00:00','rm-p0o9-i8u7','21wrcxuy-67erfn'),
('bk-88zz9-77pp','2021-10-15 18:45:00','rm-l5k4-j3h2','23abcdef-43ecgh');


/* ========================= */
/*        ITEMS TABLE        */
/* ========================= */
CREATE TABLE items (
    item_id VARCHAR(50),
    item_name VARCHAR(100),
    item_rate FLOAT
);

/* Inserting sample data into ITEMS table */
INSERT INTO items VALUES
('itm-a9e8-q8fu','Tawa Paratha',18),
('itm-a07vh-aer8','Mix Veg',89),
('itm-w978-23u4','Paneer Butter Masala',150),
('itm-x1y2-z3a4','Dal Fry',60),
('itm-b5c6-d7e8','Jeera Rice',70);


/* ================================ */
/*   BOOKING COMMERCIALS TABLE      */
/* ================================ */
CREATE TABLE booking_commercials (
    id VARCHAR(50),
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity FLOAT
);

/* Inserting sample data into BOOKING_COMMERCIALS table */
INSERT INTO booking_commercials VALUES

-- September bookings
('q34r-3q4o8-q34u','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a9e8-q8fu',3),
('q3o4-ahf32-o2u4','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a07vh-aer8',1),

-- October bookings
('134lr-oyfo8-3qk4','bk-q034-q4o','bl-34qhd-r7h8','2021-10-05 12:05:37','itm-w978-23u4',2),
('34qj-k3q4h-q34k','bk-q034-q4o','bl-34qhd-r7h8','2021-10-05 12:05:37','itm-x1y2-z3a4',5),

('55aa-66bb-77cc','bk-88zz9-77pp','bl-22qq1-33ww','2021-10-15 20:00:00','itm-x1y2-z3a4',10),
('44dd-55ee-66ff','bk-88zz9-77pp','bl-22qq1-33ww','2021-10-15 20:00:00','itm-b5c6-d7e8',8),

-- November bookings
('78yu-56gh-12jk','bk-11ab2-22kk','bl-55tt9-88yy','2021-11-10 13:00:00','itm-b5c6-d7e8',4),
('89io-90pl-45mn','bk-11ab2-22kk','bl-55tt9-88yy','2021-11-10 13:00:00','itm-a07vh-aer8',3),

('12qw-34er-56ty','bk-22cd3-33ll','bl-99oo8-77ii','2021-11-20 16:00:00','itm-w978-23u4',6),
('98zx-76cv-54bn','bk-22cd3-33ll','bl-99oo8-77ii','2021-11-20 16:00:00','itm-a9e8-q8fu',10);