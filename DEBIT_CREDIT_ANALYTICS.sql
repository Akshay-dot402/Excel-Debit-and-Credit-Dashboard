use banking_data;
show tables;
select * from debit_and_credit_analytics;
#---------------------------1KPI-------------------------
select `transaction type`,sum(amount) as total_debit_amount from debit_and_credit_analytics
where `Transaction Type`= "debit";
#--------------------------2KPI--------------------------
select `transaction type`,sum(amount) as total_credit_amount from debit_and_credit_analytics
where `Transaction Type`= "credit";
#----------------------------3KPI-------------------------
SELECT 
    SUM(CASE WHEN `transaction type` = 'Credit' THEN amount ELSE 0 END) /
    SUM(CASE WHEN `transaction type` = 'Debit' THEN amount ELSE 0 END)
    AS credit_debit_ratio
FROM DEBIT_AND_CREDIT_ANALYTICS;
#------------------------------------4KPI-------------------
select
    sum(case when `transaction type` = 'credit' then amount else 0 end)-
    sum(case when `transaction type` = 'debit' then amount else 0 end)
    as net_transaction_amount
    from debit_and_credit_analytics;
#-------------------------------------5KPI---------------------
SELECT 
    `customer id`,
    COUNT(*)/ NULLIF(MAX(balance), 0) AS account_activity_ratio
FROM debit_and_credit_analytics
GROUP BY `customer id`;
#-------------------------------------6KPI------------------------
SELECT 
    DATE(`transaction date`) AS day,
    COUNT(*) AS transactions_per_day
FROM DEBIT_AND_CREDIT_ANALYTICS
GROUP BY DATE(`transaction date`)
ORDER BY day;
SELECT 
    YEARWEEK(`transaction date`) AS year_week,
    COUNT(*) AS transactions_per_week
FROM debit_and_credit_analytics
GROUP BY yearweek(`transaction date`)
ORDER BY year_week;
SELECT 
    DATE_FORMAT(`transaction date`, '%Y-%m') AS month,
    COUNT(*) AS transactions_per_month
FROM DEBIT_AND_CREDIT_ANALYTICS
GROUP BY DATE_FORMAT(`transaction date`, '%Y-%m')
ORDER BY month;
#---------------------------7KPI-------------------------
SELECT 
branch,SUM(amount) AS total_transaction_amount
FROM debit_and_credit_analytics
GROUP BY branch
ORDER BY total_transaction_amount DESC;





    




