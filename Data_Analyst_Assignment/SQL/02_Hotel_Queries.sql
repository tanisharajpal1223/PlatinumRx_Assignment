
select * from users;
select * from bookings;
select * from booking_commercials;
select * from items;



/* ===================================================== */
/* Q1: Get user_id and last booked room_no for each user  */
/* ===================================================== */

SELECT b.user_id, b.room_no
FROM bookings b
INNER JOIN (
    SELECT user_id, MAX(booking_date) AS last_booking
    FROM bookings
    GROUP BY user_id
) latest
ON b.user_id = latest.user_id 
AND b.booking_date = latest.last_booking;



/* ===================================================== */
/* Q2: Get booking_id and total billing amount for        */
/* bookings created in November 2021                      */
/* ===================================================== */

SELECT 
    b.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_bill_amount
FROM bookings b
JOIN booking_commercials bc 
    ON b.booking_id = bc.booking_id
JOIN items i 
    ON bc.item_id = i.item_id
WHERE MONTH(b.booking_date) = 11 
  AND YEAR(b.booking_date) = 2021
GROUP BY b.booking_id;



/* ===================================================== */
/* Q3: Get bill_id and bill amount for October 2021       */
/* where bill amount > 1000                               */
/* ===================================================== */

SELECT 
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i 
    ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 10 
  AND YEAR(bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000;



/* ===================================================== */
/* Q4: Most and Least ordered item of each month in 2021  */
/* ===================================================== */

WITH item_summary AS (
    SELECT 
        MONTH(bc.bill_date) AS month,
        i.item_name,
        SUM(bc.item_quantity) AS total_quantity
    FROM booking_commercials bc
    JOIN items i 
        ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), i.item_name
),

ranked_items AS (
    SELECT *,
        RANK() OVER (PARTITION BY month ORDER BY total_quantity DESC) AS rank_desc,
        RANK() OVER (PARTITION BY month ORDER BY total_quantity ASC) AS rank_asc
    FROM item_summary
)

SELECT 
    month,
    item_name,
    total_quantity,
    CASE 
        WHEN rank_desc = 1 THEN 'Most Ordered'
        WHEN rank_asc = 1 THEN 'Least Ordered'
    END AS category
FROM ranked_items
WHERE rank_desc = 1 OR rank_asc = 1;



/* ===================================================== */
/* Q5: Customers with 2nd highest bill value each month   */
/* (Without using WITH)                                   */
/* ===================================================== */

SELECT 
    t.month,
    t.user_id,
    t.bill_id,
    t.bill_amount
FROM (
    SELECT 
        MONTH(bc.bill_date) AS month,
        b.user_id,
        bc.bill_id,
        SUM(bc.item_quantity * i.item_rate) AS bill_amount,
        RANK() OVER (
            PARTITION BY MONTH(bc.bill_date) 
            ORDER BY SUM(bc.item_quantity * i.item_rate) DESC
        ) AS rnk
    FROM booking_commercials bc
    JOIN bookings b 
        ON bc.booking_id = b.booking_id
    JOIN items i 
        ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), b.user_id, bc.bill_id
) t
WHERE t.rnk = 2;