-- Dataset size
SELECT COUNT(*) AS total_rows
FROM fraud_all;

--Fraud vs non-fraud distribution
SELECT
    is_fraud,
    COUNT(*) AS transaction_count
FROM fraud_cleaned
GROUP BY is_fraud
ORDER BY is_fraud;

--Fraud percentage
SELECT
    ROUND(100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*), 4) AS fraud_percentage
FROM fraud_cleaned;

--Transaction amount summary
SELECT
    MIN(amt) AS min_amt,
    MAX(amt) AS max_amt,
    ROUND(AVG(amt), 2) AS avg_amt
FROM fraud_cleaned;

--Transaction amount by fraud class
SELECT
    is_fraud,
    COUNT(*) AS transactions,
    ROUND(AVG(amt), 2) AS avg_amount,
    MIN(amt) AS min_amount,
    MAX(amt) AS max_amount
FROM fraud_cleaned
GROUP BY is_fraud
ORDER BY is_fraud;

--Most common categories
SELECT
    category,
    COUNT(*) AS category_count
FROM fraud_cleaned
GROUP BY category
ORDER BY category_count DESC
LIMIT 10;

--Fraud count by category
SELECT
    category,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_count
FROM fraud_cleaned
GROUP BY category
ORDER BY fraud_count DESC;

--Fraud rate by category
SELECT
    category,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        4
    ) AS fraud_rate_pct
FROM fraud_cleaned
GROUP BY category
ORDER BY fraud_rate_pct DESC;

--Transactions by gender
SELECT
    gender,
    COUNT(*) AS transaction_count
FROM fraud_cleaned
GROUP BY gender
ORDER BY transaction_count DESC;

--Fraud rate by gender
SELECT
    gender,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        4
    ) AS fraud_rate_pct
FROM fraud_cleaned
GROUP BY gender
ORDER BY fraud_rate_pct DESC;

--Top states by transaction volume
SELECT
    state,
    COUNT(*) AS transaction_count
FROM fraud_cleaned
GROUP BY state
ORDER BY transaction_count DESC
LIMIT 10;

--Fraud rate by state
SELECT
    state,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        4
    ) AS fraud_rate_pct
FROM fraud_cleaned
GROUP BY state
HAVING COUNT(*) >= 1000
ORDER BY fraud_rate_pct DESC;

--City population summary
SELECT
    MIN(city_pop) AS min_city_pop,
    MAX(city_pop) AS max_city_pop,
    ROUND(AVG(city_pop), 2) AS avg_city_pop
FROM fraud_cleaned;

--Fraud rate by hour of day
SELECT
    EXTRACT(HOUR FROM trans_date_trans_time) AS trans_hour,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        4
    ) AS fraud_rate_pct
FROM fraud_cleaned
GROUP BY EXTRACT(HOUR FROM trans_date_trans_time)
ORDER BY trans_hour;

--Fraud rate by day of week
SELECT
    TO_CHAR(trans_date_trans_time, 'Day') AS day_of_week,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        4
    ) AS fraud_rate_pct
FROM fraud_cleaned
GROUP BY TO_CHAR(trans_date_trans_time, 'Day')
ORDER BY fraud_rate_pct DESC;

--Age calculation
SELECT
    ROUND(AVG(EXTRACT(YEAR FROM AGE(trans_date_trans_time, dob))), 2) AS avg_age,
    MIN(EXTRACT(YEAR FROM AGE(trans_date_trans_time, dob))) AS min_age,
    MAX(EXTRACT(YEAR FROM AGE(trans_date_trans_time, dob))) AS max_age
FROM fraud_cleaned;

--Fraud rate by age band
SELECT
    CASE
        WHEN EXTRACT(YEAR FROM AGE(trans_date_trans_time, dob)) < 25 THEN 'Under 25'
        WHEN EXTRACT(YEAR FROM AGE(trans_date_trans_time, dob)) BETWEEN 25 AND 34 THEN '25-34'
        WHEN EXTRACT(YEAR FROM AGE(trans_date_trans_time, dob)) BETWEEN 35 AND 44 THEN '35-44'
        WHEN EXTRACT(YEAR FROM AGE(trans_date_trans_time, dob)) BETWEEN 45 AND 54 THEN '45-54'
        WHEN EXTRACT(YEAR FROM AGE(trans_date_trans_time, dob)) BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS age_group,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        4
    ) AS fraud_rate_pct
FROM fraud_cleaned
GROUP BY age_group
ORDER BY fraud_rate_pct DESC;

--Fraud-only analysis
SELECT
    category,
    COUNT(*) AS fraud_count
FROM fraud_cleaned
WHERE is_fraud = 1
GROUP BY category
ORDER BY fraud_count DESC
LIMIT 10;

--Average fraud amount by category
SELECT
    category,
    ROUND(AVG(amt), 2) AS avg_fraud_amount
FROM fraud_cleaned
WHERE is_fraud = 1
GROUP BY category
ORDER BY avg_fraud_amount DESC;
