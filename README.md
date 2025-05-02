# Retail Analytics Pipeline – PostgreSQL Business Logic Simulation

This project simulates an end-to-end analytics workflow using a retail-style DVD rental dataset. It was developed to demonstrate skills in advanced SQL, business logic automation, and summary-level data reporting—mirroring the kind of work data analysts perform in real production environments.

## 🛠 Tools Used
- PostgreSQL
- pgAdmin
- PL/pgSQL
- SQL Triggers, Stored Procedures, User-Defined Functions

## 💡 Project Objective
To analyze customer rental activity by film category, generate actionable business insights, and simulate the automation of a business intelligence reporting workflow.

---

## 📈 Core Features

### 🔍 Revenue Summary by Category
- Aggregates total revenue per film category
- Calculates average revenue per rental
- Counts rentals by category

### 📋 Detailed Transaction Records
- Rental date, film title, customer name (via UDF)
- Payment amounts and staff handling the transaction

### ⚙️ Automation Components
- **User-Defined Function:** Combines customer first and last name into a standardized full name
- **Trigger + Trigger Function:** Automatically updates summary table when new data is inserted
- **Stored Procedure:** Refreshes both detailed and summary tables using a single procedure call
- **Suggested Scheduler:** pg_cron to automate monthly data refreshes

---

## 🗃 Database Objects

- `get_full_name()` – UDF to format customer names
- `detailed_category_revenue` – Full transaction-level table
- `summary_category_revenue` – Category performance table
- `refresh_category_revenue()` – Stored procedure to rebuild both tables
- `trg_update_summary_category_revenue` – Trigger on insert

---

## 🎯 Key Takeaways
This project highlights my ability to:
- Write efficient, readable SQL queries using multi-table joins
- Build reusable and automated business logic in SQL
- Design and build data structures/pipelines that support automating operational and strategic reports
- Simulate business use cases

---

## 🧠 What's Next
This framework can be adapted to:
- Modern ecommerce datasets
- KPI dashboards in Tableau/Power BI
- Operational pipelines for retail analytics

---

### 👋 Let’s Connect
Want to collaborate or see more?  
Check out my other projects or connect on [LinkedIn](https://www.linkedin.com/in/datawitchriv)!


