-- How much of our billed revenue are we actually getting reimbursed? --

SELECT 
    ROUND(SUM(paid_amount) / SUM(billed_amount) * 100, 2) AS reimbursement_rate
FROM claims;
