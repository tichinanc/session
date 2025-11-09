-- How much money is still pending in different accounts recievable statuses? --

SELECT 
    ar_status,
    COUNT(*) AS claim_count,
    ROUND(AVG(billed_amount - paid_amount), 2) AS avg_outstanding_balance
FROM claims
GROUP BY ar_status;