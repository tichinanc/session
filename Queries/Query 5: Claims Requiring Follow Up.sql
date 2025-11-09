-- How many of the claims that need follow-up are currently denied? --

SELECT 
    COUNT(*) AS total_follow_ups,
    COUNT(CASE WHEN claim_status = 'Denied' THEN 1 END) AS denied_claims_needing_follow_up
FROM claims
WHERE follow_up_required = 'Yes';
