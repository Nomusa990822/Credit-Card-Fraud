DROP VIEW IF EXISTS fraud_rate_by_category;
CREATE VIEW fraud_rate_by_category AS
SELECT
    category,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        4
    ) AS fraud_rate_pct
FROM fraud_cleaned
GROUP BY category;

DROP VIEW IF EXISTS fraud_rate_by_hour;
CREATE VIEW fraud_rate_by_hour AS
SELECT
    EXTRACT(HOUR FROM trans_date_trans_time) AS trans_hour,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        4
    ) AS fraud_rate_pct
FROM fraud_cleaned
GROUP BY EXTRACT(HOUR FROM trans_date_trans_time);

DROP VIEW IF EXISTS fraud_rate_by_gender;
CREATE VIEW fraud_rate_by_gender AS
SELECT
    gender,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        4
    ) AS fraud_rate_pct
FROM fraud_cleaned
GROUP BY gender;

DROP VIEW IF EXISTS fraud_rate_by_state;
CREATE VIEW fraud_rate_by_state AS
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
HAVING COUNT(*) >= 1000;
