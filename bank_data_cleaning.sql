CREATE DATABASE IF NOT EXISTS bank_data_project;
USE bank_data_project;
select * from bank_transactions_dirty;


update bank_transactions_dirty
set Merchant = trim(Merchant);


describe
update bank_transactions_dirty
set type = case
when lower(type) = 'debit' then 'Debit'
when lower(type) = 'credit' then 'Credit'
else type
end;


describe bank_transactions_dirty;


ALTER TABLE bank_transactions_dirty ADD COLUMN Clean_Date DATE;

UPDATE bank_transactions_dirty
SET Clean_Date = 
    CASE
        WHEN Date LIKE '%/%/%' THEN STR_TO_DATE(Date, '%Y/%m/%d')
        WHEN Date LIKE '%-%-%' AND LENGTH(SUBSTRING_INDEX(Date, '-', 1)) = 4 THEN STR_TO_DATE(Date, '%Y-%m-%d')
        WHEN Date LIKE '%-%-%' THEN STR_TO_DATE(Date, '%d-%m-%Y')
        ELSE NULL
    END;

ALTER TABLE bank_transactions_dirty ADD COLUMN Clean_Amount DECIMAL(10,2);

UPDATE bank_transactions_dirty
SET Clean_Amount = NULLIF(Amount, '');


UPDATE bank_transactions_dirty
SET Country = CONCAT(UCASE(LEFT(Country, 1)), LCASE(SUBSTRING(Country, 2)));

update  bank_transactions_dirty
set CardType = 'Unknown'
where CardType is null or CardType = '';

update  bank_transactions_dirty
set Clean_Amount = 0
where Clean_Amount is null;

-- Step 1: Add a temporary unique ID
ALTER TABLE bank_transactions_dirty ADD COLUMN temp_id INT AUTO_INCREMENT PRIMARY KEY;


delete T1 from bank_transactions_dirty T1
join bank_transactions_dirty T2
on T1.TransactionID = T2.TransactionID
and T1.temp_id > T2.temp_id;


Alter table  bank_transactions_dirty drop column temp_id;

SELECT * FROM bank_transactions_dirty LIMIT 10;

SELECT COUNT(*) AS Total_Rows FROM bank_transactions_dirty;
SELECT COUNT(DISTINCT TransactionID) AS Unique_Transactions FROM bank_transactions_dirty;


