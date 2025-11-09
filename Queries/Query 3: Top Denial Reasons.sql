-- What are the most common reasons for denial of claims? --

SELECT 
    reason_code,
    COUNT(*) AS total_denials
FROM claims
WHERE claim_status = 'Denied'
GROUP BY reason_code
ORDER BY total_denials DESC;

