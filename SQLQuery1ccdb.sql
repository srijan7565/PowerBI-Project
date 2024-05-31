
--
select * from cc_detail
-- 10,108 rows record

select * from cc_add
-- 185 records


-- Check 

SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'cc_detail' AND DATA_TYPE = 'smallint';


-- step 1 Alter Column Data Types:

ALTER TABLE cc_detail
ALTER COLUMN Annual_Fees INT;

ALTER TABLE cc_detail
ALTER COLUMN current_year INT;

ALTER TABLE cc_detail
ALTER COLUMN Total_Revolving_Bal INT;

ALTER TABLE cc_detail
ALTER COLUMN Total_Trans_Amt INT;

-- Step 2 Perform the Insert:

INSERT INTO cc_detail (
    Client_Num, 
    Card_Category, 
    Annual_Fees, 
    Activation_30_Days, 
    Customer_Acq_Cost, 
    Week_Start_Date, 
    Week_Num, 
    Qtr, 
    current_year, 
    Credit_Limit, 
    Total_Revolving_Bal, 
    Total_Trans_Amt, 
    Total_Trans_Vol, 
    Avg_Utilization_Ratio, 
    Use_Chip, 
    Exp_Type, 
    Interest_Earned, 
    Delinquent_Acc
)
SELECT 
    Client_Num, 
    Card_Category, 
    Annual_Fees, 
    Activation_30_Days, 
    Customer_Acq_Cost, 
    Week_Start_Date, 
    Week_Num, 
    Qtr, 
    current_year, 
    Credit_Limit, 
    Total_Revolving_Bal, 
    Total_Trans_Amt, 
    CAST(Total_Trans_Ct AS INT) AS Total_Trans_Vol, 
    Avg_Utilization_Ratio, 
    Use_Chip, 
    Exp_Type, 
    Interest_Earned, 
    Delinquent_Acc
FROM cc_add;


-- Check the structure of cc_detail
EXEC sp_help 'cc_detail';

-- Check the structure of cc_add
EXEC sp_help 'cc_add';




select * from cust_detail
-- -- 10,108 rows record

select * from cust_add
-- 185 rows 
-- total record will be 10293 now 

INSERT INTO cust_detail (Client_Num,	Customer_Age,	Gender,	Dependent_Count,	Education_Level,	Marital_Status,	state_cd,	Zipcode,	
Car_Owner,	House_Owner,	Personal_loan,	contact,	Customer_Job,	Income,	Cust_Satisfaction_Score	
 )
SELECT Client_Num,	Customer_Age,	Gender,	Dependent_Count,	Education_Level,	Marital_Status,	state_cd,	Zipcode,	
Car_Owner,	House_Owner,	Personal_loan,	contact,	Customer_Job,	Income,	Cust_Satisfaction_Score		    
FROM cust_add;

