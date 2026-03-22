COPY fraud_train
FROM '/path/to/train.csv'
DELIMITER ','
CSV HEADER;

COPY fraud_test
FROM '/path/to/test.csv'
DELIMITER ','
CSV HEADER;

-- Combine Data
CREATE TABLE fraud_all AS
SELECT * FROM fraud_train
UNION ALL
SELECT * FROM fraud_test;
