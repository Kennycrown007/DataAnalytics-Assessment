-- Question Four
-- Customer Lifetime Value (CLV) Estimation
-- Task: For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, calculate:
-- * Account tenure (months since signup)
-- * Total transactions
-- * Estimated CLV (Assume: CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction)
-- * Order by estimated CLV from highest to lowest


WITH transactions AS (
  SELECT 
    owner_id,
    COUNT(*) AS total_transactions,
    SUM(confirmed_amount) AS total_amount
  FROM savings_savingsaccount
  GROUP BY owner_id
),
tenure AS (
  SELECT 
    id AS customer_id,
    CONCAT(first_name, ' ', last_name) AS name,
    TIMESTAMPDIFF(MONTH, date_joined, CURDATE()) AS tenure_months
  FROM users_customuser
),
clv_calc AS (
  SELECT 
    t.customer_id,
    t.name,
    t.tenure_months,
    tr.total_transactions,
    ROUND((tr.total_transactions / NULLIF(t.tenure_months, 0)) * 12 * (tr.total_amount * 0.001 / tr.total_transactions), 2) AS estimated_clv
  FROM tenure t
  JOIN transactions tr ON t.customer_id = tr.owner_id
)
SELECT *
FROM clv_calc
ORDER BY estimated_clv DESC;
