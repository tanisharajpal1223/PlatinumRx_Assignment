/* ===================================================== */
/*           CLINIC MANAGEMENT DATABASE SETUP            */
/* ===================================================== */


/* ========================= */
/*        CLINICS TABLE      */
/* ========================= */
CREATE TABLE clinics (
    cid VARCHAR(50),
    clinic_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

/* Inserting sample data into CLINICS table */
INSERT INTO clinics VALUES
('cnc-0100001','XYZ Clinic','New York','NY','USA'),
('cnc-0200002','ABC Clinic','Los Angeles','CA','USA'),
('cnc-0300003','Health Plus','Chicago','IL','USA'),
('cnc-0400004','Care Well','Houston','TX','USA'),
('cnc-0500005','MediCare','Phoenix','AZ','USA'),
('cnc-0600006','City Care','New York','NY','USA'),
('cnc-0700007','Wellness Hub','New York','NY','USA'),
('cnc-0800008','Health First','Los Angeles','CA','USA'),
('cnc-0900009','Prime Clinic','Chicago','IL','USA');


/* ========================= */
/*       CUSTOMER TABLE      */
/* ========================= */
CREATE TABLE customer (
    uid VARCHAR(50),
    name VARCHAR(100),
    mobile VARCHAR(15)
);

/* Inserting sample data into CUSTOMER table */
INSERT INTO customer VALUES
('cust-001','John Doe','97XXXXXXXX'),
('cust-002','Jane Smith','98XXXXXXXX'),
('cust-003','Mike Ross','95XXXXXXXX'),
('cust-004','Alice Brown','91XXXXXXXX'),
('cust-005','Bob Martin','92XXXXXXXX'),
('cust-006','Charlie Lee','93XXXXXXXX'),
('cust-007','David Kim','94XXXXXXXX'),
('cust-008','Eva Green','95XXXXXXXX'),
('cust-009','Frank Wright','96XXXXXXXX'),
('cust-010','Grace Hall','97XXXXXXXX'),
('cust-011','Henry Clark','98XXXXXXXX'),
('cust-012','Ivy Adams','99XXXXXXXX'),
('cust-013','Jack Turner','90XXXXXXXX'),
('cust-014','Karen Scott','91XXXXXXXX'),
('cust-015','Liam Young','92XXXXXXXX');


/* =============================== */
/*      CLINIC SALES TABLE         */
/* =============================== */
CREATE TABLE clinic_sales (
    oid VARCHAR(50),
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount FLOAT,
    datetime DATETIME,
    sales_channel VARCHAR(50)
);

/* Inserting sample data into CLINIC_SALES table */
INSERT INTO clinic_sales VALUES

-- 2021 Sales
('ord-001','cust-001','cnc-0100001',24999,'2021-09-23 12:03:22','online'),
('ord-002','cust-002','cnc-0200002',15000,'2021-09-25 10:15:00','offline'),
('ord-003','cust-003','cnc-0100001',30000,'2021-10-01 11:00:00','online'),
('ord-004','cust-004','cnc-0300003',20000,'2021-10-05 14:30:00','offline'),

-- Additional data for Top 10 analysis
('ord-005','cust-005','cnc-0400004',50000,'2021-11-10 10:00:00','online'),
('ord-006','cust-006','cnc-0500005',45000,'2021-11-11 11:00:00','offline'),
('ord-007','cust-007','cnc-0100001',60000,'2021-11-12 12:00:00','online'),
('ord-008','cust-008','cnc-0200002',55000,'2021-11-13 13:00:00','offline'),
('ord-009','cust-009','cnc-0300003',70000,'2021-11-14 14:00:00','online'),
('ord-010','cust-010','cnc-0400004',65000,'2021-11-15 15:00:00','offline'),
('ord-011','cust-011','cnc-0500005',72000,'2021-11-16 16:00:00','online'),
('ord-012','cust-012','cnc-0100001',80000,'2021-11-17 17:00:00','offline'),
('ord-013','cust-013','cnc-0200002',90000,'2021-11-18 18:00:00','online'),
('ord-014','cust-014','cnc-0300003',75000,'2021-11-19 19:00:00','offline'),
('ord-015','cust-015','cnc-0400004',85000,'2021-11-20 20:00:00','online');


/* =============================== */
/*         EXPENSES TABLE         */
/* =============================== */
CREATE TABLE expenses (
    eid VARCHAR(50),
    cid VARCHAR(50),
    description VARCHAR(255),
    amount FLOAT,
    datetime DATETIME
);

/* Inserting sample data into EXPENSES table */
INSERT INTO expenses VALUES

-- Expenses for 2021
('exp-001','cnc-0100001','First-aid supplies',557,'2021-09-23 07:36:48'),
('exp-002','cnc-0100001','Equipment maintenance',1000,'2021-10-02 09:00:00'),
('exp-003','cnc-0200002','Staff salary',2000,'2021-09-26 08:00:00'),
('exp-004','cnc-0300003','Rent',3000,'2021-10-06 10:00:00'),

-- More expenses for analysis
('exp-005','cnc-0400004','Utilities',1200,'2021-11-10 09:00:00'),
('exp-006','cnc-0500005','Cleaning',800,'2021-11-11 10:00:00'),
('exp-007','cnc-0100001','Security',1500,'2021-11-12 11:00:00'),
('exp-008','cnc-0200002','Maintenance',1800,'2021-11-13 12:00:00'),
('exp-009','cnc-0300003','Insurance',2200,'2021-11-14 13:00:00');