-- Question One
-- High-Value Customers with Multiple Products
-- Task: Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.

SELECT 
  u.id AS owner_id,
  CONCAT(u.first_name, ' ', u.last_name) AS name,
  COUNT(DISTINCT CASE WHEN p.is_regular_savings = 1 AND p.amount > 0 THEN p.id END) AS savings_count,
  COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 AND p.amount > 0 THEN p.id END) AS investment_count,
  ROUND(SUM(sa.confirmed_amount) / 100, 2) AS total_deposits
FROM users_customuser u
JOIN plans_plan p ON u.id = p.owner_id
JOIN savings_savingsaccount sa ON sa.plan_id = p.id
WHERE p.amount > 0
GROUP BY u.id, u.first_name, u.last_name
HAVING savings_count >= 1 AND investment_count >= 1
ORDER BY total_deposits DESC;
