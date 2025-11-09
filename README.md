# Introduction
This project focuses on analyzing healthcare claim reimbursement data to uncover insights that can help a healthcare organization optimize its revenue cycle.
Using SQL, I explored key performance indicators such as reimbursement rates, denial reasons, and accounts receivable aging to identify financial inefficiencies and opportunities for improvement.

SQL queries? Check them out here: [Queries folder](/Queries/)
# Background
In healthcare, accurate and timely claim reimbursement is critical for maintaining financial stability. Claims may be denied, underpaid, or delayed due to errors in documentation, coding, or payer requirements.
By examining historical claims data, healthcare analysts can pinpoint where revenue leakage occurs and recommend data-driven solutions for:

- Reducing claim denials

- Improving cash flow

- Strengthening payer-provider relationships

This analysis represents the kind of work done by Healthcare Revenue Cycle Analysts and Data Analysts in real-world healthcare settings.

### The questions I wanted answered through my SQL queries were:
1. What percent of billed revenue is reimbursed?
2. Which insurers deny claims most?
3. Why are claims being denied?
4. Which providers are reimbursed most efficiently?
5. How many claims need follow-up?
6. How much revenue is still pending?
# Tools I Used
🐘 **PostgreSQL** → The database management system that I chose to store and manage my SQL queries

🧠 **SQL** → For querying and analyzing healthcare claim data

💻 **Visual Studio Code**→ For SQL scripting and project documentation

🌐 **GitHub** → For project version control and portfolio sharing
# Analysis
### 1. Overall Reimbursement Rate
This measures the overall collection effectiveness — how much of what the organization bills is actually received.
A lower reimbursement rate may indicate issues such as underpayments, incorrect coding, or delayed claims.
```
SELECT 
    ROUND(SUM(paid_amount) / SUM(billed_amount) * 100, 2) AS reimbursement_rate
FROM claims;
```
| Reimbursment Rate |  |
|---|---|
|67.46%| 

### 2. Denial Rate by Insurance Type
Identifying payers with high denial rates helps target process improvement efforts.
It’s crucial to know whether certain payers (e.g., Medicare, Medicaid, or private insurers) are responsible for a disproportionate share of denials.
```
SELECT 
    insurance_type,
    COUNT(CASE WHEN claim_status = 'Denied' THEN 1 END) * 100.0 / COUNT(*) AS denial_rate
FROM claims
GROUP BY insurance_type
ORDER BY denial_rate DESC;
```
| Insurance Type | Denial Rate |
|---|---|
| Commercial | 35.80%|
| Self-Pay | 34.33%|
| Medicare | 33.59%|
| Medicaid | 30.71%|

### 3. Top Denial Reasons
By analyzing denial codes, the organization can identify root causes — such as missing prior authorizations, invalid diagnosis codes, or late submissions.
```
SELECT 
    reason_code,
    COUNT(*) AS total_denials
FROM claims
WHERE claim_status = 'Denied'
GROUP BY reason_code
ORDER BY total_denials DESC;
```
| Reason Code                  | Total Denials |
|------------------------------|----------------|
| Pre-existing condition       | 27             |
| Authorization not obtained   | 27             |
| Service not covered          | 26             |
| Missing documentation        | 23             |
| Lack of medical necessity    | 23             |
| Duplicate claim              | 22             |
| Incorrect billing information| 22             |
| Patient eligibility issues   | 21             |

### 4. Average Paid vs. Billed Ratio by Provider
This measures how well individual providers’ claims are reimbursed relative to what they bill, helping evaluate performance consistency across the organization.
```
SELECT 
    provider_id,
    ROUND(AVG(paid_amount / billed_amount) * 100, 2) AS avg_reimbursement_percentage
FROM claims
GROUP BY provider_id
ORDER BY avg_reimbursement_percentage DESC;
```

### 5. Claims Requiring Follow-up
Tracking follow-up workload ensures that the billing team prioritizes claims that are most likely to recover lost revenue.
```
SELECT 
    COUNT(*) AS total_follow_ups,
    COUNT(CASE WHEN claim_status = 'Denied' THEN 1 END) AS denied_claims_needing_follow_up
FROM claims
WHERE follow_up_required = 'Yes';
```
| Total Follow Ups | Denied Claims |
|---|---|
| 284 | 95 |

### 6. Accounts Recieveable Aging Insight
This helps assess how long claims remain unpaid and where most pending revenue is concentrated.
Delays in payment can harm cash flow and increase the risk of bad debt write-offs.
```
SELECT 
    ar_status,
    COUNT(*) AS claim_count,
    ROUND(AVG(billed_amount - paid_amount), 2) AS avg_outstanding_balance
FROM claims
GROUP BY ar_status;
```
| AR Status       | Claim Count | Avg Outstanding Balance |
|-----------------|--------------|--------------------------|
| Open            | 86           | 98.33                    |
| Partially Paid  | 105          | 94.41                    |
| Closed          | 87           | 96.85                    |
| On Hold         | 91           | 107.57                   |
| Pending         | 95           | 99.55                    |
| Denied          | 103          | 97.46                    |



# What I Learned 
Through this project, I gained hands-on experience with:

- Writing, optimizing, and executing SQL queries for data analysis

- Designing and managing relational databases using PostgreSQL

- Structuring datasets for healthcare analytics and reimbursement insights

- Translating analytical findings into actionable business insights

- Documenting and maintaining SQL scripts in Visual Studio Code

- Understanding the financial impact of data analytics in Revenue Cycle Management (RCM)

- This project strengthened my technical and analytical skills for healthcare data analysis.
# Conclusion
### Insights
1.**Reimbursement Rate:** Guides improvements in claim submission and documentation quality.

2.**Denial Rate by Insurance Type:** Helps reduce rework and speed up reimbursement cycles

3.**Top Denial Reasons:** Reduces future denials and improves reimbursement turnaround times

4.**Average Paid vs. Billed Ratio by Provider:** Identifies top-performing providers

5.**Claims Requiring Follow-up:** Ensures denied claims are promptly corrected and resubmitted

6.**Accounts Recievable Aging:** Reduces accounts receivable aging and strengthens the revenue cycle

### Closing Thoughts
The Claims Reimbursement Analysis project demonstrates how SQL-driven analytics can significantly improve the financial performance of healthcare organizations.
By analyzing claim denial trends, payer behaviors, and provider efficiency, healthcare teams can make informed decisions to reduce denials, enhance revenue capture, and accelerate reimbursements.