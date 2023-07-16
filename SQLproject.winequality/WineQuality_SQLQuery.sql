-- Let's explore the two tables and their structure:
-- Show the tables in the database
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA = 'dbo';

-- Show the columns of a specific table (e.g., winequality-red)
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'winequality_red';

-- Examples of data retrieval:
-- Retrieve sample records from the red_wine table
SELECT TOP 10 *
FROM winequality_red;

-- Retrieve sample records from the white_wine table
SELECT TOP 10 *
FROM winequality_white;

-- Examples of filter and sort data:
-- Retrieve red wines with alcohol content greater than 12
SELECT *
FROM winequality_red
WHERE alcohol > 12
ORDER BY alcohol DESC;

-- Retrieve white wines with pH less than 3 and residual sugar greater than 5
SELECT *
FROM winequality_white
WHERE pH < 3 AND residual_sugar > 5
ORDER BY pH ASC;

-- Examples of aggregation and summary statistics:
-- Count the number of red wines with quality above 7
SELECT COUNT(*) AS CountQualityAbove7
FROM winequality_red
WHERE quality > 7;

-- Calculate the average residual sugar for white wines
SELECT AVG(residual_sugar) AS AvgResidualSugar
FROM winequality_white;

-- Examples of joins and relationships:
-- Retrieve red and white wines with matching sulphates values
SELECT r.*, w.*
FROM winequality_red r
JOIN winequality_white w ON r.sulphates = w.sulphates;

-- Retrieve red wines with their corresponding white wines based on quality (assumes same number of records)
SELECT r.*, w.quality AS white_quality
FROM winequality_red r
JOIN winequality_white w ON r.quality = w.quality;

-- Examples of data modification:
-- Insert a new record into the winequality-red table
INSERT INTO winequality_red (fixed_acidity, volatile_acidity, citric_acid, residual_sugar, chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density, pH, sulphates, alcohol, quality)
VALUES (7.2, 0.6, 0.1, 2.3, 0.08, 12, 36, 0.99, 3.2, 0.6, 11.5, 6);

-- Update the quality of a specific red wine with quality rated as 8
UPDATE winequality_red
SET quality = 8
WHERE alcohol = 8;

-- Delete all white wines with residual sugar less than 1
DELETE FROM winequality_white
WHERE residual_sugar < 1;





