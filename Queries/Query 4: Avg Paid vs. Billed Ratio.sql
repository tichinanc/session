-- Which providers have the highest and lowest reimbursement efficiency? --

SELECT 
    provider_id,
    ROUND(AVG(paid_amount / billed_amount) * 100, 2) AS avg_reimbursement_percentage
FROM claims
GROUP BY provider_id
ORDER BY avg_reimbursement_percentage DESC;