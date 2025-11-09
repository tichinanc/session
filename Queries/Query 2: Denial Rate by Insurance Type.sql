-- Which insurance payers have the highest denial rates?

SELECT 
    insurance_type,
    COUNT(CASE WHEN claim_status = 'Denied' THEN 1 END) * 100.0 / COUNT(*) AS denial_rate
FROM claims
GROUP BY insurance_type
ORDER BY denial_rate DESC;