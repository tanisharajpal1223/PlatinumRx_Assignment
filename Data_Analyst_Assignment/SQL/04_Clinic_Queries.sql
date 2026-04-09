SELECT * FROM clinics;
SELECT * FROM customer;
SELECT * FROM clinic_sales;
SELECT * FROM expenses;




/* ===================================================== */
/* Q1: Revenue from each sales channel in a given year    */
/* ===================================================== */

SELECT 
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;



/* ===================================================== */
/* Q2: Top 10 most valuable customers in a given year     */
/* ===================================================== */

SELECT 
    c.uid,
    cu.name,
    SUM(c.amount) AS total_spent
FROM clinic_sales c
JOIN customer cu 
    ON c.uid = cu.uid
WHERE YEAR(c.datetime) = 2021
GROUP BY c.uid, cu.name
ORDER BY total_spent DESC
LIMIT 10;




/* ===================================================== */
/* Q3: Month-wise Revenue, Expense, Profit & Status       */
/* ===================================================== */

SELECT 
    r.month,
    r.total_revenue,
    e.total_expense,
    (r.total_revenue - e.total_expense) AS profit,
    CASE 
        WHEN (r.total_revenue - e.total_expense) > 0 THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM 
(
    SELECT MONTH(datetime) AS month, SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
) r
LEFT JOIN 
(
    SELECT MONTH(datetime) AS month, SUM(amount) AS total_expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
) e
ON r.month = e.month;



/* ===================================================== */
/* Q4: For each city -> most profitable clinic for a given month       */
/* ===================================================== */

SELECT 
    final.cid,
    final.clinic_name,
    final.city,
    final.profit
FROM (
    SELECT 
        s.cid,
        c.clinic_name,
        c.city,
        (s.total_sales - IFNULL(e.total_expenses, 0)) AS profit,
        RANK() OVER (PARTITION BY c.city ORDER BY (s.total_sales - IFNULL(e.total_expenses, 0)) DESC) AS rnk
    FROM (
        -- Total sales per clinic
        SELECT 
            cid,
            SUM(amount) AS total_sales
        FROM clinic_sales
        WHERE DATE_FORMAT(datetime, '%Y-%m') = '2021-11'
        GROUP BY cid
    ) s
    JOIN clinics c ON s.cid = c.cid
    LEFT JOIN (
        -- Total expenses per clinic
        SELECT 
            cid,
            SUM(amount) AS total_expenses
        FROM expenses
        WHERE DATE_FORMAT(datetime, '%Y-%m') = '2021-11'
        GROUP BY cid
    ) e ON s.cid = e.cid
) final
WHERE final.rnk = 1;



/* ===================================================== */
/* Q5: Second least profitable clinic for each state      */
/* ===================================================== */

SELECT 
    t1.state,
    t1.cid,
    t1.clinic_name,
    t1.profit
FROM
(
    SELECT 
        cl.state,
        cl.cid,
        cl.clinic_name,
        SUM(IFNULL(cs.amount, 0)) - SUM(IFNULL(ex.amount, 0)) AS profit
    FROM clinics cl
    LEFT JOIN clinic_sales cs 
        ON cl.cid = cs.cid
    LEFT JOIN expenses ex 
        ON cl.cid = ex.cid
    GROUP BY cl.state, cl.cid, cl.clinic_name
) t1
WHERE (
    SELECT COUNT(*) 
    FROM (
        SELECT 
            cl2.cid,
            SUM(IFNULL(cs2.amount, 0)) - SUM(IFNULL(ex2.amount, 0)) AS profit
        FROM clinics cl2
        LEFT JOIN clinic_sales cs2 
            ON cl2.cid = cs2.cid
        LEFT JOIN expenses ex2 
            ON cl2.cid = ex2.cid
        WHERE cl2.state = t1.state
        GROUP BY cl2.cid
    ) t2
    WHERE t2.profit < t1.profit
) = 1;
