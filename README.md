
# Data Analytics Assessment

This repository contains the SQL solutions to the Data Analytics SQL Proficiency Assessment for Cowrywise Data Analyst role.


## Questions & Approach

### Q1 - High-Value Customers with Multiple Products
- Queried customers with at least one **funded savings plan** and one **funded investment plan**
- Used `is_regular_savings` and `is_a_fund` to identify product types
- Joined with transactions to compute **total deposits** (converted from kobo to naira)
  
![Assessment_Q1](https://github.com/user-attachments/assets/0bac4252-18dd-467d-8e5a-6835d76f6d89)


### Q2 - Transaction Frequency Analysis
- Counted deposit transactions per customer and measured over active months
- Categorized frequency:
  - **High Frequency** ≥ 10/month
  - **Medium** 3–9/month
  - **Low** ≤ 2/month

![Assessment_Q2](https://github.com/user-attachments/assets/21959113-cb27-48dd-b8e2-a149af948fdc)

### Q3 - Account Inactivity Alert
- Found latest transaction per plan from `savings_savingsaccount`
- Flagged accounts with **no inflows in last 365 days**
- Marked plan as "Savings" or "Investment" based on flags

![Assessment_Q3](https://github.com/user-attachments/assets/775bcacf-ef72-48a3-be77-07777b670e42)

### Q4 - Customer Lifetime Value (CLV) Estimation
- Computed account tenure (months since signup)
- Calculated CLV using:

![Assessment_Q4](https://github.com/user-attachments/assets/f429920c-ca83-4ce4-8345-b505a3cd4b22)


## ⚠️ Challenges
- Ensured robust division using `NULLIF()` to avoid divide-by-zero
- Amounts were stored in **kobo**, so conversion to **naira** was crucial



## 🚀 About Me
I am a statistics instructor turned research and data analyst. I've developed keen interest in analytical thinking, data analysis, and report writing during my university days and I'm passionately using data and insight to shape innovation. I have also engaged in extracurricular involvements which have shaped me into a proactive and collaborative team player.


## 🛠 Skills
Excel, Power Query, MySQL, PowerBI, SPSS, PLS-SEM, AMOS, Python


## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://www.datascienceportfol.io/KehindeAromona)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kehinde-gabriel-aromona-808578119)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/kennycrown7)

