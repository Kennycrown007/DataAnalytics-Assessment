-- Question Two
-- Transaction frequency classification per customer
-- Task: Calculate the average number of transactions per customer per month and categorize them

WITH transactions_per_customer AS (
  SELECT 
    owner_id,
    COUNT(*) AS total_transactions,
    TIMESTAMPDIFF(MONTH, MIN(transaction_date), MAX(transaction_date)) + 1 AS active_months
  FROM savings_savingsaccount
  GROUP BY owner_id
),
frequency_classified AS (
  SELECT 
    owner_id,
    ROUND(total_transactions / NULLIF(active_months, 0), 2) AS avg_tx_per_month,
    CASE
      WHEN total_transactions / NULLIF(active_months, 0) >= 10 THEN 'High Frequency'
      WHEN total_transactions / NULLIF(active_months, 0) >= 3 THEN 'Medium Frequency'
      ELSE 'Low Frequency'
    END AS frequency_category
  FROM transactions_per_customer
)
SELECT 
  frequency_category,
  COUNT(*) AS customer_count,
  ROUND(AVG(avg_tx_per_month), 2) AS avg_transactions_per_month
FROM frequency_classified
GROUP BY frequency_category
ORDER BY FIELD(frequency_category, 'High Frequency', 'Medium Frequency', 'Low Frequency');
